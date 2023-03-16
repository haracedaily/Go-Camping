package co.prog.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.controller.MainControl;
import co.prog.controller.ManageControl;
import co.prog.controller.ProductControl;



public class FrontController extends HttpServlet {
	private Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init() throws ServletException {
		// url <-> control
		map.put("/main.do", new MainControl());
		map.put("/product.do", new ProductControl());
		map.put("/manage.do", new ManageControl());

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		System.out.println(context);
		String page = uri.substring(context.length());
		System.out.println("do : " + page);
		
		Control command = map.get(page);
		String viewPage = command.exec(req, resp); //product/productList.tiles
		
		if (viewPage.endsWith(".jsp")) {
			viewPage = "WEB-INF/" + viewPage;
//		} else if (viewPage.endsWith(".tiles")) { // members.do(...tiles)
			//viewPage = "/" + viewPage;

		} else if(viewPage.endsWith(".ajax")) {
			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().append(viewPage.substring(0,viewPage.length()-5));
			return;
		}
		// 페이지 재지정.
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);

	}
}
