package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ManagerService;
import co.prog.service.ManagerServiceMybatis;
import co.prog.vo.UsersVO;

public class UserListContol implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService service = new ManagerServiceMybatis();
		List<UsersVO> list = service.userList();
		
		request.setAttribute("user", list);
		
		return null;
	}

}
