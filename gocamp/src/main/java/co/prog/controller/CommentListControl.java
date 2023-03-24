package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.CommentService;
import co.prog.service.CommentServiceMybatis;
import co.prog.vo.CommentVO;
import co.prog.vo.NoticeDTO;
import co.prog.vo.PageDTO;

public class CommentListControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String usage = request.getParameter("usage");
		
		
		CommentService service = new CommentServiceMybatis();
		List<CommentVO> list = null;
		
		NoticeDTO dto = new NoticeDTO();
		dto.setPage(Integer.parseInt(page));
		dto.setUsage(usage);
		
		list = service.commentListPage(dto);
		System.out.println("list : " + list);
		request.setAttribute("list", list);
		
		int total = service.getTotalCount(usage);
		System.out.println("total Cnt: " + total + ", usage: " + usage);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		String uri = "board/board.tiles";
		return uri;
		
	}

}
