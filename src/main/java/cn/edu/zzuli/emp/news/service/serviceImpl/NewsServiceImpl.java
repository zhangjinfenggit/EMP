package cn.edu.zzuli.emp.news.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.news.mapper.NewsMapper;
import cn.edu.zzuli.emp.news.service.NewsService;
import cn.edu.zzuli.emp.news.vo.News;
import cn.edu.zzuli.emp.util.PageUtil;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource
	private NewsMapper newsMapper;

	@Override
	public Map<String, Object> getNewsList(Map<String, Object> map) {

		News news = (News) map.get("news");

		Integer Newscount = newsMapper.getNewsCount(news);

		((PageUtil) map.get("pageUtil")).setDataCount(Newscount);

		List<News> newsList = newsMapper.listNews(map);

		map.put("newsList", newsList);

		return map;
	}

	public boolean insertNews(News news) {

		int flag = newsMapper.insertNews(news);

		if (flag == 1) {
			return true;
		}
		return false;
	}

	@Override
	public News getNewsByid(int id) {

		return newsMapper.getNewsByid(id);
	}

	@Override
	public boolean delNewsByid(int id) {

		int flag = newsMapper.delNewsByid(id);

		if (flag == 1) {
			return true;
		}

		return false;
	}

}
