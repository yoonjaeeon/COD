package co.cod.app.admin.worker.service;

import java.util.List;
import java.util.Map;

import co.cod.app.admin.worker.WorkerVO;

public interface WorkerService {
	
	public WorkerVO getWorker( WorkerVO workerVO);
	public List< WorkerVO> getWorkerList(String adminId);
	public void insertWorker( WorkerVO workerVO);
	public void updateWorker( WorkerVO workerVO);
	public void updateWorkerState( WorkerVO workerVO);
	public void deleteWorker( WorkerVO workerVO);
	public List<Map> getWorkerListMap(WorkerVO workerVO);

}
