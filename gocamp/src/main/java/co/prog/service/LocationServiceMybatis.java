package co.prog.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.LocationMapper;
import co.prog.vo.ReservVO;

public class LocationServiceMybatis implements LocationService{
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	LocationMapper mapper = sqlSession.getMapper(LocationMapper.class);
	
	@Override
	public List<ReservVO> getReservList(int roomId) {
		// TODO Auto-generated method stub
		return mapper.getReservList(roomId);
	}

}