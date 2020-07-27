package co.cod.app.seat.mapper;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.cod.app.seat.SeatVO;

@Repository // Bean등록, connection 설정 //@Component 상속
public class SeatDAO {

	@Autowired
	private SqlSessionTemplate mybatis; // SqlSessionTemplate : mybatis에서 지원

	public SeatVO getSeat(SeatVO seatVO) {
		return mybatis.selectOne("co.cod.app.member.seat.mapper.SeatDAO.getSeat", seatVO);
	}

	public List<SeatVO> getSeatList(SeatVO seatVO) {
		return mybatis.selectList("co.cod.app.member.seat.mapper.SeatDAO.getSeatList", seatVO);
	}

	public void insertSeat(SeatVO seatVO) {
		mybatis.insert("co.cod.app.member.seat.mapper.SeatDAO.insertSeat", seatVO);

	}

	public void updateSeat(SeatVO seatVO) {
		mybatis.update("co.cod.app.member.seat.mapper.SeatDAO.updateSeat", seatVO);

	}

	public void deleteSeat(SeatVO SeatVO) {
		mybatis.delete("co.cod.app.member.seat.mapper.SeatDAO.deleteSeat", SeatVO);

	}

}