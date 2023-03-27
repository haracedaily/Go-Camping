package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class ReqReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LocationService service = new LocationServiceMybatis();
		
		service.reqReserv(Integer.parseInt(request.getParameter("resId")));
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		
		List<ReservVO> list = service.getPerReserv((String)session.getAttribute("userId"));
		
		request.setAttribute("List", list);
		System.out.println("===============================");
		System.out.println(list);
		
		return "users/reserved.tiles";
	}

}
