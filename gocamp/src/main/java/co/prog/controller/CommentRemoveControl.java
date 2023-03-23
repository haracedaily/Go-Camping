package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.CommentService;
import co.prog.service.CommentServiceMybatis;


public class CommentRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String cNo = request.getParameter("cNo");
		int boId = Integer.parseInt(request.getParameter("boId"));
		
		CommentService service = new CommentServiceMybatis();
		
		service.commentRemove(Integer.parseInt(cNo));
		
		return "board/board.tiles";
	}

}
