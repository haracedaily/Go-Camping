package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.ManagerService;
import co.prog.service.ManagerServiceMybatis;

public class UserRemoveAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService service = new ManagerServiceMybatis();
		boolean result = service.removeUser(request.getParameter("userId"));
		String json="";
		if (result) {//{ "retCode":"Success"}
			json = "{\"retCode\":\"Success\"}";
		} else { // {"retCode": "fail"}
			json = "{\"retCode\":\"fail\"}";
		}

		return json + ".ajax";
	}

}
