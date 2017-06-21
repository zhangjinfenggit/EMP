package cn.edu.zzuli.emp.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.zzuli.emp.exception.CustomExceprion;
import cn.edu.zzuli.emp.user.service.UserService;
import cn.edu.zzuli.emp.user.vo.User;
import cn.edu.zzuli.emp.util.PageUtil;
import net.sf.json.JSONObject;

@Controller
public class UserController {

	@Resource
	private UserService userService;

	/**
	 * 插入一名员工信息
	 * 
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("inertUser")
	public String inertUser(User user, HttpServletRequest request, PageUtil pageUtil) throws Exception {

		// user.setAddress(new String(user.getAddress().getBytes("iso-8859-1"),
		// "utf-8"));
		// user.setDept(new String(user.getDept().getBytes("iso-8859-1"),
		// "utf-8"));
		// user.setEducation(new
		// String(user.getEducation().getBytes("iso-8859-1"), "utf-8"));
		// user.setName(new String(user.getName().getBytes("iso-8859-1"),
		// "utf-8"));
		// user.setPosition(new
		// String(user.getPosition().getBytes("iso-8859-1"), "utf-8"));
		// user.setSex(new String(user.getSex().getBytes("iso-8859-1"),
		// "utf-8"));
		boolean flag = userService.inertUser(user);

		if (flag) {

			return "redirect:listUser";
		}
		throw new CustomExceprion("添加失败！！");
	}

	/**
	 * 根据ID查询信息
	 * 
	 * @param response
	 * @param id
	 */
	@RequestMapping("getUserByid")
	public void getUserById(HttpServletResponse response, int id) throws Exception {

		PrintWriter pw = null;
		User user = null;
		try {
			response.setContentType("text/json;charset=UTF-8");
			pw = response.getWriter();
			user = userService.getUserById(id);

		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject jsonObject = JSONObject.fromObject(user);
		pw.write(jsonObject.toString());
		pw.close();
		pw = null;

	}

	/**
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("delUserByid")
	public String delUserByid(int id) throws Exception {

		boolean flag = userService.delUserByid(id);

		if (flag) {
			return "redirect:listUser";
		}
		throw new CustomExceprion("删除失败！！");
	}

	@RequestMapping("listUser")
	public String listUser(HttpServletRequest request, User user, PageUtil pageUtil) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", user);
		map.put("pageUtil", pageUtil);

		Map<String, Object> data = userService.getUserList(map);

		List<User> users = (List<User>) data.get("users");

		request.setAttribute("users", ((List<User>) data.get("users")));
		request.setAttribute("searchName", user.getName());
		request.setAttribute("PageUtil", ((PageUtil) data.get("pageUtil")));

		return "WEB-INF/jsp/html/worker";
	}

}
