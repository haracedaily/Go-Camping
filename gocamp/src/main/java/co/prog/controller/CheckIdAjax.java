package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;
import co.prog.service.UsersService;
import co.prog.service.UsersServiceMybatis;

public class CheckIdAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		
		String userId = request.getParameter("userId");
		
		UsersService service = new UsersServiceMybatis();
		boolean result = service.checkId(userId);
		
		
		String json ="";
		if(result) {
			json = "{\"retCode\" : \"Success\"}";
		}else {
			json = "{\"retCode\" : \"Fail\"}";
		}
		return json + ".ajax";
	}

}
