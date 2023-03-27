package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;
import co.prog.vo.NoticeVO;
import co.prog.vo.UsersVO;

public class BoardModifyFormControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String userId = request.getParameter("userId");
		
		
		String uri = "board/boardModify.tiles";
		String usage = request.getParameter("usage");
		int boId = Integer.parseInt(request.getParameter("boId"));
		
		NoticeService service = new NoticeServiceMybatis();
		NoticeVO vo = service.getNotice(boId);


		
		request.setAttribute("notice", vo);
		
	
		
		if (usage == null) {
			usage = "b";
		}
		request.setAttribute("usage", usage);
		if (usage.equals("b")) {
			request.setAttribute("usageName", "자유게시판");
		} else if (usage.equals("c")) {
			request.setAttribute("usageName", "중고게시판");
		} else if (usage.equals("d")) {
			request.setAttribute("usageName", "문의게시판");
		} else if (usage.equals("e")) {
			request.setAttribute("usageName", "건의게시판");
		} else if (usage.equals("f")) {
			request.setAttribute("usageName", "Event");
		} else if (usage.equals("a")) {
			request.setAttribute("usageName", "공지사항");
		}

		return uri;
		
	}

}
