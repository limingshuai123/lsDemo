package com.util;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @Auther 笙
 * @Date 2020/12/27
 **/
public class BCryptPasswordEncoderUtils {
     private  static BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
     public  static  String encodePassword(String password){
         return bCryptPasswordEncoder.encode(password);
     }
     public  static  void  main(String[]args){
         String password="123123";
         String pwd = encodePassword(password);
         System.out.println(pwd);
         System.out.println(pwd.length());
         boolean f = bCryptPasswordEncoder.matches("123123",pwd);
         System.out.println(f);
     }

   // https://www.cnblogs.com/qianyi525/p/13837440.html
}
