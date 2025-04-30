package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Transaction {
    CSKH ("Chăm Sóc Khách Hàng"),
    DDX ("Dẫn Đi Xem"),
    KHD("Dẫn Đi Ký Hợp Đồng");

    private final String code;

    Transaction(String code){
        this.code = code;
    }

    public static Map<String,String> type(){
        Map<String,String> listType = new TreeMap<>();
        for (Transaction item : Transaction.values()){
            listType.put(item.toString(),item.code);
        }
        return listType;
    }

}
