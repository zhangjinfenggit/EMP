package cn.edu.zzuli.emp.user.service.seriveImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.user.mapper.UserMapper;
import cn.edu.zzuli.emp.user.service.UserService;
import cn.edu.zzuli.emp.user.vo.User;
import cn.edu.zzuli.emp.util.PageUtil;

@Service
public class UserServiceImpl implements UserService {

	@Resource
	private UserMapper userMapper;

	public List<User> getUserList() throws Exception {

		return userMapper.getUserList();
	}

	public boolean inertUser(User user) {

		int flag = userMapper.inertUser(user);

		if (flag == 1) {
			return true;
		}

		return false;
	}

	public User getUserById(int id) {

		return userMapper.getUserById(id);
	}

	@Override
	public boolean delUserByid(int id) throws Exception {

		int flag = userMapper.delUserByid(id);

		if (flag == 1) {
			return true;
		}
		return false;
	}

	public Map<String, Object> getUserList(Map<String, Object> map) throws Exception {

		User user = (User) map.get("user");

		int Usercount = userMapper.getUserCount(user);

		((PageUtil) map.get("pageUtil")).setDataCount(Usercount);

		List<User> users = userMapper.listUser(map);

		map.put("users", users);

		return map;
	}

}
