package cn.edu.hzvtc.test;


import cn.edu.hzvtc.entity.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

//import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml", "file:./web/WEB-INF/dispatcherServlet-servlet.xml"})
public class MVCTest {

    @Autowired
    private WebApplicationContext context;

    private MockMvc mockMvc;

    @Before
    public void initMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

    @Test
    public void testList() throws Exception {
        //1.发生/list请求,并获得返回结果
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/list")).andReturn();
        //2.查看请求返回结果
        HttpServletRequest request = result.getRequest();
        List<Employee> emps = (List<Employee>) request.getAttribute("emps");
        System.out.println(emps.toString());

        PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
        for (int i : pageInfo.getNavigatepageNums()) {
            System.out.println(i + "  ");
        }
        System.out.println(pageInfo.getPageNum());
        System.out.println(pageInfo.getPages());
        System.out.println(pageInfo.getTotal());
        System.out.println(pageInfo.getList());

    }


}
