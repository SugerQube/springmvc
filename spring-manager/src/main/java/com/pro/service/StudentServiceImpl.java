package com.pro.service;

import com.pro.dao.StudentMapper;
import com.pro.pojo.Student;
import com.pro.pojo.Teacher;

import java.util.List;

public class StudentServiceImpl implements StudentService {

    private StudentMapper studentMapper;
    public void setStudentMapper(StudentMapper studentMapper){
        this.studentMapper=studentMapper;
    }
    public int addStudent(Student student) {
        return studentMapper.addStudent(student);
    }

    public int deleteStudentById(int id) {
        return studentMapper.deleteStudentById(id);
    }

    public int updateStudent(Student student) {
        return studentMapper.updateStudent(student);
    }

    public Student queryStudentById(int id) {
        return studentMapper.queryStudentById(id);
    }

    public List<Student> queryAllStudent() {
        return studentMapper.queryAllStudent();
    }

    public Teacher queryTeacherById(int id,String pwd) {
        return studentMapper.queryTeacherById(id, pwd);
    }


}
