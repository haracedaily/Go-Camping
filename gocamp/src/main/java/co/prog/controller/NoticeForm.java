package co.prog.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;

public class NoticeForm implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		return "board/noticeForm.tiles";
	}

}
