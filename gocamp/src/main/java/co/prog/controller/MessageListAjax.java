package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prog.common.Control;
import co.prog.service.MessageService;
import co.prog.service.MessageServiceMybatis;
import co.prog.vo.MessageVO;

public class MessageListAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		MessageService service = new MessageServiceMybatis();
		
		List<MessageVO> list = service.messageList();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); //json 포맷으로 변경
		return json + ".ajax";
	}

}
