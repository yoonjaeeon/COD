package co.cod.app.Question.service;

import java.util.List;

import co.cod.app.Question.QuestionVO;

public interface QuestionService {


	public QuestionVO getQuestion( QuestionVO QuestionVO);
	public List< QuestionVO> getQuestionList();
	public void insertQuestion( QuestionVO QuestionVO);
	public void updateQuestion( QuestionVO QuestionVO);
	public void deleteQuestion( QuestionVO QuestionVO);	
	
}
