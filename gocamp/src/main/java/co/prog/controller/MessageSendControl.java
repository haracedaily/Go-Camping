package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class MessageSendControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int mNum = Integer.parseInt(request.getParameter("mNum"));
		String uId = request.getParameter("uId");
		String mContent = request.getParameter("mContent");
		String mDate = request.getParameter("mDate");
		String mTitle = request.getParameter("mTitle");
		String mCheck = request.getParameter("mCheck");
		
		MessageVO vo = new MessageVO();
		vo.setMNum(mNum);
		vo.setUId(uId);
		vo.setMContent(mContent);
		vo.setMDate(mDate);
		vo.setMTitle(mTitle);
		vo.setMCheck(mCheck);
		
		System.out.println("입력:"+vo);
		MessageService service = new MessageServiceMybatis();
		boolean result = service.addMessage(vo);
		System.out.println(result);
		if(result) {
			System.out.println("성공");
			request.setAttribute("message", "쪽지 전송 완료");
			request.setAttribute("mNum", vo.getMNum());
		}else {
			System.out.println("실패");
			request.setAttribute("message", "쪽지 전송 실패");
		}
		return "manager/message.tiles";
	}

}
