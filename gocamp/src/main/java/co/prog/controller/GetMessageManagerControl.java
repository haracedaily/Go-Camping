package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class GetMessageManagerControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String mNum = request.getParameter("mNum");

		MessageService service = new MessageServiceMybatis();
		MessageVO vo = service.getMessageM(Integer.parseInt(mNum));
		
		System.out.println(vo);
		
		request.setAttribute("message", vo); //message 어트리뷰트에 vo 객체를 담아 넘김
		
		return "message/getMessageManager.tiles";
	}

}
