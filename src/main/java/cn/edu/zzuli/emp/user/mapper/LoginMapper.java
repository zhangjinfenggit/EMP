package cn.edu.zzuli.emp.user.mapper;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.user.vo.User;

@Repository
public interface LoginMapper {

	User login(User user);

}
