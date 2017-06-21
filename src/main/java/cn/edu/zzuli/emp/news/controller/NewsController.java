package cn.edu.zzuli.emp.news.controller;

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
import cn.edu.zzuli.emp.news.service.NewsService;
import cn.edu.zzuli.emp.news.vo.News;
import cn.edu.zzuli.emp.user.vo.User;
import cn.edu.zzuli.emp.util.PageUtil;
import net.sf.json.JSONObject;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月19日下午7:17:40 TODO
 */
@Controller
public class NewsController {

	@Resource
	private NewsService newsService;

	/**
	 * 跳转到新闻页面
	 * 
	 * @return
	 */
	@RequestMapping("jumpNews")
	public String jumpNews(News news, PageUtil pageUtil, HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("news", news);
		map.put("pageUtil", pageUtil);

		Map<String, Object> data = newsService.getNewsList(map);

		List<User> users = (List<User>) data.get("users");

		request.setAttribute("newsList", ((List<News>) data.get("newsList")));
		request.setAttribute("searchName", news.getTitle());
		request.setAttribute("PageUtil", ((PageUtil) data.get("pageUtil")));

		return "WEB-INF/jsp/html/news";
	}

	@RequestMapping("insertNews")
	public String insertNews(News news, HttpServletRequest request) {

		boolean flag = newsService.insertNews(news);

		if (flag)
			return "redirect:jumpNews";

		throw new CustomExceprion("添加失败");
	}

	@RequestMapping("getNewsByid")
	public void getNewsByid(int id, HttpServletResponse response) {

		PrintWriter pw = null;
		News news = null;
		try {
			response.setContentType("text/json;charset=UTF-8");
			pw = response.getWriter();
			news = newsService.getNewsByid(id);

		} catch (IOException e) {
			e.printStackTrace();
		}
		JSONObject jsonObject = JSONObject.fromObject(news);
		pw.write(jsonObject.toString());
		pw.close();
		pw = null;
	}

	@RequestMapping("delNewsByid")

	public String delNewsByid(int id) {

		boolean flag = newsService.delNewsByid(id);
		return "redirect:jumpNews";
	}

}
