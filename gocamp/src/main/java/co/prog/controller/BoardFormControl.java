package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;

public class BoardFormControl implements Control {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String usage = req.getParameter("usage");
		String uri = "board/boardForm.tiles";
		
		if (usage == null) {
			usage = "b";
		}
		req.setAttribute("usage", usage);
		if (usage.equals("b")) {
			req.setAttribute("usageName", "자유게시판");
		} else if (usage.equals("c")) {
			req.setAttribute("usageName", "중고게시판");
		} else if (usage.equals("d")) {
			req.setAttribute("usageName", "문의게시판");
		} else if (usage.equals("e")) {
			req.setAttribute("usageName", "건의게시판");
		} else if (usage.equals("f")) {
			req.setAttribute("usageName", "Event");
		} else if (usage.equals("a")) {
			req.setAttribute("usageName", "공지사항");
		}

		return uri;

	}

}
