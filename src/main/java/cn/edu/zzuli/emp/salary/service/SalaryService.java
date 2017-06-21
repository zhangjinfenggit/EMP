package cn.edu.zzuli.emp.salary.service;

import java.util.Map;

import cn.edu.zzuli.emp.salary.vo.Salary;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午10:14:11 TODO
 */
public interface SalaryService {

	Map<String, Object> getNewsList(Map<String, Object> map);

	boolean insertSalary(Salary salary);

	Salary getSalaryById(int id);

	boolean updatetSalary(Salary salary);

	boolean delSalaryById(int id);

}
