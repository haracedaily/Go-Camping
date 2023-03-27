<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#messageMid{
margin: 0 auto;
}
</style>

<div>
<sidebar>
	<%@ include file="/WEB-INF/layout/managerSidebar.jsp"%>
</sidebar>
<body>
<section class="py-5" id="messageMid">
	<div class="row justify-content-center">
		<div>

			<table class="table">
				<thead>
				  <tr>
				    <!-- <th><input type="checkbox"></th><th>쪽지 번호</th> --><th>회원 아이디</th>
				    <th>보낸 쪽지</th><th>발신일</th><th>확인 여부</th><th>삭제</th>
				  </tr>
				</thead>
				
				<tbody >
				  <c:forEach items="${list }" var="message">
				  <tr>
				    <!-- <td><input type="checkbox"></td>  -->
				    <!--  m_num, user_id, m_title, m_date, m_check 
				    <td>${message.getMNum() }</td>-->
				    <td>${message.getUserId()}</td>
					<td><a href="getMessageManager.do?mNum=${message.getMNum() }">${message.getMTitle() }</a></td><td>${message.getMDate() }</td>
				    <td>${message.getMCheck() }</td>
				    <td><button id="delBtn" type="submit" >삭제</button></td>
				  </tr>
				  </c:forEach>
				</tbody>
    <tr>
      <td colspan="2" align="center">

        <button id="sendBtn" type="submit" class="btn btn-primary">쪽지 보내기</button>
        <!-- <button id="delBtn">삭제</button> -->

        </td>
    </tr>
  </table>
   <form id="mFrm" action="getMessageManager.do">
	<input type="hidden" id="mNum" name="mNum" value="${message.getMNum() }">
   </form>

		</div>
	</div>

</section>
</div>


<script>
//회원정보 수정삭제 했던 곳 참고해서 확인해보는 걸로
document.querySelector('#sendBtn').addEventListener('click', function() {
	
    let mFrm = document.querySelector('#mFrm');
    
    mFrm.action = 'messageSendForm.do';
    mFrm.submit();
});

//삭제
document.querySelectorAll('#delBtn').forEach(function(btn) {
    btn.addEventListener('click', function() {
        let tr = this.parentElement.parentElement;
        let mNum = tr.querySelector('td:first-child').innerText;
        
        // 서버로 삭제 요청 보내기
        fetch('messageRemoveAjax.do', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'mNum=' + mNum
        })
        .then(function(response) {
            if (response.ok) {
                // 삭제 완료 후, 행 삭제
                tr.remove();
            }
        });
    });
});

</script>
</body>
