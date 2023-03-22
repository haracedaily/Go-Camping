package co.prog.service;

import co.prog.vo.UsersVO;

public interface UsersService {
	//회원가입
	public boolean joinUsers(UsersVO vo);
	//아이디 중복 확인
	public boolean checkId(String id);
	//로그인
	public UsersVO login(UsersVO vo);
	//마이페이지 - 개인정보조회
	public UsersVO userInfo(String id);
	//마이페이지 - 개인정보 수정
	public boolean modifyUsers(UsersVO vo);
	
}
