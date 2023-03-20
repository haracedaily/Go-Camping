package co.prog.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.prog.common.Control;
import co.prog.service.NoticeService;
import co.prog.service.NoticeServiceMybatis;
import co.prog.vo.NoticeVO;

public class NoticeFormAddControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {

		String dir = request.getServletContext().getRealPath("upload");
		System.out.println("dir" + dir);
		int maxSize = 5 * 1024 * 1024;
		String enc = "UTF-8";
		try {
			request.setCharacterEncoding(enc);
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try {
			MultipartRequest multi = new MultipartRequest(request, dir, maxSize, new DefaultFileRenamePolicy());
			// 여러부분요청 이 부분 다시 확인해보는 걸루
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String boTitle = request.getParameter("title");
		String boCont = request.getParameter("subject");
		String boImg = request.getParameter("attach");// 요거는 사용자가 올린 파일명
		// 우리가 DB에 셋 시켜야하는건 혹시나 동일 파일명이 있을때 재정의 된 파일명
		NoticeVO vo = new NoticeVO();

		vo.setBoId(Integer.parseInt(request.getParameter("boId")));// 규리씨 숙제 시퀀스 또는 다른 방식으로라도 자동으로 게시판 별로 차별둬서 다른값 들어가는 방법 찾기
		// 여러글을 써도 게시판아이디가 자동으로 바뀔 수 있게(중복방지)

		vo.setBoTitle(boTitle);
		vo.setBoCont(boCont);
		vo.setBoImg(boImg); // 이미지 올릴때 위에 test 이름 바꿔서하기
		vo.setUserId(request.getParameter("userId"));
		System.out.println(vo);
		NoticeService service = new NoticeServiceMybatis();
		if (service.addNotice(vo)) {
			request.setAttribute("message", "글작성 완료");
		}
		;
		return "board/notice.tiles";
	}
}
