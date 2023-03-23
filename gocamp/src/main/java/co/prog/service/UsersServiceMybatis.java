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
	public UsersVO login(UsersVO vo) {
		return mapper.login(vo);
	}

	@Override
	public UsersVO userInfo(String id) {
		return mapper.selectUsers(id);
	}

	@Override
	public boolean modifyUsers(UsersVO vo) {
		int r = mapper.updateUser(vo);
		return r==1;
	}

	@Override
	public boolean removeUsers(String id) {
		return mapper.deleteUser(id)==1;
	}

}
