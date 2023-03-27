package co.prog.service;

import org.apache.ibatis.session.SqlSession;

import co.prog.common.DataSource;
import co.prog.mapper.UsersMapper;
import co.prog.vo.UsersVO;

public class UsersServiceMybatis implements UsersService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private UsersMapper mapper = sqlSession.getMapper(UsersMapper.class);
	
	@Override
	public boolean joinUsers(UsersVO vo) { // 회원가입
		return mapper.insertUser(vo)==1;
	}

	@Override
	public boolean checkId(String id) { //아이디 중복 확인
		return mapper.selectUserId(id)==1;
	}

	@Override
	public UsersVO login(UsersVO vo) { //로그인
		return mapper.login(vo);
	}

	@Override
	public UsersVO userInfo(String id) { //마이페이지 기본 폼
		return mapper.selectUsers(id);
	}

	@Override
	public boolean modifyUsers(UsersVO vo) { //회원정보 수정
		int r = mapper.updateUser(vo);
		return r==1;
	}

	@Override
	public boolean removeUsers(String id) { //회원 탈퇴
		return mapper.deleteUser(id)==1;
	}

}
