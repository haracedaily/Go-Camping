package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.UsersVO;

public class LoginControl implements Control{

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		
		UsersVO vo = new UsersVO();
		System.out.println(userId);
		
		UsersService service = new UsersServiceMybatis();
		vo = service.login(userId);
		System.out.println(vo);
		//session 객체는 웹브라우저별로 계속 유지되는 정보를 담아둠
		HttpSession session = request.getSession();
		session.setAttribute("userId", vo.getUserId());
		session.setAttribute("user", vo);
		
		return "loca/loca.tiles";
	}



}
