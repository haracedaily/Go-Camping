package co.prog.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class BoardAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String dir = request.getServletContext().getRealPath("upload");
		System.out.println("dir:" + dir);
		int maxSize = 5 * 1024 * 1024; // 5메가
		String enc = "UTF-8";

		try {
			MultipartRequest multi = new MultipartRequest(request, dir, maxSize, enc, new DefaultFileRenamePolicy());
			// 사용자 입력값 처리

			NoticeVO vo = new NoticeVO();
			String usage = multi.getParameter("usage");
			String title = multi.getParameter("title");
			String subject = multi.getParameter("subject");
			String attach = // multi.getParameter("attach");
					multi.getFilesystemName("attach");

			HttpSession session = request.getSession();
			session.setAttribute("userId", "a0002");

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

		return "boardList.do";
	}

}
