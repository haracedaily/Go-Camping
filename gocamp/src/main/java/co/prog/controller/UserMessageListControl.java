package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class UserMessageListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		System.out.println("userID : "+userId);
		MessageService service = new MessageServiceMybatis();
		List<MessageVO> list = service.messageListByUser(userId);
		System.out.println(list);
		request.setAttribute("list", list);
		
		return "message/userMessage.tiles";
	}

}
