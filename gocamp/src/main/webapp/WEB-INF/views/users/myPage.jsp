<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
          <form class="contact-form" action="userInfoMod.do" method="post">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" id="userName" name="userName" readonly>
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label for="id">아이디</label>
                  <input type="text" class="form-control" id="userId" name="userId" readonly>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="pw">비밀번호</label>
              <input type="password" class="form-control" id="userPw" name="userPw">
            </div>

            <div class="form-group">
              <label for="nickname">닉네임</label><button>중복확인</button>
              <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
            
            <div class="form-group">
              <label for="sinnum">주민등록번호</label>
              <input type="tel" class="form-control" id="sinNum" name="sinNum" readonly>
            </div>
            
			 <div class="form-group">
              <label for="tel">전화번호</label>
              <input type="tel" class="form-control" id="userTel" name="userTel">
            </div>

            <div class="form-group">
              <label for="addr">주소</label>
              <input type="text" class="form-control" id="userAddr" name="userAddr">
            </div>
            
			 <button id="modBtn" type="submit" class="btn btn-primary mb-4">정보 수정</button>
          
</form>

<script>
	document.getElementById('userName').value="${user.getUserName()}";
	document.getElementById('userId').value="${user.getUserId()}";
	document.getElementById('nickname').value="${user.getNickname()}";
	document.getElementById('sinNum').value="${user.getSinNum()}";
	document.getElementById('userTel').value="${user.getUserTel()}";
	document.getElementById('userAddr').value="${user.getUserAddr()}";
</script>