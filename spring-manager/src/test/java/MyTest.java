import com.pro.pojo.Student;
import com.pro.pojo.Teacher;
import com.pro.service.StudentService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
    public Student getMyStudent(){
        Student studentX=new Student();
        studentX.setId(7);
        studentX.setPwd("7");
        studentX.setPhone("7");
        studentX.setTime(0);
        studentX.setName("晶九");
        studentX.setDepartment("体育");
        studentX.setCard("007");
        studentX.setApprove("等待部门通过");
        studentX.setMoney("等待提交");
        return studentX;
    }
    @Test
    public void test() {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        StudentService studentServiceImpl = (StudentService) context.getBean("studentServiceImpl");
        List<Student> list = studentServiceImpl.queryAllStudent();
        for (Student student : list) {
            System.out.println(student);
        }


    }
}
