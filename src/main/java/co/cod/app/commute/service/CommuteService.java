package co.cod.app.commute.service;

import java.util.List;

import co.cod.app.commute.CommuteVO;

public interface CommuteService {
	public void insertCommute(CommuteVO commuteVO);
	public void updateCommute(CommuteVO commuteVO);
	public  List<CommuteVO> getCommuteList  (CommuteVO commuteVO);
	public CommuteVO getCommute (String CommuteSeq);
}
