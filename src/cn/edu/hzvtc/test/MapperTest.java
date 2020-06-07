package cn.edu.hzvtc.test;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.service.EmployeeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Autowired
    private EmployeeService employeeService;

    @Test
    public void testInsertDept() {
        Department department = new Department(null, "市场部");
        departmentMapper.insert(department);
    }

    @Test
    public void testInsertEmp() throws Exception {
        for (int i = 0; i < 200; i++) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            int gender = i % 2;
            int dept = (i % 4) + 1;
            Employee employee = new Employee(null, "小明" + i, gender + "", sdf.parse("1999-11-9"), "xiaoming" + i + "@qq.com", 100F, dept);
            employeeService.save(employee);
        }
    }


}
