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

	public int getNewsCount(News news);

	public List<News> listNews(Map<String, Object> map);

	public int insertNews(News news);

	public News getNewsByid(int id);

	public int delNewsByid(int id);

}
