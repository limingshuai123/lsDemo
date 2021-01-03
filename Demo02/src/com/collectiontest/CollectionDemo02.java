package com.collectiontest;

import java.util.ArrayList;

public class CollectionDemo02 {
    public  static ArrayList<Integer> listTest(int [] arr){
     
        ArrayList<Integer> arrayList = new ArrayList<>();
        
        for (int arrs :arr) {
            arrayList.add(arrs);
        }
        return arrayList;
    }

    public static void main(String[] args) {
       
        int [] arr = {1,2,3,4,5};
        ArrayList<Integer> list = listTest(arr);
        System.out.println(list);
    }
}
