package co.prog.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class PerReservModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String uri="main.do";
		LocationService service = new LocationServiceMybatis();
		ReservVO vo=new ReservVO();
		vo.setResId(Integer.parseInt(request.getParameter("resId")));
		vo.setResSdate(request.getParameter("resSdate"));
		vo.setResEdate(request.getParameter("resEdate"));
		vo.setResName(request.getParameter("resName"));
		vo.setResTel(request.getParameter("resTel"));
		if(service.modifyReserv(vo)) {
			HttpSession session = request.getSession();
			
			System.out.println(session.getAttribute("userId"));
			List<ReservVO> list = service.getPerReserv((String)session.getAttribute("userId"));
		
		request.setAttribute("List", list);
		System.out.println("===============================");
		System.out.println(list);
		uri="users/reserved.tiles";
		}
		return uri;
	}

}
