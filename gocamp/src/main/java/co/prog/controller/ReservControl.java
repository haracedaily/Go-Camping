package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class ReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ReservVO vo = new ReservVO();
		vo.setUserId(request.getParameter("usId"));
		vo.setResName(request.getParameter("resNm"));
		vo.setResSdate(request.getParameter("resSdate"));
		vo.setResEdate(request.getParameter("resEdate"));
		vo.setResTel(request.getParameter("resTel"));
		vo.setRoomId(Integer.parseInt(request.getParameter("locaId")));
		
		LocationService service = new LocationServiceMybatis();
		if(service.insertReserv(vo)>0) {
			request.setAttribute("message", "예약이 완료되었습니다.");
		}
		List<ReservVO> list = service.getPerReserv(vo.getUserId());
		
		request.setAttribute("List", list);
		
		return "users/reserved.tiles";
	}

}
