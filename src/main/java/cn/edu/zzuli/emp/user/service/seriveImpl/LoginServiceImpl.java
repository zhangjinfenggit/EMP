package cn.edu.zzuli.emp.user.service.seriveImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.user.mapper.LoginMapper;
import cn.edu.zzuli.emp.user.service.LoginService;
import cn.edu.zzuli.emp.user.vo.User;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private LoginMapper loginMapper = null;

	public boolean login(User user) {

		User existUser = loginMapper.login(user);

		if (existUser == null) {
			return false;
		}

		return true;
	}

}
