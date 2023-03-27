<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
#cForm{
  margin: 0 auto;
}
#chkBtn{
  margin: 0 auto;
}

</style>
<div>

<body>
      <div class="row justify-content-center">
        <div class="col-lg-5 bg-white p-5">
          <form class="contact-form" action="userUpdateCheck.do" method="POST" >


            <div class="form-group">
              <label class="text-black" for="userPw">비밀번호</label>
              <input type="password" class="form-control" id="pwcheck" name="pwcheck">
            </div>

            

            <button id="chkBtn" type="submit" class="btn btn-primary">확인</button>

            <div class="form-group">
 
            </div>
          </form>
        </div> <!-- /.col-lg-7 -->
      </div> <!-- /.row -->



<!-- <form id="modFrm" action="userInfoMod.do" method="post"> 
<input type="hidden" id="pwcheck" name="pwcheck">-->
</form>



<script>
 
	if('${message}'){
		alert('${message}');
	}
</script>
</body>