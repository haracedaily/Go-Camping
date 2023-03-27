package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class MessageRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String mNum = request.getParameter("mNum");
		
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		MessageService service = new MessageServiceMybatis();
		int message = service.messageRemove(Integer.parseInt(mNum));
		
		List<MessageVO> list = service.messageListByUser(userId);
		System.out.println(list);
		request.setAttribute("list", list);
		
		return "message/userMessage.tiles";
	}

}
