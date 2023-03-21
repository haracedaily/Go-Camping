<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <form class="contact-form">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" id="userName" name="userName">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label for="id">아이디</label>
                  <input type="text" class="form-control" id="userId" name="userId">
                  <button>중복확인</button>
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
              <input type="tel" class="form-control" id="sinNum" name="sinNum">
            </div>
            
			 <div class="form-group">
              <label for="tel">전화번호</label>
              <input type="tel" class="form-control" id="userTel" name="userTel">
            </div>

            <div class="form-group">
              <label for="addr">주소</label>
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
              <p><small> 이미 회원가입 하셨다면 <a href="#">LOGIN</a></small></p>
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
 <input type="hidden" id="sN" name="sinNum">
 <input type="hidden" id="uT" name="userTel">
 <input type="hidden" id="uA" name=""><!-- 컨트롤에 get parameter 이름과 동일한 이름 -->
 </form> 
  <script>
  //등록버튼 클릭 이벤트
  document.getElementById('addBtn').addEventListner('click', function(e){
	  e.prventDefault();
	  let run=true;
	  let inFrm = document.querySelector('#insertFrm');
	  	  
	  let userName = document.getElementById('userName').value;
	  let userId = document.getElementById('userId').value;
	  let userPw = document.getElementById('userPw').value;
	  let nickname = document.getElementById('nickname').value;
	  let sinNum= document.getElementById('sinNum').value;
	  let userTel = document.getElementById('userTel').value;
	  let userAddr = document.getElementById('userAddr').value;
	  
	  if (!name){
		  alert("이름을 입력하세요.");
		  name.focus();
		  return run=false;
	  } 
	  if (!id){
		  alert("ID를 확인하세요.");
		  id.focus();
		  return run=false;
	  }
	  if (!pw){
		  alert("비밀번호를 확인하세요.");
		  pw.focus();
		  return run=false;
	  }
	  if (!nickname){
		  alert("닉네임을 확인하세요.");
		  nickname.focus();
		  return run=false;
	  }
	  if (!sinNum){
		  alert("주민등록 번호를 확인하세요.");
		  sinNum.focus();
		  return run=false;
	  }
	  if (!tel){
		  alert("전화번호를 확인하세요.");
		  tel.focus();
		  return run=false;
	  }
	  if (!addr){
		  alert("주소를 확인하세요.");
		  addr.focus();
		  return run=false;
	  }

	  document.getElementById('nm').value=userName;
	  document.getElementById('nm').value=userName;
	  document.getElementById('nm').value=userName;
	  document.getElementById('nm').value=userName;
	  document.getElementById('nm').value=userName;
	  document.getElementById('nm').value=userName;
	  //form 새로 만든 곳에 있는 아이디 넣고 밸류에 입력 받은 밸류 넣은 변수 넣기<
	  if(run){
		  e.submit();
	  }
	  
  });
	  
  }
  </script>
