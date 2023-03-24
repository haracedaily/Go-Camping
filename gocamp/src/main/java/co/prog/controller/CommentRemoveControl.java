package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.CommentService;
import co.prog.service.CommentServiceMybatis;

public class CommentRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String coNo = request.getParameter("coNo");
		String boId = request.getParameter("boId");

		CommentService service = new CommentServiceMybatis();

		service.commentRemove(Integer.parseInt(coNo));

		return "board.do?boId=" + boId;
	}

}
