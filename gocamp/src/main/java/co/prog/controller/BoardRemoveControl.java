package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;
import co.prog.vo.PageDTO;

public class BoardRemoveControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String boId = request.getParameter("boId");
		NoticeService service = new NoticeServiceMybatis();
		
		service.noticeRemove(Integer.parseInt(boId));
		//여기까지가 삭제 끝;
		
		
		
		//여기부터 리스트 다시 띄우기 위해서 조회,페이징 설정
		String usage = request.getParameter("usage");
		System.out.println("===============");
		System.out.println("확인 : "+usage);
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

		String page = request.getParameter("page");

		if (page == null) {
			page = "1";
		}

		NoticeService serv = new NoticeServiceMybatis();
		List<NoticeVO> boardlist = null;
		// 게시판의 페이지와 게시판종류 => NoticeDTO
		NoticeDTO dto = new NoticeDTO();
		dto.setPage(Integer.parseInt(page));
		dto.setUsage(usage);

		boardlist = serv.boardListPage(dto);
		System.out.println("list :" + boardlist);
		request.setAttribute("boardlist", boardlist);

		// List<NoticeVO> boardlistpage = service.boardListPage(Integer.parseInt(page));
		int total = serv.getTotalCount(usage);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));
		
		return "board/boardList.tiles";
	}

}
