package co.cod.app.Question.mapper;

import java.util.List;

import co.cod.app.Question.QuestionVO;

public interface QuestionMapper {


	public QuestionVO getQuestion( QuestionVO QuestionVO);
	public List< QuestionVO> getQuestionList();
	public void insertQuestion( QuestionVO QuestionVO);
	public void updateQuestion( QuestionVO QuestionVO);
	public void deleteQuestion( QuestionVO QuestionVO);	
	
}
