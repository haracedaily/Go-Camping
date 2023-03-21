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
                   <button type="button" onclick="checkIdDuplicate()">중복확인</button>
                  <input type="text" class="form-control" id="id" name="userId">
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="pw">비밀번호</label>
              <input type="password" class="form-control" id="pw" name="userPw">
            </div>

            <div class="form-group">
              <label for="nickname">닉네임</label><button>중복확인</button>
              <input type="text" class="form-control" id="nickname" name="nickname">
            </div>
            
            <div class="form-group">
              <label for="sinnum">주민등록번호</label>
              <input type="tel" class="form-control" id="sinnum" name="sinNum">
            </div>
            
			 <div class="form-group">
              <label for="tel">전화번호</label>
              <input type="tel" class="form-control" id="tel" name="userTel">
            </div>

            <div class="form-group">
              <label for="addr">주소</label>
              <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
              <input type="text" id="sample6_address" name="address" placeholder="주소"><br>
              <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
              <input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
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
 <input type="hidden" id="sN" name="sinNum">
 <input type="hidden" id="uT" name="userTel">
 <input type="hidden" id="uA" name=""><!-- 컨트롤에 get parameter 이름과 동일한 이름 -->
 </form> 
  

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>


  <script>
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
  
  //등록버튼 클릭 이벤트
  document.querySelector('addBtn').addEventListner('click', function(e){
	  e.preventDefault();
	  let run=true;
	  let inFrm = document.querySelector('#insertFrm');
	  
	  let name = document.getElementById('userName').value;
	  let id = document.getElementById('userId').value;
	  let passwd = document.getElementById('userPw').value;
	  let nickname = document.getElementById('nickname').value;
	  let sinNum= document.getElementById('sinNum').value;
	  let tel = document.getElementById('userTel').value;
	  let addr = document.getElementById(postcode).value + document.getElementById(address).value +
	  			 document.getElementById(detailAddress).value + document.getElementById(extraAddress).value;
	  
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
	  document.getElementById('sN').value=sinNum;
	  document.getElementById('uT').value=userTel;
	  
	  if(run){
		  e.submit();
	  }
	  
  });
  </script>
