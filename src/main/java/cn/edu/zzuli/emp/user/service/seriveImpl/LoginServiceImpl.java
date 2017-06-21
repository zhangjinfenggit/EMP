package cn.edu.zzuli.emp.user.service.seriveImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.user.mapper.LoginMapper;
import cn.edu.zzuli.emp.user.service.LoginService;
import cn.edu.zzuli.emp.user.vo.Admin;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper = null;

	public Admin login(Admin user) throws Exception {

		return loginMapper.login(user);
	}

	public boolean updatePwd(Admin admin) throws Exception {

		int flag = loginMapper.updatePwd(admin);

		if (flag == 1) {
			return true;
		}

		return false;
	}

}
