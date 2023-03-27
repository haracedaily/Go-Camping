package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.ReservVO;

public class getPerReservListAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		LocationService service = new LocationServiceMybatis();
		ReservVO vo = new ReservVO();
		vo.setRoomId(Integer.parseInt(request.getParameter("roomId")));
		vo.setResId(Integer.parseInt(request.getParameter("resId")));

		List<ReservVO> list = service.getPReservList(vo);
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list);
		
		return json + ".ajax";
	}

}
