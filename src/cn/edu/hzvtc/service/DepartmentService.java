package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.DepartmentMapper;
import cn.edu.hzvtc.entity.Department;
import cn.edu.hzvtc.entity.Employee;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getAll(){
        return departmentMapper.selectAll();
    }

    public int save(Department department) {
        return departmentMapper.insert(department);
    }
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
            if (departmentMapper.deleteBatch(del_ids) > 0) {
                result = true;
            }

        } else {
            //单一删除
            Integer id = Integer.parseInt(ids);
            if (departmentMapper.selectByPrimaryKey(id) != null) {
                if (departmentMapper.deleteByPrimaryKey(id) > 0) {
                    result = true;
                }
            }
        }
        return result;
    }

    /*修改*/
    public Department getEmp(Integer id) {
        return departmentMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Department department) {
        departmentMapper.updateByPrimaryKey(department);
    }
}


