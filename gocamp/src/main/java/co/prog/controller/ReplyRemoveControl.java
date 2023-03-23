package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ReplyService;
import co.prog.service.ReplyServiceMybatis;
import co.prog.vo.ReplyVO;

public class ReplyRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// 상품코드(code), 댓글번호(repNum)

		String code = request.getParameter("code");
		int repNum = Integer.parseInt(request.getParameter("repNum"));
		
		ReplyService service = new ReplyServiceMybatis();
		int result = service.replyRemove(repNum);
	
		System.out.println("result: " + result);

		if (result != 0) {
			request.setAttribute("message", "삭제성공");
		} else {
			request.setAttribute("message", "삭제실패");
		}

		return "productInfo.do?code=" + code;
	}
}
