package cn.edu.zzuli.emp.user.mapper;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.user.vo.Admin;

@Repository
public interface LoginMapper {

	Admin login(Admin admin) throws Exception;

	int updatePwd(Admin admin) throws Exception;
}
