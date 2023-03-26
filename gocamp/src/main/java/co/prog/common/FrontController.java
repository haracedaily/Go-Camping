package co.prog.common;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prog.controller.AllReservControl;
import co.prog.controller.BoardAddControl;
import co.prog.controller.BoardControl;
import co.prog.controller.BoardFormControl;
import co.prog.controller.BoardListControl;
import co.prog.controller.BoardModifyControl;
import co.prog.controller.BoardModifyFormControl;
import co.prog.controller.BoardRemoveControl;
import co.prog.controller.CalendarControl;
import co.prog.controller.ChargeReservControl;
import co.prog.controller.CommentAddControl;
import co.prog.controller.CommentListControl;
import co.prog.controller.CommentRemoveControl;
import co.prog.controller.DelPerReservControl;
import co.prog.controller.GetMessageControl;
import co.prog.controller.GetMessageManagerControl;
import co.prog.controller.InsertUserControl;
import co.prog.controller.JoinControl;
import co.prog.controller.LocaControl;
import co.prog.controller.LocaListControl;
import co.prog.controller.LogOutControl;
import co.prog.controller.LoginControl;
import co.prog.controller.LoginFormControl;
import co.prog.controller.MainControl;
import co.prog.controller.ManageControl;
import co.prog.controller.MessageListControl;
import co.prog.controller.MessageRemoveControl;
import co.prog.controller.MessageSendAjax;
import co.prog.controller.MessageSendControl;
import co.prog.controller.MessageSendFormControl;
import co.prog.controller.NoticeControl;
import co.prog.controller.NoticeForm;
import co.prog.controller.NoticeFormAddControl;
import co.prog.controller.PerReservControl;
import co.prog.controller.PerReservModifyControl;
import co.prog.controller.ProductInfoControl;
import co.prog.controller.ProductListControl;
import co.prog.controller.ReReservControl;
import co.prog.controller.ReplyAddControl;
import co.prog.controller.ReplyModifyControl;
import co.prog.controller.ReplyRemoveControl;
import co.prog.controller.ReqReservControl;
import co.prog.controller.ReservControl;
import co.prog.controller.ReservListAjax;
import co.prog.controller.UserDeleteControl;
import co.prog.controller.UserInfoControl;
import co.prog.controller.UserInfoModControl;
import co.prog.controller.UserListAjax;
import co.prog.controller.UserListContol;
import co.prog.controller.UserMessageListControl;
import co.prog.controller.UserRemoveAjax;
import co.prog.controller.getPerReservControl;
import co.prog.controller.getPerReservListAjax;

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
		// 상품 (전체, 텐트, 테이블, 침낭/메트, 식기)

		map.put("/product.do", new ProductListControl());
		// 상품상세페이지
		map.put("/productInfo.do", new ProductInfoControl());

		map.put("/replyadd.do", new ReplyAddControl());

		map.put("/replyModify.do", new ReplyModifyControl());
		         
		map.put("/replyRemove.do", new ReplyRemoveControl());
		
	

		// 상품댓글)
		// map.put("/replyList.do", new ReplyListControl());

		// noticelist
		map.put("/noticeList.do", new NoticeControl());
		// noticeForm 등록화면 //글쓰기폼
		map.put("/noticeform.do", new NoticeForm());
		// noticeForm 등록처리
		map.put("/noticeformadd.do", new NoticeFormAddControl());
		// board list
		map.put("/boardList.do", new BoardListControl());
		// board 상세보기
		map.put("/board.do", new BoardControl());
		// boardForm 등록화면
		map.put("/boardform.do", new BoardFormControl());
		// 게시글등록처리.(a:공지사항, b:자유, c:중고, d:문의, e:건의.)
		map.put("/boardAdd.do", new BoardAddControl());
		// 수정조회화면
		map.put("/boardModifyForm.do", new BoardModifyFormControl());
		// 수정처리
		map.put("/boardModify.do", new BoardModifyControl());
		// 삭제
		map.put("/boardRemove.do", new BoardRemoveControl());

		// 댓글목록
		map.put("/commentList.do", new CommentListControl());
		// 댓글등록
		map.put("/commentAdd.do", new CommentAddControl());
		// 댓글삭제
		map.put("/commentRemove.do", new CommentRemoveControl());

		// 회원가입
		map.put("/insertUser.do", new InsertUserControl());
		// 회원가입 폼
		map.put("/join.do", new JoinControl());
		// 로그인 폼
		map.put("/loginForm.do", new LoginFormControl());
		// 로그인
		map.put("/login.do", new LoginControl());
		// 로그아웃
		map.put("/logOut.do", new LogOutControl());
		// 마이페이지 - 회원 정보 조회
		map.put("/userInfo.do", new UserInfoControl());
		// 마이페이지 - 회원 정보 수정
		map.put("/userInfoMod.do", new UserInfoModControl());
		// 마이페이지 - 회원 탈퇴
		map.put("/userDelete.do", new UserDeleteControl());
		
		//쪽지 관련
		//쪽지 - 쪽지 리스트 (관리자)
		map.put("/messageList.do", new MessageListControl());
		// 쪽지 - 쪽지 보내기 (관리자)
		map.put("/messageSendAjax.do", new MessageSendAjax());
		//쪽지 - 쪽지 읽기 ( 관리자)
		map.put("/getMessageManager.do", new GetMessageManagerControl());
		//쪽지 - 쪽지 보내기 폼 (관리자)
		map.put("/messageSendForm.do", new MessageSendFormControl());
		//쪽지 - 쪽지 보내기 (관리자)
		map.put("/messageSend.do", new MessageSendControl());
		//쪽지 - 쪽지 삭제 (관리자)
		map.put("/messageRemove.do", new MessageRemoveControl());
		//쪽지 - 쪽지 리스트 (회원)
		map.put("/userMessageList.do", new UserMessageListControl());
		//쪽지 - 쪽지 읽기 (회원)
		map.put("/getMessage.do", new GetMessageControl());
		// 쪽지 - 쪽지 삭제
		map.put("/messageRemove.do", new MessageRemoveControl());
		
		//관리자 페이지 - 회원 관리
		map.put("/userListControl.do", new UserListContol());
		map.put("/userListAjax.do", new UserListAjax());
		map.put("/userRemoveAjax.do", new UserRemoveAjax());

		map.put("/loca.do", new LocaControl());

		map.put("/calendar.do", new CalendarControl());

		map.put("/getReservListAjax.do", new ReservListAjax());

		map.put("/reserv.do", new ReservControl());



		map.put("/locaList.do", new LocaListControl());
		

		map.put("/locaDetail.do", new LocaListControl());
		
		map.put("/perReserv.do", new PerReservControl());
		
		map.put("/perReservModify.do", new PerReservModifyControl());
		
		map.put("/getPerReserv.do", new getPerReservControl());
		
		map.put("/getPerReservListAjax.do", new getPerReservListAjax());
		
		map.put("/delPerReserv.do", new DelPerReservControl());
		
		map.put("/ChargeReserv.do", new ChargeReservControl());
		
		map.put("/reqReserv.do", new ReqReservControl());
		
		map.put("/reReserv.do", new ReReservControl());
		
		map.put("/allreserv.do", new AllReservControl());
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");// 요청정보의 한글 처리.

		String uri = req.getRequestURI();
		String context = req.getContextPath();
		System.out.println(context);
		String page = uri.substring(context.length());
		System.out.println("do : " + page);

		Control command = map.get(page);
		System.out.println("command:" + command);

		String viewPage = command.exec(req, resp); // product/productList.tiles
		System.out.println("view:" + viewPage);

		if (viewPage.endsWith(".jsp")) {
			viewPage = "/WEB-INF/" + viewPage;
			
//		} else if (viewPage.endsWith(".tiles")) { // members.do(...tiles)
			// viewPage = "/" + viewPage;

		} else if (viewPage.endsWith(".ajax")) {
			resp.setContentType("text/json;charset=utf-8");
			resp.getWriter().append(viewPage.substring(0, viewPage.length() - 5));
			return;
			
		} else if (viewPage.endsWith(".do")) {
			resp.sendRedirect(viewPage);
			return;
			
		}else if (viewPage.endsWith(".gyuri")) {
			resp.sendRedirect(viewPage.substring(0, viewPage.length() - 6));
			return;
			
		} else if (viewPage.indexOf(".do") != -1) {
			resp.sendRedirect(viewPage);
			return;
		}
		// 페이지 재지정.
		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);

	}
}
