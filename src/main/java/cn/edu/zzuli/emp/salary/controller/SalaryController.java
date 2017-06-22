package cn.edu.zzuli.emp.salary.controller;

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
import cn.edu.zzuli.emp.news.vo.News;
import cn.edu.zzuli.emp.salary.service.SalaryService;
import cn.edu.zzuli.emp.salary.vo.Salary;
import cn.edu.zzuli.emp.util.PageUtil;
import net.sf.json.JSONObject;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月19日下午7:24:29 TODO
 */
@Controller
public class SalaryController {

	@Resource
	private SalaryService salaryService;

	/**
	 * 跳转到薪水页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpSalary")
	public String jumpSalary(Salary salary, PageUtil pageUtil, HttpServletRequest request) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("salary", salary);
		map.put("pageUtil", pageUtil);

		Map<String, Object> data = salaryService.getNewsList(map);

		List<Salary> salarys = (List<Salary>) data.get("salarys");

		request.setAttribute("salarys", ((List<News>) data.get("salarys")));
		request.setAttribute("searchName", salary.getId());
		request.setAttribute("PageUtil", ((PageUtil) data.get("pageUtil")));

		return "WEB-INF/jsp/html/wages";
	}

	@RequestMapping("insertSalary")
	public String insertSalary(Salary salary) throws Exception {

		boolean flag = salaryService.insertSalary(salary);
		if (flag)
			return "redirect:jumpSalary";

		throw new CustomExceprion("添加失败！！");
	}

	@RequestMapping("getSalaryById")
	public void getSalaryById(int id, HttpServletResponse response) throws Exception {
		PrintWriter pw = null;
		Salary salary = null;
		try {
			response.setContentType("text/json;charset=UTF-8");
			pw = response.getWriter();
			salary = salaryService.getSalaryById(id);

		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONObject jsonObject = JSONObject.fromObject(salary);
		pw.write(jsonObject.toString());
		pw.close();
		pw = null;
	}

	@RequestMapping("updatetSalary")

	public String updatetSalary(Salary salary) throws Exception {

		boolean flag = salaryService.updatetSalary(salary);

		if (flag)
			return "redirect:jumpSalary";
		throw new CustomExceprion("修改失败！！");

	}

	@RequestMapping("delSalary")
	public String delSalaryById(int id) throws Exception {
		boolean flag = salaryService.delSalaryById(id);

		if (flag)
			return "redirect:jumpSalary";
		throw new CustomExceprion("删除失败！！");

	}
}