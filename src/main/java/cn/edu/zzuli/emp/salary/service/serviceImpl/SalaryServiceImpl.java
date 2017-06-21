package cn.edu.zzuli.emp.salary.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.salary.mapper.SalaryMapper;
import cn.edu.zzuli.emp.salary.service.SalaryService;
import cn.edu.zzuli.emp.salary.vo.Salary;
import cn.edu.zzuli.emp.util.PageUtil;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月20日上午10:14:41 TODO
 */
@Service
public class SalaryServiceImpl implements SalaryService {

	@Resource
	private SalaryMapper salaryMapper;

	public Map<String, Object> getNewsList(Map<String, Object> map) {

		Salary salary = (Salary) map.get("salary");

		int Usercount = salaryMapper.getSalaryCount(salary);

		((PageUtil) map.get("pageUtil")).setDataCount(Usercount);

		System.out.println(((PageUtil) map.get("pageUtil")).getCurrPageIndex());

		List<Salary> salarys = salaryMapper.listSalary(map);

		map.put("salarys", salarys);

		return map;

	}

	@Override
	public boolean insertSalary(Salary salary) {

		salary.setEno(System.currentTimeMillis() + "");
		int flag = salaryMapper.insertSalary(salary);

		if (flag == 1) {
			return true;
		}
		return false;
	}

	@Override
	public Salary getSalaryById(int id) {

		return salaryMapper.getSalaryById(id);
	}

	@Override
	public boolean updatetSalary(Salary salary) {

		int flag = salaryMapper.updatetSalary(salary);

		if (flag == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean delSalaryById(int id) {
		int flag = salaryMapper.delSalaryById(id);

		if (flag == 1) {
			return true;
		}
		return false;
	}

}
