import java.util.ArrayList;
import java.util.Collection;

public class CollectionDemo01 {
    
    public static int listTest(Collection<String> list,String str){
        
        int num =0;
       
        for(String s : list){
          
            if (str.equals(s)){
             
                num++;
            }
        }
        return num;
    }
    public static void main(String[] args) {
        Collection<String> list = new ArrayList<>();
        list.add("a");
        list.add("a");
        list.add("b");
        list.add("b");
        list.add("c");
        System.out.println("a:"+listTest(list,"a"));
        System.out.println("b:"+listTest(list,"b"));
        System.out.println("c:"+listTest(list,"c"));
        System.out.println("xxx:"+listTest(list,"xxx"));
    }
}
