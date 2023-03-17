<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <div class="untree_co-section bg-light">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <h2 class="text-secondary heading-2">로그인</h2>
          <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-5 bg-white p-5">
          <form class="contact-form" action="login.do" method="post" >

            <div class="form-group">
              <label class="text-black" for="userId">아이디</label>
              <input type="text" class="form-control" id="userId" name="userId">
            </div>

            <div class="form-group">
              <label class="text-black" for="userPw">비밀번호</label>
              <input type="password" class="form-control" id="userPw" name="userPw">
            </div>

            

            <button type="submit" class="btn btn-primary mb-4">로그인</button>

            <div class="form-group">
              <p><small>아직 계정이 없으시다면? <a href="join.do">회원가입 하기</a></small></p>
            </div>
          </form>
        </div> <!-- /.col-lg-7 -->
      </div> <!-- /.row -->
    </div> <!-- /.container -->
  </div> <!-- /.untree_co-section bg-light -->