package co.prog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prog.common.Control;
import co.prog.service.ManagerService;
import co.prog.service.ManagerServiceMybatis;
import co.prog.vo.UsersVO;

public class UserListAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ManagerService service = new ManagerServiceMybatis();
		List<UsersVO> list = service.userList();

		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // json 포맷으로 변경.
		return json + ".ajax";
	}

}
