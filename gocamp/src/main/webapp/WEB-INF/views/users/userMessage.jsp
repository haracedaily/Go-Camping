<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>

<body>
	
<section class="py-5">
	<div class="row justify-content-center">
		<div>

			<table class="table">
				<thead>
				  <tr>
				    <th><input type="checkbox" id="allChk" checked="checked"></th><th>쪽지 번호</th><th>받은 쪽지</th><th>수신일</th>
				  </tr>
				</thead>
				
				<tbody >
				  <c:forEach items="${list }" var="message">
				  <tr>
				    <td><input type="checkbox"></td>
				    <!--  m_num, m_title, m_date, m_check -->
				    <td>${message.getMNum() }</td>
				    <td><a href="getMessage.do?mNum=${message.getMNum() }">${message.getMTitle() }</a></td>
				    <td>${message.getMDate() }</td>
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

<script>

</script>
</body>