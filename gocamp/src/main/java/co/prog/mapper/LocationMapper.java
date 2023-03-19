package co.prog.mapper;

import java.util.List;

import co.prog.vo.ReservVO;

public interface LocationMapper {
	public List<ReservVO> getReservList(int roomId);
}
