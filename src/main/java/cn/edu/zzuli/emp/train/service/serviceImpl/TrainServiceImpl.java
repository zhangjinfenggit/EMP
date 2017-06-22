package cn.edu.zzuli.emp.train.service.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.edu.zzuli.emp.train.mapper.TrainMapper;
import cn.edu.zzuli.emp.train.service.TrainService;
import cn.edu.zzuli.emp.train.vo.Train;
import cn.edu.zzuli.emp.util.PageUtil;

@Service
public class TrainServiceImpl implements TrainService {

	@Resource
	private TrainMapper trainMapper;

	@Override
	public Map<String, Object> getTrainList(Map<String, Object> map) throws Exception {
		Train train = (Train) map.get("train");

		int Usercount = trainMapper.getTrainCount(train);

		((PageUtil) map.get("pageUtil")).setDataCount(Usercount);

		System.out.println(((PageUtil) map.get("pageUtil")).getCurrPageIndex());

		List<Train> trains = trainMapper.listTrain(map);

		map.put("trains", trains);

		return map;
	}

	@Override
	public boolean inertTrain(Train train) throws Exception {

		int flag = trainMapper.inertTrain(train);

		if (flag == 1) {
			return true;
		}

		return false;
	}

	@Override
	public Train getTrainById(int id) throws Exception {

		return trainMapper.getTrainById(id);
	}

	@Override
	public boolean updateTrain(Train train) throws Exception {

		int flag = trainMapper.updateTrain(train);

		if (flag == 1) {
			return true;
		}

		return false;
	}

	@Override
	public boolean delTrain(int id) throws Exception {

		int flag = trainMapper.delTrain(id);

		if (flag == 1) {
			return true;
		}

		return false;
	}

	@Override
	public List<Train> getTrains() throws Exception {

		return trainMapper.getTrains();
	}
}
