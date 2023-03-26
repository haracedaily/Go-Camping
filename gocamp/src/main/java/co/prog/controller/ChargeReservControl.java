package co.prog.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class ChargeReservControl implements Control {
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LocationService service = new LocationServiceMybatis();

		String list=request.getParameter("resId");
		System.out.println("받아온 resId 형태는========================");
		System.out.println(list);
		String[] test = list.split(",");
		
		System.out.println(",기준으로 쪼갠 list=======================");
		System.out.println(test);

		System.out.println("===============쪼개진 list 분해하기");
		for(int i=0;i<test.length;i++) {
			String test1=test[i];
			System.out.println(test1);
			service.chargeReserv(Integer.parseInt(test[i]));
		};
		
		
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		
		List<ReservVO> list1 = service.getPerReserv((String)session.getAttribute("userId"));
		
		request.setAttribute("List", list1);
		System.out.println("===============================");
		System.out.println(list1);
		
		return "users/reserved.tiles";
	}

}
