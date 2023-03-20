package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.vo.ReservVO;

public class ReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		ReservVO vo = new ReservVO();
		vo.setUserId(session.getId());
		vo.setResName(request.getParameter(""));
		return "users/reserved.tiles";
	}

}
