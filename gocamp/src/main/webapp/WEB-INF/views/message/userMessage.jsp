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
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
</sidebar>
<body>
	
<section class="py-5" id="messageMid">
	<div class="row justify-content-center">
		<div>

			<table class="table">
				<thead>
				  <tr>
				    <!-- <th><input type="checkbox" id="allChk" checked="checked"></th><th>쪽지 번호</th> --><th>받은 쪽지</th><th>수신일</th><th>삭제</th>
				  </tr>
				</thead>
				
				<tbody >
				  <c:forEach items="${list }" var="message">
				  <tr>
				    <!-- <td><input type="checkbox"></td> -->
				    <!--  m_num, m_title, m_date, m_check 
				    <td>${message.getMNum() }</td>-->
				    <td><a href="getMessage.do?mNum=${message.getMNum() }">${message.getMTitle() }</a></td>
				    <td>${message.getMDate() }</td>
				    <td><button id="delBtn" type="submit">삭제</button></td>
				  </tr>
				  </c:forEach>
				</tbody>
    <tr>
      <td colspan="2" align="center">

        <!-- <button id="delBtn">삭제</button> -->

        </td>
    </tr>
  </table>
  

		</div>
	</div>
</section>
</div>
<script>
//삭제
document.querySelectorAll('#delBtn').forEach(function(btn) {
    btn.addEventListener('click', function() {
        let tr = this.parentElement.parentElement;
        let mNum = tr.querySelector('td:first-child').innerText;
        
        // 서버로 삭제 요청 보내기
        fetch('messageRemove.do', {
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