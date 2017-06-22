package cn.edu.zzuli.emp.salary.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.salary.vo.Salary;

@Repository
public interface SalaryMapper {

	public int getSalaryCount(Salary salary) throws Exception;

	public List<Salary> listSalary(Map<String, Object> map) throws Exception;

	public int insertSalary(Salary salary) throws Exception;

	public Salary getSalaryById(int id) throws Exception;

	public int updatetSalary(Salary salary) throws Exception;

	public int delSalaryById(int id) throws Exception;

}
