<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <div class="untree_co-section bg-light">
    <div class="container">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6">
          <h2 class="text-secondary heading-2">회원가입</h2>
          <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-5 bg-white p-5">
          <form class="contact-form">
            <div class="row">
              <div class="col-12">
                <div class="form-group">
                  <label for="name">이름</label>
                  <input type="text" class="form-control" id="name">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">
                  <label for="id">아이디</label>
                  <input type="text" class="form-control" id="id"><button>중복확인</button>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="pw">비밀번호</label>
              <input type="password" class="form-control" id="pw">
            </div>

            <div class="form-group">
              <label for="nickname">닉네임</label><button>중복확인</button>
              <input type="text" class="form-control" id="nickname">
            </div>
            
            <div class="form-group">
              <label for="sinnum">주민등록번호</label>
              <input type="tel" class="form-control" id="sinnum">
            </div>
            
			 <div class="form-group">
              <label for="tel">전화번호</label>
              <input type="tel" class="form-control" id="tel">
            </div>

            <div class="form-group">
              <label for="addr">주소</label>
              <input type="text" class="form-control" id="addr">
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
  
  <script>
  //등록버튼 클릭 이벤트
  document.getElementById('addBtn').addEventListner('click', function(){
	  
	  
	  let name = document.getElementById(name).value;
	  let id = document.getElementById(id).value;
	  let passwd = document.getElementById(pw).value;
	  let nickname = document.getElementById(nickname).value;
	  let sinNum= document.getElementById(sinnum).value;
	  let tel = document.getElementById(tel).value;
	  let addr = document.getElementById(addr).value;
	  
	  if (!)
  });
	  
  }
  </script>
