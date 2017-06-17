package cn.edu.zzuli.emp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.edu.zzuli.emp.user.vo.User;

/**
 * 登录校验拦截器
 * 
 * @author zhangjinfeng
 * @date 2017年6月17日下午12:47:49 TODO
 */
public class LoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		String path = handler.toString().toLowerCase();

		if (path.contains("login")) {
			return true;
		}

		User user = (User) request.getSession().getAttribute("userLogin");
		if (user == null) {
			request.getRequestDispatcher("login").forward(request, response);
			return false;
		}

		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
