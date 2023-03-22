package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;

public class MessageRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String mNum = request.getParameter("mNum");
		
		MessageService service = new MessageServiceMybatis();
		//int message = 
		
		return null;
	}

}
