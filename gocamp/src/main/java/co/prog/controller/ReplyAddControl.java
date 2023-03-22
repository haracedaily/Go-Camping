package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.ReplyService;
import co.prog.service.ReplyServiceMybatis;
import co.prog.vo.ReplyVO;

public class ReplyAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String sku = request.getParameter("sku");
		String userId = request.getParameter("userId");
		String repCon = request.getParameter("repCon");
	
		
		ReplyVO vo = new ReplyVO();
		vo.setSku(sku);
		vo.setUserId(userId);
		vo.setRepCon(repCon);
		
	
		System.out.println(vo);
		
		System.out.println("입력: " + vo);
		
		ReplyService service = new ReplyServiceMybatis();
		boolean result = service.addReply(vo);
		System.out.println(result);
		
		return "productInfo.do?code="+sku; 
	}
}
