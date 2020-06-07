package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.DepartmentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/depts")
    @ResponseBody
    public ReturnMsg getDeptsJson(@RequestParam(value = "pn", defaultValue = "1",required = false) Integer pn) {
        PageHelper.startPage(pn, 8);
        List<Department> depts = departmentService.getAll();
        PageInfo pageInfo = new PageInfo(depts, 5);
        return ReturnMsg.success().add("pageInfo",pageInfo);
    }

    @RequestMapping("/dept-list")
    public String list(@RequestParam(value = "pn",required = false,defaultValue = "1") Integer pn, Map<String,Object> map) {
        map.put("pn",pn);
        return "dept-list";
    }

    /*保存数据*/
    @RequestMapping(value = "/dept", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveEmp(@Valid Department department, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : result.getFieldErrors()) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors", map);
        } else {
            departmentService.save(department);
            return ReturnMsg.success();
        }
    }
    /*删除*/
    @RequestMapping(value = "/dept/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg deleteDept(@PathVariable("id") String ids) {

        if (departmentService.delete(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    /*修改页获取员工信息*/
    @RequestMapping(value = "/dept/{id}", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getEmp(@PathVariable("id") Integer id) {
        Department department = departmentService.getEmp(id);
        return ReturnMsg.success().add("dept", department);
    }


    @RequestMapping(value = "/dept/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg updateEmp(@Valid Department department, BindingResult result) {
        if (result.hasErrors()) {
            Map<String, Object> map = new HashMap<>();
            for (FieldError error : result.getFieldErrors()) {
                map.put(error.getField(), error.getDefaultMessage());
            }
            return ReturnMsg.fail().add("fieldErrors", map);
        } else {
            departmentService.updateEmp(department);
            return ReturnMsg.success();
        }
    }
}
