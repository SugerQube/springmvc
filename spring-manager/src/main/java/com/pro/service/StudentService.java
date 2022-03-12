package com.pro.service;

import com.pro.pojo.Student;
import com.pro.pojo.Teacher;

import java.util.List;

public interface StudentService {
    //增加学生
    int addStudent(Student student);
    //删除学生
    int deleteStudentById(int id);
    //修改学生内容
    int updateStudent(Student student);
    //查询学生
    Student queryStudentById(int id);
    //查询全部学生
    List<Student> queryAllStudent();

    Teacher queryTeacherById(int id,String pwd);
}
