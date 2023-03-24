package co.prog.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prod.service.MemberService;
import co.prod.service.MemberServiceMybatis;
import co.prod.vo.MemberVO;
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
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("userId"));
		LocationService service = new LocationServiceMybatis();
		List<ReservVO> list = service.getPerReserv((String)session.getAttribute("userId"));
		ReservVO vo=new ReservVO();
		//vo.setId(request.getParameter("id"));
		//vo.setName(request.getParameter("name"));
		//vo.setPasswd(request.getParameter("passwd"));
		//vo.setMail(request.getParameter("email"));
		//vo.setAuth(request.getParameter("auth"));
		Map<String,Object> map = new HashMap<>();
		
		Gson gson = new GsonBuilder().create();
		String json="";
//		if(service.addMember(vo)) {
//			map.put("retCode","Success");
//			map.put("member", vo);
//		}else {
//			map.put("retCode","Fail");
//			map.put("member", null);
//		}
		json = gson.toJson(map);//자바의 객체 타입을 문자열로 넘기겠다(?)
		return json+".ajax";
	}

}
