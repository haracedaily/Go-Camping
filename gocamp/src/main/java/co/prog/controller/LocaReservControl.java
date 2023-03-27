package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.LocationVO;

public class LocaReservControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String addr = request.getParameter("addrs");
		String choice = request.getParameter("locaId");
		
		addr = addr == null ? "all%" : addr+"%";
		choice = choice == null ? "all" : choice;
		System.out.println("========================");
		System.out.println("choice :"+choice);
		System.out.println("addr : "+addr);
		LocationVO con = new LocationVO();
		con.setChoice(choice);
		con.setAddrs(addr);
		
		LocationService service = new LocationServiceMybatis();
		LocationVO list = service.getLocaDetail(con);
		List<LocationVO> allList=service.getAllLocaList(con);
		String locaAddr = service.getLocaAddr(con);
		System.out.println(locaAddr);
		System.out.println("확인 : "+list);
		request.setAttribute("list", list);
		request.setAttribute("check", allList);
		String loAddr = "";
		loAddr += locaAddr;
		int roomId = list.getLocaId();
		String locaNm = service.getLocaNm(con);
		request.setAttribute("loNm", locaNm);
		request.setAttribute("locaAddr", locaAddr);
		System.out.println(loAddr);
		request.setAttribute("loAddr", loAddr);
		request.setAttribute("locaId", roomId);
		String uri = "loca/locaReserv.tiles";
		return uri;
	}

}
