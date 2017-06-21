package cn.edu.zzuli.emp.salary.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.salary.vo.Salary;

@Repository
public interface SalaryMapper {

	public int getSalaryCount(Salary salary);

	public List<Salary> listSalary(Map<String, Object> map);

	public int insertSalary(Salary salary);

	public Salary getSalaryById(int id);

	public int updatetSalary(Salary salary);

	public int delSalaryById(int id);

}
