package co.prog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.common.Control;

public class ProductControl implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String uri="test.tiles";
		return uri;
	}

	
}
