package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;

public class UserDeleteControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		
		UsersService service = new UsersServiceMybatis();
		System.out.println(userId);
		//삭제 메소드 호출
		if(service.removeUsers(userId)) {
			request.setAttribute("dmessage", "회원 탈퇴가 완료되었습니다.");
			
		}else {
			request.setAttribute("message", "탈퇴에 실패했습니다. 다시 시도해주세요.");
		}
		
		return "users/myPage.tiles";
	}

}
