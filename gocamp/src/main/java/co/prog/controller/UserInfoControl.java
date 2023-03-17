package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.UsersVO;

public class UserInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		
		UsersVO vo = new UsersVO();
		
		UsersService service = new UsersServiceMybatis();
		vo = service.userInfo(userId);
		
		return null;
	}

}
