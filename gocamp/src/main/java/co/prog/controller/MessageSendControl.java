package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class MessageSendControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String mContent = request.getParameter("mContent");
		String mTitle = request.getParameter("mTitle");
		
		MessageVO vo = new MessageVO();
		vo.setUserId(userId);
		vo.setMContent(mContent);
		vo.setMTitle(mTitle);
		
		System.out.println("입력:"+vo);
		MessageService service = new MessageServiceMybatis();
		boolean result = service.addMessage(vo);
		service.addMessageUser(vo);
		System.out.println(result);
		
		List<MessageVO> list = service.messageList();
		
		request.setAttribute("list", list);
		return "message/message.tiles";
	}

}
