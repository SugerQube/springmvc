package com.pro.controller;

import com.pro.pojo.Login;
import com.pro.pojo.Student;
import com.pro.pojo.Teacher;
import com.pro.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/manager")
public class AdminController {

    @Autowired
    @Qualifier("studentServiceImpl")
    private StudentService studentService;

    @RequestMapping("/user")
    public String list1(Model model,@ModelAttribute(value = "user")Login user) {
        System.out.println(user);
        if(user.getDepartment().equals("管理员")){
            if(user.getUserName().equals("admin")&user.getPassword().equals("admin")){
                List<Student> list = studentService.queryAllStudent();
                model.addAttribute("list", list);
                return "allStudent";
            }else {
                return "index";
            }
        }else if(user.getDepartment().equals("老师")){
            Teacher teacher =studentService.queryTeacherById(Integer.parseInt(user.getUserName()),user.getPassword());
            if (teacher!=null){
                model.addAttribute("oneTeacher",teacher);
                List<Student> list = studentService.queryAllStudent();
                model.addAttribute("list",list);
                return "Teacher";
            }else {
                return "index";
            }
        }else {
            Student student = studentService.queryStudentById(Integer.parseInt(user.getUserName()));
            if(student==null){
                return "index";
            }else if(student.getPwd().equals(user.getPassword())){
                model.addAttribute("oneStudent",student);
                return "Student";
            }else {
                return "index";
            }
        }
    }

    @RequestMapping("/admin")
    public String switch1(Model model, String mod){
       if(mod.equals("student")){
           List<Student> list = studentService.queryAllStudent();
           model.addAttribute("list", list);
           return "allStudent";
       }else {
           List<Teacher> list=new ArrayList<Teacher>();
           int id=1;
           while (true){
               Teacher teacher=studentService.queryTeacherById(id,id+"");
               id++;
               if(teacher==null){
                   break;
               }
               list.add(teacher);
           }
           model.addAttribute("list", list);
           return "allTeacher";
       }
    }

    @RequestMapping("/toAddStudent")
    public String toAddStudents() {
        return "do/addStudent";
    }

    @RequestMapping("/addStudent")
    public String addStudents(Model model,Student student) {
        System.out.println(student);
        studentService.addStudent(student);
        List<Student> list = studentService.queryAllStudent();
        model.addAttribute("list", list);
        model.addAttribute("mod", "student");
        return "allStudent";
    }

    @RequestMapping("/delStudent")
    public String deleteStudents(Model model,int id) {
        studentService.deleteStudentById(id);
        List<Student> list = studentService.queryAllStudent();
        model.addAttribute("list", list);
        model.addAttribute("mod", "student");
        return "allStudent";
    }

    @RequestMapping("/toUpdateStudent")
    public String toUpdateStudents(Model model, int id) {
        Student student = studentService.queryStudentById(id);
        System.out.println(student);
        model.addAttribute("student",student );
        return "do/updateStudent";
    }

    @RequestMapping("/updateStudent")
    public String updateStudents(Model model,Student student) {
        System.out.println(student);
        studentService.updateStudent(student);

        List<Student> list = studentService.queryAllStudent();
        model.addAttribute("list", list);
        model.addAttribute("mod", "student");
        return "allStudent";
    }

    @RequestMapping("/submit1")
    public String updateStudent(Model model,Student newStudent) {
        Student old=studentService.queryStudentById(newStudent.getId());
        System.out.println(newStudent);
        if(!old.getDepartment().equals(newStudent.getDepartment())){
            newStudent.setApprove("等待部门审核通过");
        }
        studentService.updateStudent(newStudent);

        model.addAttribute("oneStudent",newStudent);
        return "Student";
    }

    @RequestMapping("/pass1")
    public String pass1(Model model,int id,int tid,RedirectAttributes redirectAttributes) {
        Student student = studentService.queryStudentById(id);
        student.setApprove("等待教务审核通过");
        studentService.updateStudent(student);
        return logTeacher(model,tid,redirectAttributes);
    }
    @RequestMapping("/pass2")
    public String pass2(Model model,int id,int tid,RedirectAttributes redirectAttributes) {
        Student student = studentService.queryStudentById(id);
        student.setApprove("在职");
        student.setMoney("等待提交");
        studentService.updateStudent(student);
        return logTeacher(model,tid,redirectAttributes);
    }

    @RequestMapping("/no")
    public String no(Model model,int id,int tid,RedirectAttributes redirectAttributes) {
        Student student = studentService.queryStudentById(id);
        student.setApprove("");
        student.setDepartment("");
        studentService.updateStudent(student);
        return logTeacher(model,tid,redirectAttributes);
    }
    @RequestMapping("/money1")
    public String money1(Model model,int id,int tid,RedirectAttributes redirectAttributes) {
        Student student = studentService.queryStudentById(id);
        student.setMoney("等待发放");
        studentService.updateStudent(student);
        return logTeacher(model,tid,redirectAttributes);
    }
    @RequestMapping("/money2")
    public String money2(Model model,int id,int tid,RedirectAttributes redirectAttributes) {
        Student student = studentService.queryStudentById(id);
        student.setTime(0);
        student.setMoney("等待提交");
        studentService.updateStudent(student);
        return logTeacher(model,tid,redirectAttributes);
    }

    public String logTeacher(Model model,int tid,RedirectAttributes redirectAttributes){
        Login login=new Login(tid+"",tid+"","老师");
        redirectAttributes.addFlashAttribute("user",login);
        return "redirect:/manager/user";
    }



}
