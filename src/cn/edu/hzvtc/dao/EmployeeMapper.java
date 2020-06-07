package cn.edu.hzvtc.dao;

import cn.edu.hzvtc.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbg.generated Mon May 25 18:08:25 CST 2020
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbg.generated Mon May 25 18:08:25 CST 2020
     */
    int insert(Employee record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbg.generated Mon May 25 18:08:25 CST 2020
     */
    Employee selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbg.generated Mon May 25 18:08:25 CST 2020
     */
    List<Employee> selectAll();

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table tbl_emp
     *
     * @mbg.generated Mon May 25 18:08:25 CST 2020
     */
    int updateByPrimaryKey(Employee record);


    List<Employee> selectAllWithDept();

    /*指定key为变量名*/
    int deleteBatch(@Param("ids") List<Integer> ids);

    List<Employee> selectByCondition(Employee employee);

}