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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<WorkerVO> getWorkerList(WorkerVO wokerVO) {
		// TODO Auto-generated method stub
		return workerMapper.getWorkerList( wokerVO);
	}

	@Override
	public void insertWorker(WorkerVO workerVO) {
		workerMapper.insertWorker(workerVO);
		
	}

	@Override
	public void updateWorker(WorkerVO workerVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteWorker(WorkerVO workerVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Map> getWorkerListMap(WorkerVO workerVO) {
		return workerMapper.getWorkerListMap(workerVO);
		
	}

}
