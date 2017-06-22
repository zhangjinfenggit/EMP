package cn.edu.zzuli.emp.news.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.news.vo.News;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午8:02:24 TODO
 */
@Repository
public interface NewsMapper {

	public int getNewsCount(News news) throws Exception;

	public List<News> listNews(Map<String, Object> map) throws Exception;

	public int insertNews(News news) throws Exception;

	public News getNewsByid(int id) throws Exception;

	public int delNewsByid(int id) throws Exception;

	public int updateNews(News news) throws Exception;

	public List<News> getNews() throws Exception;

}
