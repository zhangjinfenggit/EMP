package cn.edu.zzuli.emp.user.service;

import cn.edu.zzuli.emp.user.vo.Admin;

public interface LoginService {

	Admin login(Admin admin) throws Exception;

	boolean updatePwd(Admin admin) throws Exception;
}
