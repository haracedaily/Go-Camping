package co.prog.service;

import java.util.List;

import co.prog.vo.LocationVO;
import co.prog.vo.ReservVO;

public interface LocationService {
	public List<ReservVO> getReservList(int roomId);
	
	public List<LocationVO> getAllLocaList(LocationVO vo);
	
	public List<String> getAlmostLocaList(LocationVO vo);
	
	public LocationVO getLocaDetail(LocationVO vo);
	
	public String getLocaAddr(LocationVO vo);
	
	public String getLocaNm(LocationVO vo);
	
	public int insertReserv(ReservVO vo);
	
	public List<ReservVO> getPerReserv(String userId);
	
	public ReservVO getPReserv(int resId);
	
	public List<ReservVO> getPReservList(ReservVO vo);
	
	public boolean deleteReserv(int resId);
	
	public int chargeReserv(int resId);
	
	public int reqReserv(int resId);
	
	public int reReserv(int resId);
	
	public boolean modifyReserv(ReservVO vo);
	
	public List<ReservVO> getAllReserv();
	
	public boolean acceptReq(int resId);
}
