package co.cod.app.Question.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.Question.QuestionVO;
import co.cod.app.Question.mapper.QuestionMapper;
import co.cod.app.Question.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired QuestionMapper questionMapper;

	@Override
	public QuestionVO getQuestion(QuestionVO QuestionVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<QuestionVO> getQuestionList() {
		// TODO Auto-generated method stub
		return questionMapper.getQuestionList();
	}

	@Override
	public void insertQuestion(QuestionVO QuestionVO) {
		questionMapper.insertQuestion(QuestionVO);
		
	}

	@Override
	public void updateQuestion(QuestionVO QuestionVO) {
		questionMapper.updateQuestion(QuestionVO);
	}

	@Override
	public void deleteQuestion(QuestionVO QuestionVO) {
		questionMapper.deleteQuestion(QuestionVO);
		
	}
	
}
