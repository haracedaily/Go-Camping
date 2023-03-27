package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class AcceptReqReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LocationService service = new LocationServiceMybatis();
		
		service.acceptReq(Integer.parseInt(request.getParameter("resId")));
		
		List<ReservVO> list = service.getAllReserv();
		request.setAttribute("List", list);
		
		request.setAttribute("List", list);
		System.out.println("===============================");
		System.out.println(list);
		return "manager/reservList.tiles";
	}

}
