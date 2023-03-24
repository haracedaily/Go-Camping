package co.prog.mapper;

import java.util.List;

import co.prog.vo.UsersVO;

public interface ManagerMapper {
	//회원 리스트 출력
	public List<UsersVO> getUsers();
	//회원 삭제
	public int deleteUser(String userId);
	
}
