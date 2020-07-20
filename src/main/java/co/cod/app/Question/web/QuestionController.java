package co.cod.app.Question.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.cod.app.Question.QuestionVO;
import co.cod.app.Question.service.QuestionService;

@Controller
public class QuestionController {

	@Autowired QuestionService questionService;
	
	
	// 문의 사항 리스트 조회
		@RequestMapping("questionList")
		public String getQuestionList(QuestionVO questionVO, Model model) {
		//	 model.addAttribute( "Questionlist", masterService.getMasterList());
		return "question/questionList";			
			}
					
		//문의 입력
		@RequestMapping("questionOn")
		public String InsertQuestion(QuestionVO questionVO) {
		//	 model.addAttribute( "Questionlist", masterService.getMasterList());
		return "question/questionOn";			
		}
		
		
		//문의 사항 댓글 입력 
		@RequestMapping("questionView")
		public String updateQuestionList(QuestionVO questionVO) {
		//	 model.addAttribute( "Masterlist", masterService.getMasterList());
		return "question/questionView";			
		}
			
		//문의 사항 댓글 입력 
		@RequestMapping("questionMs")
		public String deleteQuestionList(QuestionVO questionVO) {
		//	 model.addAttribute( "Masterlist", masterService.getMasterList());
		return "question/questionMs";			
		}


		
		
	
}
