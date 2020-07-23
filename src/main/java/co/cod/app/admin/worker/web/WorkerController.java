package co.cod.app.admin.worker.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import co.cod.app.admin.worker.WorkerVO;
import co.cod.app.admin.worker.service.WorkerService;

@RestController
public class WorkerController {

	
	@Autowired WorkerService workerService;
	
	//전체조회
	@RequestMapping(value="/workers", method=RequestMethod.GET)
	public List<WorkerVO> getWorkerList(Model model, WorkerVO workerVO) {
		return  workerService.getWorkerList();	
	}
		
	//삭제
	@RequestMapping(value="/workers/{workerSeq}", method=RequestMethod.DELETE)
	public Map  getWorkerList( @PathVariable String id, WorkerVO workerVO, Model model) {
		workerVO.setAdminId(id);
		workerService.deleteWorker(workerVO);
		Map result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	//등록
	@RequestMapping(value="/worker"
			,method=RequestMethod.POST
            ,headers = {"Content-type=application/json" }
	)
	public Map insertWorker(WorkerVO workerVO, Model model) {
		workerService.insertWorker(workerVO);
		return  Collections.singletonMap("result", true);
	}
	
	//수정
	@RequestMapping(value="/worker"
			,method=RequestMethod.PUT
	 		,consumes="application/json"      //요청헤더
   
	)
	public WorkerVO updateWorker(@RequestBody WorkerVO workerVO, Model model) {
		workerService.updateWorker(workerVO);
		return  workerVO;
	}	
	
	@RequestMapping(value="/respAPI")
	public Map respAPI() {
		RestTemplate rest = new RestTemplate();
		return rest.getForObject("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713", Map.class);
	}
	
}