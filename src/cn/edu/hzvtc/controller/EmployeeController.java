package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.DepartmentService;
import cn.edu.hzvtc.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@SessionAttributes()
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private DepartmentService departmentService;
    /*excel*/
    @RequestMapping("/testExcel")
    public String testExcel(Map<String, Object> map) {
        List<Employee> emps = employeeService.getAll();
        map.put("emps",emps);
        return "myExcelView";
    }
    /*    @RequestMapping("/list")
        public String list(@RequestParam(value = "pn", required = false,defaultValue = "1") Integer pn, Map<String, Object> map) {
            //分页过程：引入Jar包，配置拦截器-代码实现
            //查询之前需要传入当前页码和每页大小
            PageHelper.startPage(pn, 10);

            //startPage方法紧跟的select查询就是一个分页查询
            List<Employee> emps = employeeService.getAll();

            //使用PageInfo封装查询结果
            PageInfo pageInfo = new PageInfo(emps, 5);

    //        map.put("emps",emps);
            map.put("pageInfo", pageInfo);

            return "list";
        }*/
    /*lis展示*/
    @RequestMapping("/emps")
    @ResponseBody
    public ReturnMsg getEmpsJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 8);
        List<Employee> emps = employeeService.getAll();
        PageInfo pageInfo = new PageInfo(emps, 5);
        return ReturnMsg.success().add("pageInfo", pageInfo);
    }

    @RequestMapping("/list")
    public String list(@RequestParam(value = "pn",required = false,defaultValue = "1") Integer pn,Map<String,Object> map) {
        map.put("pn",pn);
        return "list";
    }

    /*删除*/
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg deleteEmp(@PathVariable("id") String ids) {

        if (employeeService.delete(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /*input查询部门*/
    @RequestMapping("/input")
    public String getEmp(Map<String, Object> map) {
        List<Department> depts = departmentService.getAll();
        map.put("depts", depts);

        return "input";
    }

    /*保存数据*/
    @RequestMapping(value = "/emp", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : result.getFieldErrors()) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors", map);
        } else {
            employeeService.saveEmp(employee);
            return ReturnMsg.success();
        }
    }

    /*验证员工名称*/
    @RequestMapping(value = "/checkEmpName")
    @ResponseBody
    public ReturnMsg checkEmpName(@RequestParam("empName") String empName) {
        String regex = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)";
        if (!empName.matches(regex)) {
            return ReturnMsg.fail().add("fail_msg", "用户名必须是2-5位中文或6-16位英文和数字的组合！");
        }
        if (employeeService.chkEmpName(empName)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail().add("fail_msg", "用户名重复，不可用");
    }

    /*修改页获取员工信息*/
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return ReturnMsg.success().add("emp", employee);
    }

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg updateEmp(@Valid Employee employee, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : result.getFieldErrors()) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors", map);
        } else {
            employeeService.updateEmp(employee);
            return ReturnMsg.success();
        }
    }
    @RequestMapping("/edit/{id}")
    public String edit(@PathVariable("id") String id, Map<String, Object> map) {
        if(id.contains("-")){
            String[] s = id.split("-");
            map.put("empId",s[0]);
            map.put("pn",s[1]);
        }
        return "edit";
    }



}
