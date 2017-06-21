package cn.edu.zzuli.emp.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.zzuli.emp.exception.CustomExceprion;
import cn.edu.zzuli.emp.user.service.LoginService;
import cn.edu.zzuli.emp.user.service.UserService;
import cn.edu.zzuli.emp.user.vo.Admin;
import cn.edu.zzuli.emp.user.vo.User;
import cn.edu.zzuli.emp.util.PageUtil;

@Controller
public class LoginController {

	@Resource
	private LoginService loginService = null;
	@Resource
	private UserService userService;

	/**
	 * 跳转到登录界面
	 * 
	 * @return
	 */
	@RequestMapping("jumpLogin")
	public String jumpLogin() {

		return "WEB-INF/jsp/html/login";
	}

	/**
	 * 登录校验
	 * 
	 * @return
	 */
	@RequestMapping("login")
	public String login(Admin admin, HttpServletRequest request, User user, PageUtil pageUtil) throws Exception {

		Admin existAdmin = loginService.login(admin);

		if (existAdmin != null) {
			request.getSession().setAttribute("userLogin", existAdmin);

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("user", user);
			map.put("pageUtil", pageUtil);
			Map<String, Object> data = userService.getUserList(map);

			request.setAttribute("users", ((List<User>) data.get("users")));
			request.setAttribute("PageUtil", ((PageUtil) data.get("pageUtil")));
			return "WEB-INF/jsp/html/worker";
		}
		request.setAttribute("mes", "账号或密码错误！");
		return "WEB-INF/jsp/html/login";
	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	@RequestMapping("logout")
	public String logout(HttpServletRequest request) throws Exception {

		request.getSession().invalidate();

		return "index";
	}

	@RequestMapping("updatePwd")
	public String updatePwd(HttpServletRequest request, Admin user) throws Exception {

		boolean flag = loginService.updatePwd(user);

		if (flag) {
			request.getSession().invalidate();
			return "index";
		}

		throw new CustomExceprion("修改失败");
	}
}
