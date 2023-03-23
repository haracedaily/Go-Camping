package co.prog.service;

import java.util.List;

import co.prog.vo.UsersVO;

public interface ManagerService {
	//회원 리스트
	public List<UsersVO> userList();
}
