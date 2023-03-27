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
		System.out.println(vo);
		request.setAttribute("notice", vo);
		
		String usage = vo.getUsage();
		
		
		if (usage == null) {
			usage = "b";
		}
		request.setAttribute("usage", usage);
		if (usage.equals("b")) {
			request.setAttribute("usageName", "자유");
		} else if (usage.equals("c")) {
			request.setAttribute("usageName", "중고");
		} else if (usage.equals("d")) {
			request.setAttribute("usageName", "문의");
		} else if (usage.equals("e")) {
			request.setAttribute("usageName", "건의");
		} else if (usage.equals("f")) {
			request.setAttribute("usageName", "Event");
		} else if (usage.equals("a")) {
			request.setAttribute("usageName", "공지사항");
		}

		CommentService serv = new CommentServiceMybatis();
		List<CommentVO> list = serv.getComm(Integer.parseInt(boId));
		System.out.println(list);
		request.setAttribute("List", list);

		String uri = "board/board.tiles";

		return uri;

	}

}
