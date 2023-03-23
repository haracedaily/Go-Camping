<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
<style>
.postion-mid{
float:left;
margin-left:30px;
}
</style>
<div>
<sidebar>
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
	</sidebar>
</head>
<body>
<div class="position-mid">
<table>
<thead class="table">
<tr>
<th>예약 목록</th><th colspan='3'>결제 전</th></tr>
</thead>
<tbody>
<c:forEach items="${List }" var="list">
<c:if test="${list.getResState() =='결제 전' }">
<tr>
<th>숙소 이름</th><td><a href="locaDetail.do?locaId=${list.locaId }">${list.getLocaName() }</a></td><th>숙소 주소</th><td>${list.getLocaAddr() }</td>
</tr>
<tr>
<th>숙소연락처</th><td colspan='3'>${list.getLocaTel() }</td>
</tr>

<tr>
<th>예약자이름</th><td>${list.getResName() }</td><th>예약자연락처</th><td>${list.getResTel() }</td></tr>
<tr><th>입실일자</th><td>${list.getResSdate() }</td><th>퇴실일자</th><td>${list.getResEdate() }</td></tr>
<tr><td colspan='4'><hr></td></tr>
</c:if>
</c:forEach>
</tbody>
</table>
<table>
<thead class="table">
<tr>
<th>예약 목록</th><th colspan='3'>예약완료</th></tr>
</thead>
<tbody>
<c:forEach items="${List }" var="list">
<c:if test="${list.getResState() =='예약완료' }">
<tr>
<th>숙소 이름</th><td><a href="locaDetail.do?locaId=${list.locaId }">${list.getLocaName() }</a></td><th>숙소 주소</th><td>${list.getLocaAddr() }</td>
</tr>
<tr>
<th>숙소연락처</th><td colspan='3'>${list.getLocaTel() }</td>
</tr>
<tr>
<th>예약자이름</th><td>${list.getResName() }</td><th>예약자연락처</th><td>${list.getResTel() }</td></tr>
<tr><th>입실일자</th><td>${list.getResSdate() }</td><th>퇴실일자</th><td>${list.getResEdate() }</td></tr>
<tr><td colspan='4'><hr></td></tr>
</c:if>
</c:forEach>
</tbody>
</table>
</div>
</body>
</div>
</html>