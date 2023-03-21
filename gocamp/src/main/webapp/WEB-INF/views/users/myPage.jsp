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
			<form class="contact-form" action="userInfoMod.do" method="post" >
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
					<button>중복확인</button>
					<input type="text" class="form-control" id="nickname"
						name="nickname">
				</div>

				<div class="form-group">
					<label for="sinnum">주민등록번호</label> <input type="tel"
						class="form-control" id="sinNum" name="sinNum" readonly>
				</div>

				<div class="form-group">
					<label for="tel">전화번호</label> <input type="tel"
						class="form-control" id="userTel" name="userTel">
				</div>

            <div class="form-group">
              <label for="addr">주소</label>
              <input type="text" id="sample6_postcode" name="postcode" placeholder="우편번호">
              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
              <input type="text" id="sample6_address" name="address" placeholder="주소"><br>
              <input type="text" id="sample6_detailAddress" name="detailAddress" placeholder="상세주소">
              <input type="text" id="sample6_extraAddress" name="extraAddress" placeholder="참고항목">
            </div>

				<button id="modBtn" type="submit" class="btn btn-primary mb-4" id="mBtn">정보
					수정</button>

			</form>
		</div>
	</div>
</section>
</body>
</div>

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
	//myPage 클릭 시 회원 정보 노출
	document.getElementById('userName').value = "${user.getUserName()}";
	document.getElementById('userId').value = "${user.getUserId()}";
	document.getElementById('nickname').value = "${user.getNickname()}";
	document.getElementById('sinNum').value = "${user.getSinNum()}";
	document.getElementById('userTel').value = "${user.getUserTel()}";
	document.getElementById('userAddr').value = "${user.getUserAddr()}";
	
	//회원 정보 수정
 document.querySelector('form').addEventListner('submit', function(e){
	  e.preventDefault();
	  let name = document.getElementById(name).value;
	  let id = document.getElementById(id).value;
	  let passwd = document.getElementById(pw).value;
	  let nickname = document.getElementById(nickname).value;
	  let sinNum= document.getElementById(sinnum).value;
	  let tel = document.getElementById(tel).value;
	  let addr = document.getElementById(postcode).value + document.getElementById(address).value +
	  			 document.getElementById(detailAddress).value + document.getElementById(extraAddress).value;
	  let add = true;
	  if (name==' '||name==null||name=='null'){
		  alert("이름을 입력하세요.");
		  name.focus();
		  return add=false;
	  } 
	  if (id==''||id==null||id=='null'){
		  alert("ID를 확인하세요.");
		  return add=false;
	  }
	  if (pw==''||pw==null||pw=='null'){
		  alert("비밀번호를 확인하세요.");
		  return add=false;
	  }
	  if (nickname==''||nickname==null||nickname=='null'){
		  alert("닉네임을 확인하세요.");
		  return add=false;
	  }
	  if (sinNum==''||sinNum==null||sinNum=='null'){
		  alert("주민등록 번호를 확인하세요.");
		  return add=false;
	  }
	  if (tel==''){
		  alert("전화번호를 확인하세요.");
		  return add=false;
	  }
	  if (addr==''){
		  alert("주소를 확인하세요.");
		  return add=false;
	  }
	  if(!add){
		  alert("입력항목을 확인하십시오.");
	  }
	  if(add){
		  e.submit();
	  }
	  
  });
</script>
