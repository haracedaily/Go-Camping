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
		vo.setSinNum(request.getParameter("sinNum"));
		vo.setUserTel(request.getParameter("userTel"));
		String Addr="우편번호 : "+request.getParameter("postcode")+"|";
		Addr+="주소 : "+request.getParameter("address")+"_";
		Addr+=request.getParameter("extraAddress")+"_";
		Addr+=request.getParameter("detailAddress")+"_";
		System.out.println(Addr);
		vo.setUserAddr(Addr);
		
		System.out.println(vo);
		
		if(service.joinUsers(vo)==true) {
			request.setAttribute("message", "ok");
		}else {
			request.setAttribute("message", "nope");
		}
		return "users/join.tiles";
	}

}
