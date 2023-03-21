package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class GetMessageControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String uId = request.getParameter("userId");
		
		MessageService service = new MessageServiceMybatis();
		MessageVO vo = service.getMessage(0);//추후 수정
		return null;
	}

}
