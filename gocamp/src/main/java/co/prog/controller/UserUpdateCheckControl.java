package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.vo.UsersVO;

public class UserUpdateCheckControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String pw = request.getParameter("pwcheck");
		
		HttpSession session = request.getSession();
		UsersVO vo = (UsersVO)session.getAttribute("user");
		
		if(vo.getUserPw().equals(pw)) {
			request.setAttribute("oldInfo", vo);
			return "users/myPage.tiles";
		}else {
			request.setAttribute("message", "비밀번호가 일치하지 않습니다");
			return "users/updateCheck.tiles";
		}
	}

}
