package com.pro.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private int id;
    private String pwd;
    private String phone;
    private int time;
    private String name;
    private String department;
    private String card;
    private String approve;
    private String money;
}
