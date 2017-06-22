package cn.edu.zzuli.emp.train.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.zzuli.emp.exception.CustomExceprion;
import cn.edu.zzuli.emp.salary.vo.Salary;
import cn.edu.zzuli.emp.train.service.TrainService;
import cn.edu.zzuli.emp.train.vo.Train;
import cn.edu.zzuli.emp.util.PageUtil;
import net.sf.json.JSONObject;

/**
 * 
 * @author zhangjinfeng
 * @date 2017年6月19日下午7:27:59 TODO
 */
@Controller
public class TrainController {

	@Resource

	private TrainService trainService;

	@RequestMapping("jumpTrain")
	public String jumpTrain(Train train, PageUtil pageUtil, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("train", train);
		map.put("pageUtil", pageUtil);

		Map<String, Object> data = trainService.getTrainList(map);

		List<Salary> trains = (List<Salary>) data.get("trains");

		request.setAttribute("trains", ((List<Train>) data.get("trains")));
		request.setAttribute("searchName", train.getTitle());
		request.setAttribute("PageUtil", ((PageUtil) data.get("pageUtil")));

		return "WEB-INF/jsp/html/train";
	}

	@RequestMapping("inertTrain")
	private String inertTrain(Train train, HttpServletRequest request) throws Exception {

		boolean flag = trainService.inertTrain(train);
		if (flag) {
			return "redirect:jumpTrain";
		}
		throw new CustomExceprion("添加信息失败");
	}

	@RequestMapping("getTrainByid")
	public void getTrainById(int id, HttpServletResponse response) throws Exception {
		PrintWriter pw = null;
		Train train = null;
		try {
			response.setContentType("text/json;charset=UTF-8");
			pw = response.getWriter();
			train = trainService.getTrainById(id);

		} catch (IOException e) {
			e.printStackTrace();
		}

		JSONObject jsonObject = JSONObject.fromObject(train);
		pw.write(jsonObject.toString());
		pw.close();
		pw = null;
	}

	@RequestMapping("updateTrain")

	public String updateTrain(Train train, HttpServletRequest request) throws Exception {
		boolean flag = trainService.updateTrain(train);
		if (flag) {
			return "redirect:jumpTrain";
		}
		throw new CustomExceprion("修改信息失败");
	}

	@RequestMapping("delTrain")

	public String delTrain(int id) throws Exception {

		boolean flag = trainService.delTrain(id);
		if (flag) {
			return "redirect:jumpTrain";
		}
		throw new CustomExceprion("删除信息失败");
	}

	@RequestMapping("showTrain")
	public String showTrain(int id, HttpServletRequest request) throws Exception {

		Train train = trainService.getTrainById(id);

		request.setAttribute("train", train);
		return "showTrain";
	}

}
