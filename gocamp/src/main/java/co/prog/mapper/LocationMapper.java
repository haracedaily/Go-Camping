package co.prog.mapper;

import java.util.List;

import co.prog.vo.LocaVO;
import co.prog.vo.LocationVO;
import co.prog.vo.ReservVO;

public interface LocationMapper {
	public List<ReservVO> getReservList(int roomId);
	
	public List<LocationVO> getAllLocaList(LocationVO vo);
	
	public List<String> getAlmostLocaList(LocationVO vo);
	
	public LocationVO getLocaDetail(LocationVO vo);
	
	public String getLocaAddr(LocationVO vo);
	
	public String getLocaNm(LocationVO vo);
	
	public int insertReserv(ReservVO vo);
	
	public List<ReservVO> getPerReserv(String userId);
	
	public int modifyReserv(ReservVO vo);
}
