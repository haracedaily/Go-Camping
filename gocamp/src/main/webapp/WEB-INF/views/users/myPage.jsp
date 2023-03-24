<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#cForm{
  margin: 0 auto;
}
#delBtn{
  display:inline-block;zoom:1;.display:inline;
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
								class="form-control" id="userName" name="userName" value="${user.getUserName()}" readonly>
						</div>
					</div>
					<div class="col-12">
						<div class="form-group">
							<label for="id">아이디</label> <input type="text"
								class="form-control" id="userId" name="userId" value="${user.getUserId()}" readonly>
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
						name="nickname" value="${user.getNickname()}">
				</div>


				<div class="form-group">
					<label for="tel">전화번호</label> <input type="tel"
						class="form-control" id="userTel" name="userTel" value="${user.getUserTel()}">
				</div>

            <div class="form-group">
              <label for="userAddr">주소</label>
              <input type="text" class="form-control" id="userAddr" name="userAddr" value="${user.getUserAddr()}">
            </div>
			</form>
				<button id="modBtn" type="submit" class="btn btn-primary">정보수정</button>
				<button id="delBtn" type="submit" class="btn btn-warning">회원 탈퇴</button>
		</div>
	</div>
</section>
</div>


<form id="modFrm" action="userInfoMod.do" method="post">
<input type="hidden" id="nm" name="userName">
 <input type="hidden" id="id" name="userId">
 <input type="hidden" id="pw" name="userPw">
 <input type="hidden" id="nN" name="nickname">
 <input type="hidden" id="uT" name="userTel">
 <input type="hidden" id="uA" name="userAddr">
</form>



<script>
 	//회원 탈퇴
 	document.querySelector('#delBtn').addEventListener("click", function() {
    let mFrm = document.querySelector('#modFrm');
	
    let mNum = document.getElementById('userId').value;
    document.getElementById('id').value=mNum;
    mFrm.action = "userDelete.do";
    mFrm.submit();
});
 	
 	
	//회원 정보 수정
 document.querySelector('#modBtn').addEventListener("click", function(e){
	  e.preventDefault();
	  let run = true;
	  let modFrm=document.querySelector('#modFrm');

	  let name = document.getElementById('userName').value;
	  let id = document.getElementById('userId').value;
	  let passwd = document.getElementById('userPw').value;
	  let nickname = document.getElementById('nickname').value;
	  let tel = document.getElementById('userTel').value;
	  let addr = document.getElementById('userAddr').value;
	  
	  
	  
	  document.getElementById('nm').value=name;
	  document.getElementById('id').value=id;
	  document.getElementById('pw').value=passwd;
	  document.getElementById('nN').value=nickname;
	  document.getElementById('uT').value=tel;
	  document.getElementById('uA').value=addr;
	  
	  if(run){
		  modFrm.submit();
	  }
	  
  });
	
 if('${message}'){
	 
	  alert('${message}');
 }else if('${dmessage}'){
	 alert('${dmessage}');
	 location.href = "main.do";
 }

</script>
</body>