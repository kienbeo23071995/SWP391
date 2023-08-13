/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ulti;

import Model.FeedBackSystem;
import Model.House;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * 
 */
public class Pagination {
    public static List<House> Paging(int pageNum,int size,List<House> list){
        if(list == null || list.isEmpty()){
            return new ArrayList<>();
        }
        return list.subList(size * (pageNum - 1), size * pageNum < list.size() ? size * pageNum : (list.size()));
    }
    
    public static List<FeedBackSystem> PagingFeedBack(int pageNum,int size,List<FeedBackSystem> list){
        if(list.isEmpty()){
            return new ArrayList<>();
        }
        return list.subList(size * (pageNum - 1), size * pageNum < list.size() ? size * pageNum : (list.size()));
    }
    
    public static List PagingCommon(int pageNum,int size,List list){
        if(list.isEmpty()){
            return new ArrayList<>();
        }
        return list.subList(size * (pageNum - 1), size * pageNum < list.size() ? size * pageNum : (list.size()));
    }
}
