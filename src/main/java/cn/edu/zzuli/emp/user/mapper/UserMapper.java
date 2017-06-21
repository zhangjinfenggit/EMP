package cn.edu.zzuli.emp.user.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.user.vo.User;

@Repository
public interface UserMapper {

	List<User> getUserList();

	int inertUser(User user);

	User getUserById(int id);

	int delUserByid(int id);

	int getUserCount(User user);

	List<User> listUser(Map<String, Object> map);

}
