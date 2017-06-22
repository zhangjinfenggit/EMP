package cn.edu.zzuli.emp.train.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.train.vo.Train;

@Repository
public interface TrainMapper {

	public int getTrainCount(Train train) throws Exception;

	public List<Train> listTrain(Map<String, Object> map) throws Exception;

	public int inertTrain(Train train) throws Exception;

	public Train getTrainById(int id) throws Exception;

	public int updateTrain(Train train) throws Exception;

	public int delTrain(int id) throws Exception;

	public List<Train> getTrains() throws Exception;

}
