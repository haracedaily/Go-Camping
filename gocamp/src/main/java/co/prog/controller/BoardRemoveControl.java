package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;

public class BoardRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int boId = Integer.parseInt(request.getParameter("boId"));
		
		NoticeService service = new NoticeServiceMybatis();
		
		service.noticeRemove(boId);
		
		return "board/boardlist.tiles";
	}

}
