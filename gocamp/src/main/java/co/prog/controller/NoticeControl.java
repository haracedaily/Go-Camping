package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;
import co.prog.vo.PageDTO;

public class NoticeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page");

		if (page == null) {
			page = "1";
		}

		// 목록
		NoticeService service = new NoticeServiceMybatis();
		List<NoticeVO> list = null;// service.noticeList();
		list = service.noticeListPage(Integer.parseInt(page));
		System.out.println("list : " + list);
		request.setAttribute("list", list);

		// 페이징.
		List<NoticeVO> listpage = service.noticeListPage(Integer.parseInt(page));
		int total = service.getTotalCount();
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		String uri = "board/notice.tiles";
		return uri;

	}

}
