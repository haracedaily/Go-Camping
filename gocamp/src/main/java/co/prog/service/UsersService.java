package co.prog.service;

import co.prog.vo.UsersVO;

public interface UsersService {
	//회원가입
	public boolean joinUsers(UsersVO vo);
	//아이디 중복 확인
	public boolean checkId(String id);
	//로그인
	public UsersVO login(String id);
}
