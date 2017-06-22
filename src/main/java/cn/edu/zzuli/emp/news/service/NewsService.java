package cn.edu.zzuli.emp.news.service;

import java.util.List;
import java.util.Map;

import cn.edu.zzuli.emp.news.vo.News;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午8:04:36 TODO
 */
public interface NewsService {

	Map<String, Object> getNewsList(Map<String, Object> map) throws Exception;

	boolean insertNews(News news) throws Exception;

	News getNewsByid(int id) throws Exception;

	boolean delNewsByid(int id) throws Exception;

	boolean updateNews(News news) throws Exception;

	List<News> getNews() throws Exception;

}
