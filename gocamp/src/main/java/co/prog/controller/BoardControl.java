package co.prog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class BoardControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String boId = request.getParameter("boId");
		
		NoticeService service = new NoticeServiceMybatis();
		NoticeVO vo = service.getNotice(boId);
		
		request.setAttribute("notice", vo);
		
		String uri = "board/board.tiles";
		return uri;
				
		
	}

}
