package cn.edu.zzuli.emp.salary.service;

import java.util.Map;

import cn.edu.zzuli.emp.salary.vo.Salary;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午10:14:11 TODO
 */
public interface SalaryService {

	Map<String, Object> getNewsList(Map<String, Object> map) throws Exception;

	boolean insertSalary(Salary salary) throws Exception;

	Salary getSalaryById(int id) throws Exception;

	boolean updatetSalary(Salary salary) throws Exception;

	boolean delSalaryById(int id) throws Exception;

}
