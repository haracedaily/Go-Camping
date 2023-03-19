package co.prog.service;

import java.util.List;

import co.prog.vo.ReservVO;

public interface LocationService {
	public List<ReservVO> getReservList(int roomId);
}
