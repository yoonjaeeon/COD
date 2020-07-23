package co.cod.app.admin.worker.mapper;

import java.util.List;
import java.util.Map;

import co.cod.app.admin.worker.WorkerVO;

public interface WorkerMapper {

	public WorkerVO getWorker( WorkerVO workerVO);
	public List< WorkerVO> getWorkerList();
	public void insertWorker( WorkerVO workerVO);
	public void updateWorker( WorkerVO workerVO);
	public void deleteWorker( WorkerVO workerVO);
	public List<Map> getWorkerListMap(WorkerVO workerVO);
	

}
