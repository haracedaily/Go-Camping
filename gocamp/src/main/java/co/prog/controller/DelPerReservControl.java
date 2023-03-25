package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class DelPerReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String uri="";
		int resId=Integer.parseInt(request.getParameter("resId"));
		LocationService service = new LocationServiceMybatis();
		ReservVO check = service.getPReserv(resId);
		
		if(service.deleteReserv(resId)) {
			List<ReservVO> list = service.getPerReserv(check.getUserId());
			request.setAttribute("List", list);
			uri="users/reserved.tiles";
		}
		return uri;
	}

}
