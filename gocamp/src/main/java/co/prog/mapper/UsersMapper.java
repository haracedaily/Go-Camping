package co.prog.mapper;

import co.prog.vo.UsersVO;

public interface UsersMapper {
	
	//회원가입
	public int insertUser(UsersVO vo);
	
	//로그인
	public UsersVO login(UsersVO vo);

}
