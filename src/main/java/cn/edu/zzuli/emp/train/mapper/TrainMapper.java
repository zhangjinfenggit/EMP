package cn.edu.zzuli.emp.train.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.edu.zzuli.emp.train.vo.Train;

@Repository
public interface TrainMapper {

	public int getTrainCount(Train train);

	public List<Train> listTrain(Map<String, Object> map);

	public int inertTrain(Train train);

	public Train getTrainById(int id);

	public int updateTrain(Train train);

	public int delTrain(int id);

}
