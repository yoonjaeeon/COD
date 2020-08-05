package co.cod.app.admin.worker.web;

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
import co.cod.app.commute.service.CommuteService;

@Controller
public class WorkerController {

	
	@Autowired WorkerService workerService;
	@Autowired CommuteService commuteService;
	
	// 등록폼
	@RequestMapping("adminWorkerForm")
	public String adminWorkerForm() {
		return "ad/adminManage/adminWorker";
	
	}
	
	//등록
	@RequestMapping(value="/adminWorker",method=RequestMethod.POST)	            
	@ResponseBody
	public Map insertWorker( WorkerVO workerVO, Model model,HttpSession session) {		
		Map<String, Object> map = new HashMap<String, Object>();
		workerVO.setAdminId((String)session.getAttribute("adminId"));
		workerService.insertWorker(workerVO);
		map.put("result", true);
		return  map;
	}

	//수정
	@RequestMapping(value="/adminWorker" ,method=RequestMethod.PUT, consumes="application/json" )   
	@ResponseBody
	public WorkerVO updateWorker(@RequestBody WorkerVO workerVO, Model model) {
		System.out.println(workerVO);
		workerService.updateWorker(workerVO);
		
		return  workerVO;
	}	

	//삭제
	@RequestMapping(value="/adminWorker/{workerSeq}", method=RequestMethod.DELETE)
	@ResponseBody
	public Map<String, Object>deleteWorker( @PathVariable String workerSeq, WorkerVO workerVO, Model model) {
		workerVO.setWorkerSeq(Integer.parseInt(workerSeq));
		workerService.deleteWorker(workerVO);
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", Boolean.TRUE);
		return result;
	}
	
	//단건조회
	@RequestMapping(value="/adminWorker/{workerSeq}",  method=RequestMethod.GET)
	@ResponseBody
	public WorkerVO getWorker(@PathVariable String workerSeq, WorkerVO workerVO, Model model) {		
		workerVO.setWorkerSeq(Integer.parseInt(workerSeq));
		return  workerService.getWorker(workerVO);
	}

	//전체조회
	@RequestMapping(value="/adminWorker", method=RequestMethod.GET)
	@ResponseBody
	public List<WorkerVO> getWorkerList(Model model, WorkerVO workerVO,HttpSession session) {
		return  workerService.getWorkerList((String)session.getAttribute("adminId"));	
	}
	//전체조회
	@RequestMapping(value="/workerCommute", method=RequestMethod.GET)
	@ResponseBody
	public List<WorkerVO> workerCommute(Model model, HttpSession session) {
		return  workerService.getworkerCommute((String)session.getAttribute("adminId"));	
	}
	//출석상태 업데이트
	@RequestMapping(value="/workerState" ,method=RequestMethod.PUT ,consumes="application/json")	   
	@ResponseBody
	public WorkerVO workerState(@RequestBody WorkerVO workerVO, Model model) {
		workerService.updateWorkerState(workerVO);
		return  workerVO;
	}
	//일급계산
	@RequestMapping(value="/dayPay" ,method=RequestMethod.PUT ,consumes="application/json")	   
	@ResponseBody
	public void updateDayPay(@RequestBody WorkerVO workerVO, Model model) {
		workerService.updatedaypay(workerVO);
	}

	@RequestMapping(value="/respAPI")
	@ResponseBody
	public Map respAPI() {
		RestTemplate rest = new RestTemplate();
		return rest.getForObject("http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt=20200713", Map.class);
	}
	
}