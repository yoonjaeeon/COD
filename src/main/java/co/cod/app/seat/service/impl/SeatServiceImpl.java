package co.cod.app.seat.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.cod.app.seat.SeatVO;
import co.cod.app.seat.mapper.SeatMapper;
import co.cod.app.seat.service.SeatService;


@Service
public class SeatServiceImpl implements SeatService {
	@Autowired
	SeatMapper seatMapper;

	// 단건조회
	@Override
	public SeatVO getSeat(SeatVO seatVO) {
		return seatMapper.getSeat(seatVO);
	}

	// 전체조회
	@Override
	public List<SeatVO> getSeatList(String adminId) {
		System.out.println("getSeatList 서비스 호출");
		return seatMapper.getSeatList(adminId);
	}
	
	// 등록
	@Override
	public void insertSeat(SeatVO seatVO) {
		seatMapper.insertSeat(seatVO);
	}

	// 삭제
	@Override
	public void deleteSeat(SeatVO seatVO) {
		seatMapper.deleteSeat(seatVO);
	}

	// 수정
	@Override
	public void updateSeat(SeatVO seatVO) {
		seatMapper.updateSeat(seatVO);
	}
}
