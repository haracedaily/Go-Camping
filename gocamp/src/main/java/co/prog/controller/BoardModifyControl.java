package co.prog.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class BoardModifyControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String dir = request.getServletContext().getRealPath("upload");
		System.out.println("dir" + dir);
		int maxSize = 5 * 1024 * 1024;
		String enc = "UTF-8";

		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, dir, maxSize, enc, new DefaultFileRenamePolicy());
			// 여러부분요청 이 부분 다시 확인해보는 걸루
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int boId = Integer.parseInt(multi.getParameter("boId"));
		String title = multi.getParameter("title");
		String subject = multi.getParameter("subject");
		String attach = multi.getFilesystemName("attach");

		NoticeVO notice = new NoticeVO();

		notice.setBoId(boId);
		notice.setBoTitle(title);
		notice.setBoCont(subject);
		if (attach != null)
			notice.setBoImg(attach);

		NoticeService service = new NoticeServiceMybatis();
		service.noticeModify(notice);

		return "board.do?boId=" + boId + ".gyuri";

	}

}
