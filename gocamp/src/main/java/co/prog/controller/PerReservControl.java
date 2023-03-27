package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class PerReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		LocationService service = new LocationServiceMybatis();
		List<ReservVO> list = service.getPerReserv((String)session.getAttribute("userId"));
		
		request.setAttribute("List", list);
		System.out.println("===============================");
		System.out.println(list);
		
		return "users/reserved.tiles";
	}

}
