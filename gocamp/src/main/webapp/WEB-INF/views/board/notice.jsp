<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
#cbar{

margin-left:20%;
margin-right:20%;

}

</style>

  <div class="untree_co-section">
    <div class="container">
      <div class="row justify-content-center text-center">
        <div class="col-lg-6">
          <h2 class="text-secondary heading-2">NOTICE</h2>
        </div>
      </div>
    </div>
  </div>
<nav class ="bar" id="cbar">
	<table class="table">
	<thead>
		<tr><th>글번호</th><th id= titlearea style = "width:550px; text-align:center;">제목</th><th>작성자</th><th>작성일</th><th>조회수</th></tr>
	</thead>
		
	<tbody>
		<c:forEach items="${list }" var="notices">
        <tr>
            <td>${notices.rownum }</td>
            <td id= titlearea style = "width:550px;">${notices.boTitle }</td>
            <td id= nicknamearea >${notices.nickname }</td>
            <td>${notices.boDate }</td>	
            <td>${notices.boCount }</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
</nav>



