package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.LocationService;
import co.prog.service.LocationServiceMybatis;
import co.prog.vo.LocaVO;
import co.prog.vo.LocationVO;

public class LocaControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터: cat, order

		String addr = request.getParameter("addrs");
		String choice = request.getParameter("choice");
		
		addr = addr == null ? "all%" : addr+"%";
		choice = choice == null ? "all" : choice;
		System.out.println("========================");
		System.out.println("addr : "+addr);
		System.out.println("choice :"+choice);
		LocationVO con = new LocationVO();
		con.setAddrs(addr);
		con.setChoice(choice);
		
		LocationService service = new LocationServiceMybatis();
		List<LocationVO> list = service.getAllLocaList(con);
		List<String> locaAddr = service.getAlmostLocaList(con);
		System.out.println(locaAddr);
		System.out.println("확인 : "+list);
		request.setAttribute("addr", addr);
		request.setAttribute("list", list);
		request.setAttribute("check", list);
		String loAddr = "";
		for(int i=0;i<locaAddr.size();i++) {
		loAddr += locaAddr.get(i);
		if (i!=locaAddr.size()-1) {
			loAddr += ",";
		}
		}
		request.setAttribute("locaAddr", locaAddr);
		System.out.println(loAddr);
		request.setAttribute("loAddr", loAddr);
		
		String uri = "loca/loca.tiles";
		return uri;
	}

}
