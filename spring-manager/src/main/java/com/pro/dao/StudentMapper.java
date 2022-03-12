package com.pro.dao;

import com.pro.pojo.Student;
import com.pro.pojo.Teacher;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StudentMapper {

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
    //查询老师
    Teacher queryTeacherById(@Param("id") int id, @Param("pwd") String pwd);

}
