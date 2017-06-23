package cn.edu.zzuli.emp.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * 统一异常处理器
 * 
 * @author zhangjinfeng
 * @date 2017年6月17日下午1:29:29 TODO
 */
@ControllerAdvice
public class CommHandlerException {

	@ExceptionHandler(value = Exception.class)
	public ModelAndView showException(Exception e) {

		ModelAndView model = new ModelAndView();

		System.err.println("出错了。。。。。。");
		System.err.println(e.getMessage());
		model.addObject("mes", e.getMessage());
		model.setViewName("error");
		return model;
	}
}
