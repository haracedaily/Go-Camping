package co.prog.mapper;

import co.prog.vo.UsersVO;

public interface UsersMapper {
	
	//회원가입
	public int insertUser(UsersVO vo);
	
	//아이디 중복 확인
	public int selectUserId(String id);
	
	//로그인
	public UsersVO login(UsersVO vo);
	
	//마이페이지 - 개인 정보 조회
	public UsersVO selectUsers(String id);
	
	//마이페이지 - 개인 정보 수정
	public int updateUser(UsersVO vo);
	
}
