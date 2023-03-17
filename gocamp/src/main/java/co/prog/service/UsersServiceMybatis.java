package co.prog.service;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.UsersMapper;
import co.prog.vo.UsersVO;

public class UsersServiceMybatis implements UsersService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
	
	@Override
	public boolean joinUsers(UsersVO vo) {
		return mapper.insertUser(vo)==1;
	}

	@Override
	public boolean checkId(String id) {
		return mapper.selectUserId(id)==1;
	}

	@Override
	public UsersVO login(String id) {
		return mapper.login(id);
	}

	@Override
	public UsersVO userInfo(String id) {
		return mapper.selectUsers(id);
	}

}
