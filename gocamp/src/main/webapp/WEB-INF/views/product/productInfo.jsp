<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<html>
<head>
<title>상품 상세 정보</title>
</head>


<body>

	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="img">
				<img alt="여행 패키지 상품 이미지" src="img/${vo.prodImga}"
					style="width: 400px; height: 200px;">
			</div>
			<div class="col-md-6" id="detail">
				<h3>${vo.prodName }</h3>
				<p>${vo.prodDes }
				<p>
					<b>상품 코드</b>: ${vo.sku }>
				<p>
					<b>상품가격</b> : ${vo.prodPrice }원
				<p>
					<b>세일가격</b> : ${vo.prodSalePrice}원
				<p>
					<b>선택수량</b> : <input type="text" value="${vo.prodQuantity }">
					<c:choose>
						<c:when test="${vo.prodSalePrice == 0}">
							<h4>${vo.prodPrice }원</h4>
						</c:when>
						<c:otherwise>
							<h4>${vo.prodSalePrice}원</h4>
						</c:otherwise>
					</c:choose>
				<p>
					<a href="#" class="btn btn-info"> 상품 주문</a> <a href="#"
						class="btn btn-secondary">장바구니 </a>
			</div>
		</div>
	</div>

	<div id="reply">

		<c:if test="${userId == null }">
			<p>
				소감을 남기시려면 <a href="/member/signin">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${userId != null}">
			<section class="replyForm">
				<form role="form" method="post" autocomplete="off" action="replyadd.do">
				<input type="hidden" name="sku" value="${vo.sku}">
		<input type="hidden" name="userId" value="${userId}">
					<div class="input_area">
						<textarea name="repCon" id="repCon"></textarea>
					</div>

					<div class="input_area">
						<button type="submit" id="reply_btn">소감 남기기</button>
					</div>

				</form>
			</section>
		</c:if>

	</div>



	<table class="table">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>댓글내용</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reply" items="${list }">
				<tr>
					<td>${reply.repNum }</td>
					<td>${reply.userId }</td>
					<td>${reply.repCon}</td>
					<td>${reply.repDate }</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="center">
		<div class="pagination">
			<c:if test="${page.prev }">
				<a href="productInfo.do?page=${page.startPage - 1 }&code=${vo.sku}">
					&laquo; </a>
			</c:if>
			<c:forEach begin="${page.startPage }" end="${page.endPage }" var="i">
				<c:choose>
					<c:when test="${i == page.page }">
						<a class="active" href="productInfo.do?page=${i }&code=${vo.sku}">
							${i } </a>
					</c:when>
					<c:otherwise>
						<a href="productInfo.do?page=${i }&code=${vo.sku}"> ${i } </a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${page.next }">
				<a href="productInfo.do?page=${page.endPage + 1 }&code=${vo.sku}">
					&raquo; </a>
			</c:if>
		</div>
	</div>




</body>
</html>

