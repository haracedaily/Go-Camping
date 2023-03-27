	package co.prog.controller;
	
	import java.io.UnsupportedEncodingException;
	
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	
	import co.prog.common.Control;
	import co.prog.service.UsersService;
	import co.prog.service.UsersServiceMybatis;
	import co.prog.vo.UsersVO;
	
	public class UserInfoModControl implements Control {
	
		@Override
		public String exec(HttpServletRequest request, HttpServletResponse response){
			
			try {
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			HttpSession session = request.getSession();
			session = request.getSession();
			
			UsersVO userO = (UsersVO)session.getAttribute("oldInfo");
			
			String userPw = request.getParameter("userPw"); //비밀번호
			String nickname = request.getParameter("nickname"); //닉네임
			String userTel = request.getParameter("userTel"); //연락처
			String addr = request.getParameter("userAddr"); //주소
			String userId = request.getParameter("userId");
			String userNm = request.getParameter("userName");
			
			UsersVO user = new UsersVO();
			
			user.setUserPw(userPw);
			user.setNickname(nickname);
			user.setUserTel(userTel);
			user.setUserId(userId);
			user.setUserAddr(addr);
			user.setUserName(userNm);
			
			System.out.println("수정 정보 : "+user);
			
			
			
			UsersService service = new UsersServiceMybatis();
			if(service.modifyUsers(user) == true) {
				request.setAttribute("message", "정보 수정이 완료되었습니다.");
				session.setAttribute("user", user);
			}else {
				request.setAttribute("message", "정보 수정에 실패했습니다.");
			}
			return "users/myPage.tiles";
		}
	
	}
