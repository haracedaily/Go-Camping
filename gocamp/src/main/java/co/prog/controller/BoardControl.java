package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.CommentService;
import co.prog.service.CommentServiceMybatis;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.CommentVO;
import co.prog.vo.NoticeVO;

public class BoardControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String boId = request.getParameter("boId");

		NoticeService service = new NoticeServiceMybatis();
		NoticeVO vo = service.getNotice(Integer.parseInt(boId));
		request.setAttribute("notice", vo);

		CommentService serv = new CommentServiceMybatis();
		List<CommentVO> list = serv.getComm(Integer.parseInt(boId));
		System.out.println(list);
		request.setAttribute("List", list);

		String uri = "board/board.tiles";

		return uri;

	}

}
