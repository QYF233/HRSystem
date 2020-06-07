package cn.edu.hzvtc.controller;


import cn.edu.hzvtc.dao.AccountMapper;
import cn.edu.hzvtc.entity.Account;
import cn.edu.hzvtc.entity.ReturnMsg;
import cn.edu.hzvtc.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

@SessionAttributes(value = {"user"}, types = {String.class})
@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping(value = "/exit", method = RequestMethod.GET)
    public String exit(SessionStatus sessionStatus,HttpSession session) {
        sessionStatus.setComplete();
        session.removeAttribute("username");
        session.removeAttribute("password");
        session.removeAttribute("rem");
        session.invalidate();
//        return "login";
        return "redirect:/login";
    }
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String intoLogin(@SessionAttribute(value = "password", required = false) String password,
                            @SessionAttribute(value = "rem", required = false) String rem,
                            Map<String, Object> map) {
        if (rem != null) {
            if (rem.equals("checked")) {
                map.put("password", password);
            } else {
                map.put("password", "");
            }
        }
        return "login";
    }
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg login(@CookieValue(name = "hitCounter",defaultValue = "1") Long hitCounter, HttpServletResponse response,
                           String username, String password, String rem, Map<String, Object> map) {
        /*登录次数统计*/
        hitCounter++;
        Cookie  hit = new Cookie("hitCounter",hitCounter.toString());
        hit.setMaxAge(60);
        response.addCookie(hit);
        /*登录验证*/
        if (username != null && password != null) {
            String pwd = accountService.getPwdByName(username);
            if (pwd != null) {//密码存在
                map.put("username", username);
                if (pwd.equals(password)) {//密码相同
                    Account user = new Account(username, password);
                    map.put("user", user);
                    if (rem.equals("true")) {
                        map.put("rem", "checked");
                        map.put("password", password);
                    } else
                        map.put("rem", "");
                    return ReturnMsg.success();
                } else
                    return ReturnMsg.fail().add("fail_msg", "密码不正确");
            }
        }
        return ReturnMsg.fail();
    }

    @RequestMapping("/index")
    public String index(@SessionAttribute(value = "user", required = false) Account user,
                        Map<String, Object> map) {
        if (user == null) {
            return "login";
        } else {
            map.put("accName", user.getUsername());
            return "index";
        }
    }

    /*验证员工名称*/
    @RequestMapping(value = "/checkAccName")
    @ResponseBody
    public ReturnMsg checkAccName(@RequestParam("username") String username) {
        if (accountService.chkEmpName(username)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail().add("fail_msg", "用户名不存在，请注册");
    }

    //注解方式获取cookie中对应的key值

    @RequestMapping("/getCookieValue")
    @ResponseBody
    public String getCookieValue(@CookieValue("hitCounter") String hitCounter ) {
        //前提是已经创建了或者已经存在cookie了，那么下面这个就直接把对应的key值拿出来了。
        System.out.println("testCookieValue,hitCounter="+hitCounter);

        return hitCounter;
    }
}
