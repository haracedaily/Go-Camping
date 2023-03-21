<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>
<head>
<title>상품 상세 정보</title>
</head>
<style>
.img {
	left: 50px;
	top: 50px;
}

#detail {
	left: 500px;
	top: 50px;
}

.replyForm {
	display: flex;
	justify-content: center;
	align-items: center;
}

section.replyForm {
	padding: 30px 0;
}

section.replyForm div.input_area {
	margin: 10px 0;
}

section.replyForm textarea {
	font-size: 16px;
	font-family: '맑은 고딕', verdana;
	padding: 10px;
	width: 500px;;
	height: 150px;
}

section.replyForm button {
	font-size: 20px;
	padding: 5px 10px;
	margin: 10px 0;
	background: #fff;
	border: 1px solid #ccc;
}

section.replyList {
	padding: 30px 0;
}

section.replyList ol {
	padding: 0;
	margin: 0;

	
}

section.replyList ol li {
	padding: 10px 0;
	border-bottom: 2px solid #eee;
	
}

section.replyList div.userInfo {
	
}

section.replyList div.userInfo .userName {
	font-size: 24px;
	font-weight: bold;
}

section.replyList div.userInfo .date {
	color: #999;
	display: inline-block;
	margin-left: 10px;
}

section.replyList div.replyContent {
	padding: 10px;
	margin: 20px 0;
}
</style>
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
					<a href="#" class="btn btn-info"> 상품 주문</a> <a href="./product.jsp"
						class="btn btn-secondary">장바구니 </a>
			</div>
		</div>
	</div>

	<div id="reply">

		<c:if test="${user == null }">
			<p>
				소감을 남기시려면 <a href="/gocamp/loginForm.do">로그인</a>해주세요
			</p>
		</c:if>

		<c:if test="${user != null}">
			<section class="replyForm">
				<form role="form" action="pcomInsert.do" method="post">
					<input type="hidden" name="sku" value="${vo.sku}"> <input
						type="hidden" name="user_id" value="${userId }">
					<div class="input_area">
						<textarea name="rep_con" id="repCon"></textarea>
					</div>

					<div class="input_area">
						<button type=submit id="reply_btn">댓글 달기</button>
					</div>

				</form>
			</section>
		</c:if>

		<section class="replyList">
			<ol>
				<li>댓글 목록</li>
			</ol>
		</section>
	</div>


	<section class="replyList">
		<ol>
			<c:forEach items="${list}" var="reply">

				<li>
					<div class="userInfo">
						<span class="userName">${reply.userId}</span> <span class="date"><fmt:formatDate
								value="${reply.repDate}" pattern="yyyy-MM-dd" /></span>
					</div>
					<div class="replyContent">${reply.repCon}</div>
				</li>
			</c:forEach>
		</ol>
	</section>
	</div>


</body>
</html>