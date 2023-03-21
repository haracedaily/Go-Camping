package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class UserMessageListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		MessageService service = new MessageServiceMybatis();
		List<MessageVO> list = service.messageList();
		
		request.setAttribute("list", list);
		
		return "users/userMessage.tiles";
	}

}
