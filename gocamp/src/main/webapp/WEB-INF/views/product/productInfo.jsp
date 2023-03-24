<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<html>

<head>
	<title>상품 상세 정보</title>

	<style>
		body {
			font-family: Arial, Helvetica, sans-serif;
		}

		/* The Modal (background) */
		.modal {
			display: none;
			/* Hidden by default */
			position: fixed;
			/* Stay in place */
			z-index: 1;
			/* Sit on top */
			padding-top: 100px;
			/* Location of the box */
			left: 0;
			top: 0;
			width: 100%;
			/* Full width */
			height: 100%;
			/* Full height */
			overflow: auto;
			/* Enable scroll if needed */
			background-color: rgb(0, 0, 0);
			/* Fallback color */
			background-color: rgba(0, 0, 0, 0.4);
			/* Black w/ opacity */
		}

		/* Modal Content */
		.modal-content {
			position: relative;
			background-color: #fefefe;
			margin: auto;
			padding: 0;
			border: 1px solid #888;
			width: 80%;
			box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
			-webkit-animation-name: animatetop;
			-webkit-animation-duration: 0.4s;
			animation-name: animatetop;
			animation-duration: 0.4s
		}

		/* Add Animation */
		@-webkit-keyframes animatetop {
			from {
				top: -300px;
				opacity: 0
			}

			to {
				top: 0;
				opacity: 1
			}
		}

		@keyframes animatetop {
			from {
				top: -300px;
				opacity: 0
			}

			to {
				top: 0;
				opacity: 1
			}
		}

		/* The Close Button */
		.close {
			color: white;
			float: right;
			font-size: 28px;
			font-weight: bold;
		}

		.close:hover,
		.close:focus {
			color: #000;
			text-decoration: none;
			cursor: pointer;
		}

		.modal-header {
			padding: 2px 16px;
			background-color: #5cb85c;
			color: white;
		}

		.modal-body {
			padding: 2px 16px;
		}

		.modal-footer {
			padding: 2px 16px;
			background-color: #5cb85c;
			color: white;
		}
	</style>
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
				<img alt="여행 패키지 상품 이미지" src="img/${vo.prodImga}" style="width: 400px; height: 200px;">
			</div>
			<div class="col-md-6" id="detail">
				<h3>${vo.prodName }</h3>
				<p>${vo.prodDes }
					<p>
						<b>상품 코드</b>: ${vo.sku }>
					</p>
					<b>상품가격</b> : ${vo.prodPrice }원
					<p>
						<b>세일가격</b> : ${vo.prodSalePrice}원
					</p>
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
						<a href="#" class="btn btn-info"> 상품 주문</a> <a href="#" class="btn btn-secondary">장바구니 </a>
					</p>
				</p>
			</div>
		</div>
	</div>

	<div id="reply">

		<c:if test="${userId == null }">
			<p>
				소감을 남기시려면 <a href="loginForm.do">로그인</a>해주세요
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
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reply" items="${list }">
				<tr id="${reply.repNum }">
					<td>${reply.repNum }</td>
					<td>${reply.userId }</td>
					<td class="content">${reply.repCon}</td>
					<td>${reply.repDate }</td>
							<c:if test="${reply.userId == userId }">
					<td><button class="modBtn">수정</button></td>
					<td><button class="delBtn">삭제</button></td>
						</c:if>
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
<form id="myFrm" action="replyModify.do">
	<input type="hidden" name="code">
	<input type="hidden" name="repNum">
	<input type="hidden" name="comment">
</form>


<!-- The Modal -->
<div id="myModal" class="modal">

	<!-- Modal content -->
	<div class="modal-content">
		<div class="modal-header">
			<span class="close">&times;</span>
			<h2>Modal Header</h2>
		</div>
		<div class="modal-body">
			<p class="repNum"></p>
			
		<!--및부분 queryselector 가져오기  -->
			<p><input class="comment" type="text" value=""></p>
			<p><button id="save">저장</button>
		</div>
		<div class="modal-footer">
			<h3>Modal Footer</h3>
		</div>
	</div>

</div>



<script>
	// Get the modal
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on <span> (x), close the modal
	span.onclick = function () {
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function (event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	document.querySelectorAll('.modBtn').forEach(function (btn) {
		btn.addEventListener('click', function () {
			modal.style.display = "block";

			// 댓글번호. 내용.
			let modId = this.parentElement.parentElement.id;
			let comment = this.parentElement.parentElement.querySelector('.content').innerText;
			
			console.log(modId, comment)
			modal.querySelector('.repNum').innerText = modId;
			modal.querySelector('.comment').value = comment;
			
		})
	});
	
/* 			let myMdl = document.querySelector('#myModal');
			myMdl.querySelector('h2').innerText = "New Header";
			console.log() */
	//수정
	document.querySelector('#save').addEventListener('click', function (btn) { 			
		
		
		let typeCo=this.parentElement.previousElementSibling.children[0].value;
		let modId= this.parentElement.parentElement.children[0].innerText;
		let myFrm=document.querySelector('#myFrm');
		
		myFrm.code.value = '${vo.sku}';
		myFrm.repNum.value = modId;
		myFrm.comment.value=typeCo;
		myFrm.submit();
		//document.querySelector('.repNum').value = modId;
		//document.querySelector('.comment').value = typeCo;
		 
		//myFrm.submit();
		
		
		/* myFrm.repCom.value = typeCo; */

	});


	// 삭제.
	document.querySelectorAll('.delBtn').forEach(function (btn) {
			
		btn.addEventListener('click', function () {
			console.log(this.parentElement.parentElement.id);
			let delId = this.parentElement.parentElement.id;
			let myFrm = document.querySelector('#myFrm');
			myFrm.action = 'replyRemove.do'; //강제로 action 값을 바꾸기위한 목적이다.
			myFrm.code.value = '${vo.sku}'; //mrFrmcode안에 sku값을 넣어 주기 위한 목적이다
			myFrm.repNum.value = delId;
			
			myFrm.submit(); 
		})
	});
</script>