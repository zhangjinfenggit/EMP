package cn.edu.zzuli.emp.user.service;

import java.util.Map;

import cn.edu.zzuli.emp.user.vo.User;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月19日上午9:00:00 TODO
 */
public interface UserService {

	/**
	 * 获取所有用户信息
	 * 
	 * @return
	 */
	Map<String, Object> getUserList(Map<String, Object> map) throws Exception;

	/**
	 * 添加员工
	 * 
	 * @param user
	 * @return
	 */
	boolean inertUser(User user) throws Exception;

	/**
	 * 根据ID查询信息
	 * 
	 * @param id
	 * @return
	 */
	User getUserById(int id) throws Exception;

	/**
	 * 根据ID删除信息
	 * 
	 * @param id
	 * @return
	 */
	boolean delUserByid(int id) throws Exception;

	boolean updateUser(User user) throws Exception;

}
