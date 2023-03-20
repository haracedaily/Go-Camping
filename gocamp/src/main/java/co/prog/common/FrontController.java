package co.prog.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.controller.BoardAddControl;
import co.prog.controller.BoardControl;
import co.prog.controller.BoardFormControl;

import co.prog.controller.BoardModifyControl;
import co.prog.controller.BoardRemoveControl;
import co.prog.controller.CalendarControl;
import co.prog.controller.InsertUserControl;

import co.prog.controller.JoinControl;
import co.prog.controller.LogOutControl;
import co.prog.controller.LoginControl;
import co.prog.controller.LoginFormControl;
import co.prog.controller.MainControl;
import co.prog.controller.ManageControl;
import co.prog.controller.NoticeControl;
import co.prog.controller.LocaControl;
import co.prog.controller.NoticeForm;
import co.prog.controller.NoticeFormAddControl;
import co.prog.controller.ProductListControl;
import co.prog.controller.ReservControl;
import co.prog.controller.ReservListAjax;
import co.prog.controller.UserInfoControl;
import co.prog.controller.UserInfoMod;




public class FrontController extends HttpServlet {
	private Map<String, Control> map;

	public FrontController() {
		map = new HashMap<>();
	}

	@Override
	public void init() throws ServletException {
		// url <-> control
		map.put("/main.do", new MainControl());
	
		map.put("/manage.do", new ManageControl());
	
		
		//상품 (전체, 텐트, 테이블, 침낭/메트, 식기)
		map.put("/product.do", new ProductListControl());
		
		
		//notice
		map.put("/notice.do", new NoticeControl());
		//noticeForm//등록화면
		map.put("/noticeform.do", new NoticeForm());
		//등록처리
		map.put("/noticeformadd.do", new NoticeFormAddControl());
		//boardForm
		map.put("/boardform.do", new BoardFormControl());

		map.put("/boardAdd.do", new BoardAddControl());
		//board
		map.put("/board.do", new BoardControl());
		//수정
		map.put("/boardModify.do", new BoardModifyControl());
		//삭제
		map.put("/boardRemove.do", new BoardRemoveControl());
		//회원가입
		map.put("/insertUser.do", new InsertUserControl());
		//회원가입 폼

		map.put("/join.do", new JoinControl());
		//로그인 폼
		map.put("/loginForm.do", new LoginFormControl());
		//로그인
		map.put("/login.do", new LoginControl());
		//로그아웃
		map.put("/logOut.do", new LogOutControl());
		//마이페이지 - 회원 정보 조회
		map.put("/userInfo.do", new UserInfoControl());
		//마이페이지 - 회원 정보 수정
		map.put("/userInfoMod.do", new UserInfoMod());

		map.put("/loca.do", new LocaControl());
		
		map.put("/calendar.do", new CalendarControl());
		
		map.put("/getReservListAjax.do", new ReservListAjax());
		
		map.put("/reserv.do", new ReservControl());

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		String context = req.getContextPath();
		System.out.println(context);
		String page = uri.substring(context.length());
		System.out.println("do : " + page);
		
		Control command = map.get(page);
		System.out.println("command:"+command);
		String viewPage = command.exec(req, resp); //product/productList.tiles
		System.out.println("view:"+viewPage);
		if (viewPage.endsWith(".jsp")) {
			viewPage = "/WEB-INF/" + viewPage;
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
