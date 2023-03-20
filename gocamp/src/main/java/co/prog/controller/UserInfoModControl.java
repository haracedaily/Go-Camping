package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.UsersVO;

public class UserInfoModControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String userPw = request.getParameter("userPw"); //비밀번호
		String nickname = request.getParameter("nickname"); //닉네임
		String userTel = request.getParameter("userTel"); //연락처
		String userAddr = request.getParameter("userAddr"); //주소
		
		UsersVO user = new UsersVO();
		user.setUserPw(userPw);
		user.setNickname(nickname);
		user.setUserTel(userTel);
		user.setUserAddr(userAddr);
		
		System.out.println(user);
		
		UsersService service = new UsersServiceMybatis();
		if(service.modifyUsers(user) == true) {
			request.setAttribute("message", "ok");
		}else {
			request.setAttribute("message", "nope");
		}
		return "users/myPage.tiles";
	}

}
