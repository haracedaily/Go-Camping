<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
#positionMid{
  margin: 0 auto;
  width:70%;
}
.table td{
padding: 0 2px;
}
button{
transition:color 0.4s ease;
transition:background-color 0.4s ease;
transition:border-radius 0.4s ease;
color: #ffffff;
background-color:#000000;
}
button:hover{
color:#000000;
background-color : #ffffff;
border-radius:32%;
}
</style>
<div>
	<sidebar>
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
	</sidebar>
<body>
<section class="py-5" id="positionMid">
<table class="table">
<thead>
<tr>
<th colspan='3'>예약 목록</th><th colspan='4'>결제 전</th></tr>
</thead>
<tbody>
<c:forEach items="${List }" var="list" varStatus="locaIndexes">
<c:if test="${list.getResState() =='결제 전' }">
<tr><th>숙소이름</th><th>숙소주소</th><th>숙소연락처</th><th>입실일자</th><th>퇴실일자</th><th>예약수정</th><th>예약취소</th>
<tr><td><a href="locaDetail.do?locaId=${list.locaId }">${list.getLocaName() }</a></td><td>${list.getLocaAddr() }</td><td>${list.getLocaTel() }</td><td>${list.getResSdate() }</td><td>${list.getResEdate() }</td><td><button onclick="modify">수정</button></td><td><button>예약취소</button></td></tr>
<tr><td colspan='7'><hr></td></tr>
</c:if>
</c:forEach>
</tbody>
</table>
<table class="table">
<thead>
<tr>
<th colspan='3'>예약 목록</th><th colspan='4'>예약완료</th></tr>
</thead>
<tbody>
<c:forEach items="${List }" var="list">
<c:if test="${list.getResState() =='예약완료' }">
<tr><th>숙소이름</th><th>숙소주소</th><th>숙소연락처</th><th>입실일자</th><th>퇴실일자</th><th>예약수정</th><th>예약취소</th>
<tr><td><a href="locaDetail.do?locaId=${list.locaId }">${list.getLocaName() }</a></td><td>${list.getLocaAddr() }</td><td>${list.getLocaTel() }</td><td>${list.getResSdate() }</td><td>${list.getResEdate() }</td><td><button>수정</button></td><td><button>예약취소</button></td></tr>
<tr><td colspan='7'><hr></td></tr>
</c:if>
</c:forEach>
</tbody>
</table>

<div class="modal">

</div>

</section>

<script>

</script>

</body>
</div>
</html>