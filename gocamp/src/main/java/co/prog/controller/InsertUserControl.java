package co.prog.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.UsersVO;

public class InsertUserControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		UsersService service = new UsersServiceMybatis();
		UsersVO vo = new UsersVO();
		vo.setUserName(request.getParameter("userName"));
		vo.setUserId(request.getParameter("userId"));
		vo.setUserPw(request.getParameter("userPw"));
		vo.setNickname(request.getParameter("nickname"));
		vo.setUserTel(request.getParameter("userTel"));
		vo.setUserAddr(request.getParameter("userAddr"));
		
		System.out.println(vo);
		
		/*
		// 아이디 중복 확인
		String userId = request.getParameter("userId");
		boolean isDuplicated = service.checkId(userId);
		if (isDuplicated) {
		    request.setAttribute("message", "duplicated");
		    return "users/join.tiles";
		}
		*/
	    
		boolean result = service.joinUsers(vo);
		System.out.println(result);
		
		
		if(result) {
			System.out.println("성공");
			request.setAttribute("message", "가입이 완료되었습니다. 로그인해주세요.");
			request.setAttribute("id", vo.getUserId());
		}else {
			System.out.println("예외");
			request.setAttribute("message", "회원 가입에 실패했습니다. 다시 시도해주세");
		}
		return "users/join.tiles";
	}

}
