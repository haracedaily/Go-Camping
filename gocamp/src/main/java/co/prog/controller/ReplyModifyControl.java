package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ReplyService;
import co.prog.service.ReplyServiceMybatis;
import co.prog.vo.ReplyVO;

public class ReplyModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String code = request.getParameter("code");
		int repNum = Integer.parseInt(request.getParameter("repNum"));
		String repCon=request.getParameter("repCon");
		
		ReplyVO vo = new ReplyVO();
		vo.setSku(code);
		vo.setRepNum(repNum);
		vo.setRepCon(repCon);
		
	
		System.out.println("result: " + vo);
		ReplyService service = new ReplyServiceMybatis();
		if(service.replyModify(vo)) {
			request.setAttribute("message", "수정 완료.");
		} else {
			request.setAttribute("message", "예외 발생.");
		}
		

		return "productInfo.do?code=" + code;
	}
}
