package cn.edu.zzuli.emp.user.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.zzuli.emp.user.service.LoginService;
import cn.edu.zzuli.emp.user.vo.User;

@Controller
public class LoginController {

	@Resource
	private LoginService loginService = null;

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
	public String login(User user, HttpServletRequest request) {

		boolean flag = loginService.login(user);

		if (flag) {
			request.getSession().setAttribute("userLogin", user);
			return "WEB-INF/jsp/html/worker";
		}
		request.setAttribute("mes", "账号或密码错误！");
		return "WEB-INF/jsp/html/login";
	}
}
