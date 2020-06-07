package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.EmployeeMapper;
import cn.edu.hzvtc.entity.Employee;
import cn.edu.hzvtc.entity.ReturnMsg;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;

    public int save(Employee employee) {
        employee.setCreateTime(new Date());
        return employeeMapper.insert(employee);
    }

    /*列表信息展示获取emp*/
    public List<Employee> getAll() {
        return employeeMapper.selectAllWithDept();
    }

    /*删除*/
    public Boolean delete(String ids) {
       /* Boolean result = false;
        if (employeeMapper.selectByPrimaryKey(id) != null) {
            if (employeeMapper.deleteByPrimaryKey(id) > 0) {
                result = true;
            }
        }*/
        Boolean result = false;
        if (ids.contains("-")) {
            //批量删除
            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            for (String str_id : str_ids) {
                del_ids.add(Integer.parseInt(str_id));
            }
            if (employeeMapper.deleteBatch(del_ids) > 0) {
                result = true;
            }

        } else {
            //单一删除
            Integer id = Integer.parseInt(ids);
            if (employeeMapper.selectByPrimaryKey(id) != null) {
                if (employeeMapper.deleteByPrimaryKey(id) > 0) {
                    result = true;
                }
            }
        }

        return result;
    }

    /*批量删除*/
    public Boolean deleteBatch(List<Integer> ids) {
        Boolean result = false;
        if (employeeMapper.deleteBatch(ids) > 0) {
            result = true;
        }
        return result;
    }

    /*保存*/
    public Boolean saveEmp(Employee employee) {
        Boolean result = false;
        employee.setCreateTime(new Date());
        if (employeeMapper.insert(employee) > 0) {
            result = true;
        }
        return result;
    }

    public Boolean chkEmpName(String empName) {
        Boolean result = false;
        Employee employee = new Employee();
        employee.setEmpName(empName);
        if (employeeMapper.selectByCondition(employee).size() == 0)
            result = true;
        return result;
    }

    /*修改*/
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        employee.setCreateTime(new Date());
        employeeMapper.updateByPrimaryKey(employee);
    }

}
