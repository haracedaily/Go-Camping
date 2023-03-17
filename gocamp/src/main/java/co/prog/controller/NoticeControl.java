package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class NoticeControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		NoticeService service = new NoticeServiceMybatis();
		List<NoticeVO> list = service.noticeList();
		System.out.println(list);
		
		request.setAttribute("noticelist", list);

		String uri = "board/notice.tiles";
		return uri;
		
		
	}

}
