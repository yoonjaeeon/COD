package co.cod.app.commute.mapper;

import java.util.List;

import co.cod.app.admin.AdminVO;
import co.cod.app.commute.CommuteVO;

public interface CommuteMapper {
	public void insertCommute(CommuteVO commuteVO);
	public void updateCommute(CommuteVO commuteVO);
	public  List<CommuteVO> getCommuteList  (CommuteVO commuteVO);
	public CommuteVO getCommute (String CommuteSeq);
}
