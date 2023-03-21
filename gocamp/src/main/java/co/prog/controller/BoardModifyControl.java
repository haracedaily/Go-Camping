package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class BoardModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int boId = Integer.parseInt(request.getParameter("boId"));
		String title = request.getParameter("title");
		String subject = request.getParameter("subject");
		String attach = request.getParameter("attach");
		
		NoticeVO notice = new NoticeVO();
		notice.setBoId(boId);
		notice.setBoTitle(title);
		notice.setBoCont(subject);
		notice.setBoImg(attach);
		
		
		return "board/boardlist.tiles";
	}

}
