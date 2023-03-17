package co.prog.mapper;

import co.prog.vo.UsersVO;

public interface UsersMapper {
	
	//회원가입
	public int insertUser(UsersVO vo);
	
	//아이디 중복 확인
	public int selectUserId(String id);
	
	//로그인
	public UsersVO login(String id);
	

}
