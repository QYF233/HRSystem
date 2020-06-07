package cn.edu.hzvtc.service;

import cn.edu.hzvtc.dao.AccountMapper;
import cn.edu.hzvtc.entity.Account;
import cn.edu.hzvtc.entity.Employee;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountService {
    @Autowired
    private AccountMapper accountMapper;

    public List<Account> getAll(){
        return accountMapper.selectAll();
    }

/*    public Account getAccByName(String username){
       return accountMapper.selectByName(username);
    }*/

    public String getPwdByName(String username){
        return accountMapper.selectPwdByName(username);
    }

    public Boolean chkEmpName(String username){
        Boolean result = false;
        if (accountMapper.checkName(username)!=null)
            result = true;
        return result;
    }

}
