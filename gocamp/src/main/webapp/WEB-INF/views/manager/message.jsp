<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>

	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>


<section class="py-5">
	<div class="row justify-content-center">
		<div>

			<table class="table">
				<thead>
				  <tr>
				    <th><input type="checkbox"></th><th>쪽지 번호</th><th>회원 아이디</th>
				    <th>보낸 쪽지</th><th>발신일</th><th>확인 여부</th>
				  </tr>
				</thead>
				
				<tbody >
				  <c:forEach items="${list }" var="message">
				  <tr>
				    <td><input type="checkbox"></td>
				    <!--  m_num, user_id, m_title, m_date, m_check -->
				    <td>${message.getMNum() }</td>
				    <td>${message.getUId()}</td>
					<td><a href="getMessage.do?mNum=${message.getMNum() }">${message.getMTitle() }</a></td>					    <td>${message.getMDate() }</td>
				    <td>${message.getMCheck() }</td>
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



<script>
document.querySelector('#sendBtn').addEventListener('click', function() {
	
    let mFrm = document.querySelector('#mFrm');
    
    mFrm.action = 'messageSend.do';
    mFrm.submit();
});
</script>
</div>

