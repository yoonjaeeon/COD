package co.cod.app.admin.worker.web;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;



import co.cod.app.admin.worker.WorkerVO;
import co.cod.app.admin.worker.service.WorkerService;

@Controller
public class WorkerController {

	
	@Autowired WorkerService workerService;
	
	// 등록폼
	@RequestMapping("adminWorkerForm")
	public String adminWorkerForm() {
		return "ad/adminManage/adminWorker";
	
	}
	
	//등록
		@RequestMapping(value="/adminWorker"
				,method=RequestMethod.POST)	            
		@ResponseBody
		public Map insertWorker( WorkerVO workerVO, Model model,HttpSession session) {		
			Map<String, Object> map = new HashMap<String, Object>();
			workerVO.setAdminId((String)session.getAttribute("adminId"));
			workerService.insertWorker(workerVO);
			map.put("result", true);
			map.put("kkk","현우바보");
			return  map;
	}

	//수정
		@RequestMapping(value="/adminWorker"
				,method=RequestMethod.PUT
		 		,headers = {"Content-type=application/json" })
		//요청헤더	   
		@ResponseBody
		
		public WorkerVO updateWorker(@RequestBody WorkerVO workerVO, Model model, HttpSession session ) {
			workerVO.setAdminId((String)session.getAttribute("adminId"));
			workerService.updateWorker(workerVO);
			return  workerVO;
		}	
		
		
		//삭제
		@RequestMapping(value="/adminWorker/{workerSeq}", method=RequestMethod.DELETE)
		@ResponseBody
		public Map  getWorkerList( @PathVariable String id, WorkerVO workerVO, Model model) {
			workerVO.setAdminId(id);
			workerService.deleteWorker(workerVO);
			Map result = new HashMap<String, Object>();
			result.put("result", Boolean.TRUE);

			return result;
		}
	
		//단건조회
		@RequestMapping(value="/adminWorker/{id}",  method=RequestMethod.GET)
		public WorkerVO getWorker(@PathVariable String id, WorkerVO workerVO, Model model) {
			workerVO.setAdminId(id);
			return  workerService.getWorker(workerVO);
		}
		
		
	//전체조회
	@RequestMapping(value="/adminWorker", method=RequestMethod.GET)
	@ResponseBody
	public List<WorkerVO> getWorkerList(Model model, WorkerVO workerVO,HttpSession session) {
		workerVO.setAdminId((String)session.getAttribute("adminId"));  // 세션수정 테스트
		return  workerService.getWorkerList(workerVO);	
	}	
	
	
	
	
	//
	@RequestMapping(value="/respAPI")
	@ResponseBody
	public Map respAPI() {
		RestTemplate rest = new RestTemplate();
		return rest.getForObject("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713", Map.class);
	}
	
}