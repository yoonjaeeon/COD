package co.cod.app.admin.worker.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.admin.worker.WorkerVO;
import co.cod.app.admin.worker.mapper.WorkerMapper;
import co.cod.app.admin.worker.service.WorkerService;

@Service
public class WorkerServiceImpl implements WorkerService{

	@Autowired WorkerMapper workerMapper;
	
	@Override
	public WorkerVO getWorker(WorkerVO workerVO) {
		return workerMapper.getWorker(workerVO);
	}

	@Override
	public List<WorkerVO> getWorkerList(String adminId) {
		return workerMapper.getWorkerList( adminId);
	}

	@Override
	public void insertWorker(WorkerVO workerVO) {
		workerMapper.insertWorker(workerVO);
		
	}

	@Override
	public void updateWorker(WorkerVO workerVO) {
		workerMapper.updateWorker(workerVO);
		
	}

	@Override
	public void deleteWorker(WorkerVO workerVO) {
		workerMapper.deleteWorker(workerVO);
		
	}

	@Override
	public List<Map> getWorkerListMap(WorkerVO workerVO) {
		return workerMapper.getWorkerListMap(workerVO);
		
	}

	@Override
	public void updateWorkerState(WorkerVO workerVO) {
		workerMapper.updateWorkerState(workerVO);		
	}

	@Override
	public List<WorkerVO> getworkerCommute(String adminId) {
		return workerMapper.getworkerCommute(adminId);
	}

	
}
