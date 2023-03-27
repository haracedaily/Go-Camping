package co.prog.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class getPerReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		int resId=Integer.parseInt(request.getParameter("resId"));
		LocationService service = new LocationServiceMybatis();
		ReservVO vo = service.getPReserv(resId);
		System.out.println(vo);
		System.out.println("수정화면 조회가기");
		System.out.println(resId);
		request.setAttribute("Pres", vo);
		
		int roomId = vo.getRoomId();
		
		request.setAttribute("roomId", roomId);
		request.setAttribute("resId", resId);
		
		return "users/modiRes.tiles";
	}

}
