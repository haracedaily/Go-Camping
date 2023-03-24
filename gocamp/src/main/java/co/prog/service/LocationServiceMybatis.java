package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.LocationMapper;
import co.prog.vo.LocaVO;
import co.prog.vo.LocationVO;
import co.prog.vo.ReservVO;

public class LocationServiceMybatis implements LocationService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	LocationMapper mapper = sqlSession.getMapper(LocationMapper.class);
	
	@Override
	public List<ReservVO> getReservList(int roomId) {
		// TODO Auto-generated method stub
		return mapper.getReservList(roomId);
	}

	@Override
	public List<LocationVO> getAllLocaList(LocationVO vo) {
		// TODO Auto-generated method stub
		return mapper.getAllLocaList(vo);
	}

	@Override
	public List<String> getAlmostLocaList(LocationVO vo) {
		// TODO Auto-generated method stub
		return mapper.getAlmostLocaList(vo);
	}

	@Override
	public LocationVO getLocaDetail(LocationVO vo) {
		// TODO Auto-generated method stub
		return mapper.getLocaDetail(vo);
	}

	@Override
	public String getLocaAddr(LocationVO vo) {
		// TODO Auto-generated method stub
		return mapper.getLocaAddr(vo);
	}

	@Override
	public String getLocaNm(LocationVO vo) {
		// TODO Auto-generated method stub
		return mapper.getLocaNm(vo);
	}

	@Override
	public int insertReserv(ReservVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertReserv(vo);
	}

	@Override
	public List<ReservVO> getPerReserv(String userId) {
		// TODO Auto-generated method stub
		return mapper.getPerReserv(userId);
	}

}
