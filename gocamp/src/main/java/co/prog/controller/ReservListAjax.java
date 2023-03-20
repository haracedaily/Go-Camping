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

public class ReservListAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		LocationService service = new LocationServiceMybatis();
		
		
		List<ReservVO> list = service.getReservList(1);
		
		// {"id":"user1", "passwd":"1234", "name":"홍길동" ...} => json
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // json 포맷(위와 같은 문자열)으로 변경
				
		return json + ".ajax";
	}

}
