package co.prog.service;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.UsersMapper;
import co.prog.vo.UsersVO;

public class UsersServiceMybatis implements UsersService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
	
	@Override
	public boolean joinUsers(UsersVO vo) {
		// TODO Auto-generated method stub
		return mapper.insertUser(vo)==1;
	}

}
