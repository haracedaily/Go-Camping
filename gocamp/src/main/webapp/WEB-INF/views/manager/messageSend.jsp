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
                <form id="mFrm" action="getMessage.do">
                 <input type="hidden" id="mNum" name="mNum" >
                 <input type="hidden" id="mDate" name="mDate" >

                </form>
            </div>
        </div>
    </div>
    
<script>
document.querySelector('#delBtn').addEventListener('click', function() {
	
    let mTitle = document.querySelector('#mTitle').value;
    let userId = document.querySelector('#userId').value;
    let mContent = document.querySelector('#mContent').value;
	let mNum = document.querySelector('#mNum').value;
    let mFrm = document.querySelector('#mFrm');
    
    mFrm.action = 'messageSendForm.do';
    mFrm.submit();
});
</script>
</body>
