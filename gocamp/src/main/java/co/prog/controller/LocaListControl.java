package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.LocationVO;

public class LocaListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String addr = request.getParameter("addr");

		addr = addr == null ? "all" : addr; // 조건없을 경우.

		LocationVO con = new LocationVO();
		con.setAddrs(addr);

		LocationService service = new LocationServiceMybatis();
		List<LocationVO> list = service.getAllLocaList(con);

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // json 포맷(위와 같은 문자열)으로 변경
				
		return json + ".ajax";
	}

}
