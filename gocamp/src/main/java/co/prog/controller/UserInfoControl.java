package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.UsersVO;

public class UserInfoControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = session.getId();
		
		UsersVO vo = new UsersVO();
		
		
		UsersService service = new UsersServiceMybatis();
		vo = service.userInfo(userId);
		
		return "users/myPage.tiles";
	}

}
