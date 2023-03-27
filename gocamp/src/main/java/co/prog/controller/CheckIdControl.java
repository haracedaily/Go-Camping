package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;

public class CheckIdControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		
		UsersService service = new UsersServiceMybatis();
		
		if(service.checkId(userId)) {
			request.setAttribute("message", "이미 사용중인 아이디입니다.");
		} else {
			request.setAttribute("message", "사용 가능한 아이디입니다.");
		}
		
		return "users/checkId.jsp";
	}

}