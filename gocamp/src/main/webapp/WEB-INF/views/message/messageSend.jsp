<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>

</style>
</head>
<body>
 <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>쪽지 제목</td>
                            <td><input type="text" id="mTitle" name="mTitle" ></td>
                        </tr>
						<tr>
                            <td>받는 사람</td>
                            <td><input type="text" id="userId" name="userId" ></td>
                        </tr>
                        <tr>
                            <td>쪽지 내용</td>
                            <td><textarea cols="30" rows="5" id="mContent" name="mContent"  ></textarea></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <button id="cloBtn" type="submit" class="btn btn-primary">뒤로가기</button>
                                <button id="sendBtn" type="submit" class="btn btn-warning">보내기</button>

                        </tr>
                    </tbody>
                </table>
                <form id="mFrm" action="messageSend.do">
                 <input type="hidden" id="mT" name="mTitle">
                 <input type="hidden" id="mC" name="mContent" >
				 <input type="hidden" id="uId" name="userId">
                </form>
            </div>
        </div>
    </div>
    
<script>
document.querySelector('#sendBtn').addEventListener('click', function() {
	let mFrm = document.querySelector('#mFrm');
	
    let mTitle = document.querySelector('#mTitle').value;
    let usId = document.querySelector('#userId').value;
    let mContent = document.querySelector('#mContent').value;
    
    document.getElementById('uId').value=usId;
    document.getElementById('mT').value=mTitle;
    document.getElementById('mC').value=mContent;
    
    mFrm.submit();
});

if("${message}"){
	alert("${message}");
}
</script>
</body>
