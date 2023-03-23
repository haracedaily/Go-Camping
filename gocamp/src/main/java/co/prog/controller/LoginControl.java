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
		String uri="users/login.tiles";
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		UsersVO vo = new UsersVO();
		vo.setUserId(userId);
		vo.setUserPw(userPw);
		
		UsersService service = new UsersServiceMybatis();
		vo = service.login(vo);
		
		System.out.println("로그인 정보 : "+vo);
		
		 // 로그인 성공
		 // 로그인 실패
		//session 객체는 웹브라우저별로 계속 유지되는 정보를 담아둠
		if(vo!=null) {
		System.out.println("성공");
		request.setAttribute("message", "로그인 되었습니다.");

		HttpSession session = request.getSession();
		session.setAttribute("userId", vo.getUserId());
		session.setAttribute("user", vo);
		}else {
			System.out.println("실패");
			request.setAttribute("message", "로그인에 실패했습니다. 로그인 정보를 다시 확인해주세요.");
			uri="users/login.tiles";
		}
		return uri;
	}



}
