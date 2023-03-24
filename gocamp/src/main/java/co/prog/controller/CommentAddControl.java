package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.CommentService;
import co.prog.service.CommentServiceMybatis;
import co.prog.vo.CommentVO;
import co.prog.vo.NoticeVO;

public class CommentAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String boId = request.getParameter("bo_id");
		String content = request.getParameter("c_content");

		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("userId");

		CommentVO vo = new CommentVO();
		vo.setBoId(Integer.parseInt(boId));
		vo.setUserId(uid);
		vo.setCoContent(content);

		System.out.println(vo);

		CommentService service = new CommentServiceMybatis();
		service.addComment(vo);

		return "board.do?boId=" + boId;
	}

}
