package co.prog.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeDTO;
import co.prog.vo.NoticeVO;
import co.prog.vo.PageDTO;

public class BoardAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		// 글등록
		String dir = request.getServletContext().getRealPath("upload");
		System.out.println("dir:" + dir);
		int maxSize = 5 * 1024 * 1024; // 5메가
		String enc = "UTF-8";
		String usage = "b";
		try {
			MultipartRequest multi = new MultipartRequest(request, dir, maxSize, enc, new DefaultFileRenamePolicy());
			// 사용자 입력값 처리

			NoticeVO vo = new NoticeVO();
			usage = multi.getParameter("usage");
			String title = multi.getParameter("title");
			String subject = multi.getParameter("subject");
			String attach = // multi.getParameter("attach");
					multi.getFilesystemName("attach");

			HttpSession session = request.getSession();
			session.setAttribute("Id", "a0002");

			vo.setUsage(usage);
			vo.setBoTitle(title);
			vo.setBoCont(subject);
			vo.setBoImg(attach);
			vo.setUserId((String) session.getAttribute("userId"));

			System.out.println(vo);

			NoticeService service = new NoticeServiceMybatis();
			service.addNotice(vo);

		} catch (IOException e) {
			e.printStackTrace();
		}

		
		String uri = "board/boardList.tiles";

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

		NoticeService service = new NoticeServiceMybatis();
		List<NoticeVO> boardlist = null;
		// 게시판의 페이지와 게시판종류 => NoticeDTO
		NoticeDTO noticeDto = new NoticeDTO();
		noticeDto.setPage(Integer.parseInt(page));
		noticeDto.setUsage(usage);

		boardlist = service.boardListPage(noticeDto);
		System.out.println("list :" + boardlist);
		request.setAttribute("boardlist", boardlist);

		// List<NoticeVO> boardlistpage = service.boardListPage(Integer.parseInt(page));
		int total = service.getTotalCount(usage);
		request.setAttribute("page", new PageDTO(Integer.parseInt(page), total));

		return uri;

		// return "boardList.do";
	}

}
