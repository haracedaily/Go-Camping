package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class AllCancleReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		LocationService service = new LocationServiceMybatis();

		String list=request.getParameter("resId");
		System.out.println(list);
		String[] test = list.split(",");
		
		System.out.println(test);

		for(int i=0;i<test.length;i++) {
			String test1=test[i];
			System.out.println(test1);
			service.deleteReserv(Integer.parseInt(test[i]));
		};
		List<ReservVO> list1 = service.getAllReserv();
		request.setAttribute("List", list1);
		
		request.setAttribute("List", list1);
		System.out.println("===============================");
		System.out.println(list1);
		return "manager/reservList.tiles";
	}

}
