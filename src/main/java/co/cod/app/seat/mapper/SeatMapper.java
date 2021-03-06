package co.cod.app.seat.mapper;

import java.util.List;

import co.cod.app.seat.SeatVO;

public interface SeatMapper {
	// 단건 조회
	public SeatVO getSeat(SeatVO seatVO);

	// 목록 조회
	public List<SeatVO> getSeatList(String adminId);

	// 등록
	public void insertSeat(SeatVO seatVO);

	// 수정
	public void updateSeat(SeatVO seatVO);
	public void updateSeatReserve(SeatVO seatVO);
	public void seatSetting(SeatVO seatVO);
	// 삭제
	public void deleteSeat(SeatVO seatVO);
//	public String getName(Integer Id);
//	public List<Map<String, Object>> getEmpMap();
//	public List<Map<String, Object>> getDeptEmpCnt();

}
