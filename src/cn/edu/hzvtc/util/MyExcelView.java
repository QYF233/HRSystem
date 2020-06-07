package cn.edu.hzvtc.util;


import cn.edu.hzvtc.entity.Employee;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.*;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.document.AbstractXlsxView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

@Component
public class MyExcelView extends AbstractXlsxView {

    @Override
    protected void buildExcelDocument(Map<String, Object> map, Workbook workbook,
                                      HttpServletRequest httpServletRequest,
                                      HttpServletResponse httpServletResponse) throws Exception {

        Sheet sheet = workbook.createSheet("员工信息表");
        sheet.setColumnWidth(3, 3500);
        Row row1 = sheet.createRow(0);
        for (int i = 0; i < 8; i++) {
            // 调整每一列宽度
            sheet.autoSizeColumn((short) i);
            // 解决自动设置列宽中文失效的问题
            sheet.setColumnWidth(i, sheet.getColumnWidth(i) * 17 / 10);
        }
        sheet.setColumnWidth(4, 5000);
        sheet.setColumnWidth(6, 5000);
   /*     CellStyle style = workbook.createCellStyle();//边框样式
        style.setBorderBottom(BorderStyle.THIN);
        style.setBorderLeft(BorderStyle.THIN);
        style.setBorderRight(BorderStyle.THIN);
        style.setBorderTop(BorderStyle.THIN);
*/
        CellStyle style1 = workbook.createCellStyle();
       /* style1.cloneStyleFrom(style);//复制边框样式*/
        Font font = workbook.createFont();
        font.setBold(true);//粗体显示
        style1.setAlignment(HorizontalAlignment.CENTER);//单元格居中对齐
        style1.setFont(font);

        row1.createCell(0).setCellValue("ID");
        row1.createCell(1).setCellValue("姓名");
        row1.createCell(2).setCellValue("性别");
        row1.createCell(3).setCellValue("生日");
        row1.createCell(4).setCellValue("Email");
        row1.createCell(5).setCellValue("薪水");
        row1.createCell(6).setCellValue("创建日期");
        row1.createCell(7).setCellValue("部门");

        for (int i = 0; i < 8; i++) {
            row1.getCell(i).setCellStyle(style1);
        }

        SimpleDateFormat f = new SimpleDateFormat("yyyy 年 MM 月 dd 日");
        List<Employee> emps = (List<Employee>) map.get("emps");
        int index = 1;
        for (Employee emp:emps) {
            Row row = sheet.createRow(index++);
            row.createCell(0).setCellValue(emp.getId());
            row.createCell(1).setCellValue(emp.getEmpName());
            if(emp.getEmpGender().equals("1")){
                row.createCell(2).setCellValue("男");
            }else{
                row.createCell(2).setCellValue("女");
            }
            row.createCell(3).setCellValue(f.format(emp.getEmpBirthday()));
            row.createCell(4).setCellValue(emp.getEmpEmail());
            row.createCell(5).setCellValue(emp.getEmpSalary());
            row.createCell(6).setCellValue(f.format(emp.getCreateTime()));
            row.createCell(7).setCellValue(emp.getDepartment().getDeptName());
        }


        OutputStream ouputStream = httpServletResponse.getOutputStream();
        httpServletResponse.reset();
        String filename = "employee.xlsx";
        httpServletResponse.setHeader("content-disposition", "attachment;filename=" + filename);
        httpServletResponse.setContentType("application/ms-excel; charset=UTF-8");
        httpServletResponse.setCharacterEncoding("UTF-8");
        workbook.write(ouputStream);
        ouputStream.flush();
        ouputStream.close();
    }
}

