<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#cForm{
  margin: 0 auto;
}

</style>
<div>
	<sidebar>
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
	</sidebar>
<body>
<section class="py-5" id="cForm">
	<div class="row justify-content-center" >
		<div>
			<form class="contact-form" id="userInfoMod">
				<div class="row">
					<div class="col-12">
						<div class="form-group">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="userName" name="userName" readonly>
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId" readonly>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="userPw" name="userPw">
				</div>

				<div class="form-group">
					<label for="nickname">닉네임</label>
					<input type="text" class="form-control" id="nickname"
						name="nickname">
				</div>


				<div class="form-group">
					<label for="tel">전화번호</label> <input type="tel"
						class="form-control" id="userTel" name="userTel">
				</div>

            <div class="form-group">
              <label for="userAddr">주소</label>
              <input type="text" class="form-control" id="userAddr" name="userAddr">
            </div>

				<button id="modBtn" type="submit" class="btn btn-primary mb-4">정보
					수정</button>

			</form>
		</div>
	</div>
</section>
</div>


<form id="modFrm" action="userInfoMod.do" method="post">
<input type="hidden" id="nm" name="userNmae">
 <input type="hidden" id="id" name="userId">
 <input type="hidden" id="pw" name="userPw">
 <input type="hidden" id="nN" name="nickname">
 <input type="hidden" id="uT" name="userTel">
 <input type="hidden" id="uA" name="userAddr">
</form>



<script>
	//myPage 클릭 시 회원 정보 노출
	document.getElementById('userName').value = "${user.getUserName()}";
	document.getElementById('userId').value = "${user.getUserId()}";
	document.getElementById('nickname').value = "${user.getNickname()}";
	document.getElementById('userTel').value = "${user.getUserTel()}";
	document.getElementById('userAddr').value = "${user.getUserAddr()}";
	
	//회원 정보 수정
 document.querySelector('modBtn').addEventListner('click', function(e){
	  e.preventDefault();
	  let run = true;
	  let modFrm=document.querySelector('#modFrm')

	  let name = document.getElementById('userName').value;
	  let id = document.getElementById('userId').value;
	  let passwd = document.getElementById('userPw').value;
	  let nickname = document.getElementById('nickname').value;
	  let tel = document.getElementById('userTel').value;
	  let addr = document.getElementById('userAddr').value;
	  
	  
	  
	  document.getElementById('nm').value=userName;
	  document.getElementById('id').value=userId;
	  document.getElementById('pw').value=userPw;
	  document.getElementById('nM').value=nickname;
	  document.getElementById('uT').value=userTel;
	  
	  if(run){
		  modFrm.submit();
	  }
	  
  });
</script>
</body>