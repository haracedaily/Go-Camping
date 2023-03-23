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

public class NoticeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");
		String usage = request.getParameter("usage");
		usage = usage == null ? "a" : usage;
		if (page == null) {
			page = "1";
		}

		// 목록
		NoticeService service = new NoticeServiceMybatis();
		List<NoticeVO> list = null;// service.noticeList();

		NoticeDTO dto = new NoticeDTO();
		dto.setPage(Integer.parseInt(page));
		dto.setUsage(usage);

		list = service.noticeListPage(dto);
		System.out.println("list : " + list);
		request.setAttribute("list", list);

		// 페이징.
		// List<NoticeVO> listpage = service.noticeListPage(Integer.parseInt(page));
		int total = service.getTotalCount(usage);
		System.out.println("total Cnt: " + total + ", usage: " + usage);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		String uri = "board/noticeList.tiles";
		return uri;

	}

}
