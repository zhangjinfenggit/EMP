package cn.edu.zzuli.emp.train.service;

import java.util.List;
import java.util.Map;

import cn.edu.zzuli.emp.train.vo.Train;

public interface TrainService {

	Map<String, Object> getTrainList(Map<String, Object> map) throws Exception;

	boolean inertTrain(Train train) throws Exception;

	Train getTrainById(int id) throws Exception;

	boolean updateTrain(Train train) throws Exception;

	boolean delTrain(int id) throws Exception;

	List<Train> getTrains() throws Exception;

}
