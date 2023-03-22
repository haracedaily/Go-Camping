<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
     <c:if test="${message }!=null">
     alert("${message }");
     </c:if>
     
     
  <div class="untree_co-section bg-light">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <h2 class="text-secondary heading-2">회원가입</h2>
          <p>일상 속의 자유와 함께 하는 GO CAMPING입니다. 회원가입으로 더 많은 혜택을 누려보세요.</p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-5 bg-white p-5">
          <form class="contact-form" action="insertUser.do"method="post" id="userInsertForm">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" id="name" name="userName">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label for="id">아이디</label>
                  <!--   <button type="button" onclick="checkIdDuplicate()">중복확인</button>-->
                  <input type="text" class="form-control" id="id" name="userId">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="pw">비밀번호</label>
              <input type="password" class="form-control" id="pw" name="userPw">
            </div>

            <div class="form-group">
              <label for="nickname">닉네임</label>
              <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
            
            
			 <div class="form-group">
              <label for="tel">전화번호</label>
              <input type="tel" class="form-control" id="tel" name="userTel" placeholder="숫자만 입력">
            </div>

            <div class="form-group">
              <label for="userAddr">주소</label>
              <input type="text" class="form-control" id="userAddr" name="userAddr">
            </div>

            

<!-- 
            <div class="form-group">
              <p>
                <small>By proceeding, you agree to the <a href="#">Terms and Conditions</a></small>
              </p>
            </div>
 -->
            <button id="addBtn" type="submit" class="btn btn-primary mb-4">회원가입</button>

            <div class="form-group">
              <p><small> 이미 회원가입 하셨다면 <a href="loginForm.do">LOGIN</a></small></p>
            </div>
          </form>
        </div> <!-- /.col-lg-7 -->
      </div> <!-- /.row -->
    </div> <!-- /.container -->
  </div> <!-- /.untree_co-section bg-light -->
  
 <form id="insertFrm" action="insertUser.do" method="post">
 <input type="hidden" id="nm" name="userName">
 <input type="hidden" id="id" name="userId">
 <input type="hidden" id="pw" name="userPw">
 <input type="hidden" id="nN" name="nickname">
 <input type="hidden" id="uT" name="userTel">
 <input type="hidden" id="uA" name="userAddr"><!-- 컨트롤에 get parameter 이름과 동일한 이름 -->
 </form> 
  



  <script>
<!--  
  //아이디 중복 확인
  function checkIdDuplicate() {
    var userId = document.getElementById("id").value;
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
        if (xhr.status === 200) {
          var result = xhr.responseText;
          if (result === "exist") {
            alert("이미 사용 중인 아이디입니다.");
          } else {
            alert("사용 가능한 아이디입니다.");
          }
        } else {
          alert("서버 오류가 발생했습니다.");
        }
      }
    };
    xhr.open("POST", "checkIdDuplicate.do", true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.send("userId=" + userId);
  }
  -->
  //등록버튼 클릭 이벤트
  document.querySelector('addBtn').addEventListner('click', function(e){
	  e.preventDefault();
	  let run=true;
	  let inFrm = document.querySelector('#insertFrm');
	  
	  let name = document.getElementById('userName').value;
	  let id = document.getElementById('userId').value;
	  let passwd = document.getElementById('userPw').value;
	  let nickname = document.getElementById('nickname').value;
	  let tel = document.getElementById('userTel').value;
	  let addr = document.getElementById('userAddr').value;
	  
	  if (name==' '||name==null||name=='null'){
		  alert("이름을 입력하세요.");
		  name.focus();
		  return run=false;
	  } 
	  if (id==''||id==null||id=='null'){
		  alert("ID를 확인하세요.");
		  return run=false;
	  }
	  if (pw==''||pw==null||pw=='null'){
		  alert("비밀번호를 확인하세요.");
		  return run=false;
	  }
	  if (nickname==''||nickname==null||nickname=='null'){
		  alert("닉네임을 확인하세요.");
		  return run=false;
	  }
	  if (sinNum==''||sinNum==null||sinNum=='null'){
		  alert("주민등록 번호를 확인하세요.");
		  return run=false;
	  }
	  if (tel==''){
		  alert("전화번호를 확인하세요.");
		  return run=false;
	  }
	  if (addr==''){
		  alert("주소를 확인하세요.");
		  return run=false;
	  }
	  if(!run){
		  alert("입력항목을 확인하십시오.");
	  }
	  
	  document.getElementById('nm').value=userName;
	  document.getElementById('id').value=userId;
	  document.getElementById('pw').value=userPw;
	  document.getElementById('nM').value=nickname;
	  document.getElementById('uT').value=userTel;
	  
	  if(run){
		  e.submit();
	  }
	  
  });
  </script>
