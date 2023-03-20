package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.vo.MessageVO;

public class MessageSendAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MessageVO vo = new MessageVO();
		
		return null;
	}

}
