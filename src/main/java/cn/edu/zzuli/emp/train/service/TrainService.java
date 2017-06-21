package cn.edu.zzuli.emp.train.service;

import java.util.Map;

import cn.edu.zzuli.emp.train.vo.Train;

public interface TrainService {

	Map<String, Object> getTrainList(Map<String, Object> map);

	boolean inertTrain(Train train);

	Train getTrainById(int id);

	boolean updateTrain(Train train);

	boolean delTrain(int id);

}
