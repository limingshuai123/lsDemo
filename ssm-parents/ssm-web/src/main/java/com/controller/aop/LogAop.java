package com.controller.aop;

import com.domain.SysLog;
import com.service.ISysLogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.omg.CORBA.PRIVATE_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * @Auther 笙
 * @Date 2020/12/25
 **/
@Component
@Aspect
public class LogAop {
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;

    private Date visitTime;//开始时间
    private  Class clazz;//访问类
    private Method method;//访问的方法
    //前置通知：主要是i获取开始的时间,执行的类是哪一个,执行的是哪个方法
    @Before("execution(* com.controller.*.*(..))")
    public  void doBefore(JoinPoint joinPoint) throws NoSuchMethodException {
        visitTime = new Date();//当前时间：就是开始访问的时间

        clazz = joinPoint.getTarget().getClass();//具体访问的类
        String methodName = joinPoint.getSignature().getName();//获取访问的方法名称
        Object [] objects = joinPoint.getArgs();//获取访问的方法的参数
        //获取具体执行方法的method对象
        if (objects == null||objects.length==0) {
            method=clazz.getMethod(methodName);//获取无参方法
        }else {
            Class[] classes = new Class[objects.length];
            for (int i = 0; i < objects.length; i++) {
                classes[i] =objects[i].getClass();
            }
            clazz.getMethod(methodName,classes);//获取有参方法
        }

    }
    @After("execution(* com.controller.*.*(..))")
    public void doAfter() {
        long time = new Date().getTime() - visitTime.getTime();//获取访问时长
        String url = "";
        //获取url
        //获取类上的@RequestMapping
        if (clazz != null && method != null && clazz != LogAop.class) {
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (classAnnotation != null) {
                String[] classValue = classAnnotation.value();
                //获取方法上的@RequestMapping
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];
                    //获取访问ip
                    String ip = request.getRemoteAddr();
                    //获取当前操作的用户
                    SecurityContext context = SecurityContextHolder.getContext();//从上往下获取当前登录的用户
                    User user = (User) context.getAuthentication().getPrincipal();
                    //用户名
                    String username = user.getUsername();
                    //将日志相关信息封装到syslog对象
                    SysLog sysLog = new SysLog();
                    sysLog.setExecutionTime(time);
                    sysLog.setIp(ip);
                    sysLog.setMethod("[类名]"+clazz.getName()+"[方法名]"+method.getName());
                    sysLog.setUrl(url);
                    sysLog.setUsername(username);
                    sysLog.setVisitTime(visitTime);
                    sysLogService.save(sysLog);
                }
            }
        }

    }


}
