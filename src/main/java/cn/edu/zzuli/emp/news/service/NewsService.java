package cn.edu.zzuli.emp.news.service;

import java.util.Map;

import cn.edu.zzuli.emp.news.vo.News;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午8:04:36 TODO
 */
public interface NewsService {

	Map<String, Object> getNewsList(Map<String, Object> map);

	boolean insertNews(News news);

	News getNewsByid(int id);

	boolean delNewsByid(int id);

}
