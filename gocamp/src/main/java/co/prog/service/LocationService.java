package co.prog.service;

import java.util.List;

import co.prog.vo.LocaVO;
import co.prog.vo.LocationVO;
import co.prog.vo.ReservVO;

public interface LocationService {
	public List<ReservVO> getReservList(int roomId);
	
	public List<LocationVO> getAllLocaList(LocationVO vo);
	
	public List<String> getAlmostLocaList();
}
