<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>

</head>
<body>
 <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
            <div class="col-md-12 col-lg-10 col-xl-8">
                <table class="table">
                    <tbody>
                        <tr>
                            <td>쪽지 제목</td>
                            <td><input type="text" id="mTitle" name="mTitle" value="${message.getMTitle() }" readonly></td>
                        </tr>
                        <tr>
                            <td>수신일</td>
                            <td><input type="text" id="mDate" name="mDate" value="${message.getMDate() }" readonly></td>
                        </tr>
                        <tr>
                            <td>쪽지 내용</td>
                            <td><textarea cols="30" rows="5" id="mContent" name="mContent" readonly >${message.getMContent() }</textarea></td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <button id="cloBtn" type="submit" class="btn btn-primary">닫기</button>
                                <button id="delBtn" type="submit" class="btn btn-warning">삭제</button>

                        </tr>
                    </tbody>
                </table>
                <form id="mFrm" action="getMessage.do">
                 <input type="hidden" id="mNum" name="mNum" value="${message.getMNum() }">
                </form>
            </div>
        </div>
    </div>
    
<script>
document.querySelector('#delBtn').addEventListener('click', function() {
	
    let mNum = document.querySelector('#mNum').value;
    let mFrm = document.querySelector('#mFrm');
    
    mFrm.action = 'messageRemove.do';
    mFrm.submit();
});
</script>
</body>
