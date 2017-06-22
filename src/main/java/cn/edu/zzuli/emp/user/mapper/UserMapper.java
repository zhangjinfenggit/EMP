package cn.edu.zzuli.emp.user.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.user.vo.User;

@Repository
public interface UserMapper {

	List<User> getUserList() throws Exception;

	int inertUser(User user) throws Exception;

	User getUserById(int id) throws Exception;

	int delUserByid(int id) throws Exception;

	int getUserCount(User user) throws Exception;

	List<User> listUser(Map<String, Object> map) throws Exception;

	int updateUser(User user) throws Exception;

}
