	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
	<style>
		#bTable {
			margin-left: 20%;
		}
	
		#titleTable {
			width: 60vw;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
		}
	
		#contTable {
			width: 60vw;
			height: 35vw;
			padding: 12px 20px;
			margin: 8px 0;
			box-sizing: border-box;
		}
	
	
		#imgfile {
			width: 20vw;
			padding: 12px;
		}
	
		#btn {
			position: relative;
			left: 68%;
		}
	
		#subBtn {
			background-color: #bfd5f3;
			border: none;
			color: white;
			padding: 5px 10px;
			align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 15px;
			position: relative;
			margin-bottom: 15px;
		}
	
		#delBtn {
			background-color: #bfd5f3;
			border: none;
			color: white;
			padding: 5px 10px;
			align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 15px;
			position: relative;
			margin-bottom: 15px;
		}
	
		.none-input {
			border: none;
		}
	
		#noidcomm {
			width: 60vw;
			padding: 12px 20px;
			position: relative;
			left: 33%;
	
		}
	
		#comm {
			width: 55vw;
			padding: 12px 20px;
			position: relative;
			left: 34.4%;
	
		}
	
		#commmbtn {
			background-color: #bfd5f3;
			border: none;
			color: white;
			padding: 3px 6px;
			margin-bottom: 30px;
			align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			position: relative;
			left: 35%;
	
	
		}
	
		#delcommbtn {
			background-color: #bfd5f3;
			border: none;
			color: white;
			padding: 3px 6px;
			align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 12px;
			position: relative;
			left:50%;
		}
		#commlist{
		border-collapse: collapse;
	 	width: 60vw;
	 	position: relative;
		left: 20%;
	 	margin-bottom:20px;
		}
		#con{
		padding: 8px;
	  	text-align: left;
	 	border-bottom: 1px solid #ddd;
		}
		
	</style>
	
	
	<div class="untree_co-section">
		<div class="container">
			<div class="row justify-content-center text-center">
				<div class="col-lg-6">
					<h2 class="text-secondary heading-2">${usageName}게시판</h2>
				</div>
			</div>
		</div>
	</div>
	
	
		<input type="hidden" name="usage" value="${notice.usage}">
		<table id="bTable">
			<tr>
				<td>
					<input type="hidden" name="boId" readonly value="${notice.boId }">
					<input type="text" name="writer" id="nm" readonly value="${notice.nickname }">
					<input type="text" name="bodate" readonly value="${notice.boDate }">
					<input type="text" name="title" id="titleTable" readonly value="${notice.boTitle }">
				</td>
			</tr>
			<tr>
				<td>
					<img src="./upload/${notice.boImg }" alt="이미지">
				</td>
			</tr>
			<tr>
				<td><textarea cols="30" rows="5" name="subject" id="contTable" readonly>${notice.boCont }</textarea>
				</td>
			</tr>
			<c:if test="${user.getUserId() != null}">
			<c:if test="${notice.userId.equals(userId)}">	
			<tr>
				<td id="btn">
					<a href="/gocamp/boardModifyForm.do?boId=${notice.boId }"><button id="subBtn">수정</button></a>
					<a href="boardRemove.do?boId=${notice.boId }&usage=${notice.usage}"><button id="delBtn">삭제</button></a>
				</td>
			</tr>	
				</c:if>
			</c:if>
			</table>
			
			<table>
				<tr>
					<td>
						<c:if test="${user.getUserId() == null}">
							<p>
								<input type="text" placeholder="로그인 후 이용해주세요" readonly id="noidcomm">
							</p>
	
						</c:if>
						
						<c:choose>
						  <c:when test="${user != null && notice.usage == 'e' && userId == 'admin' }">
							<form method="post" action="commentAdd.do">
						
								<input type="hidden" value="${userId }" name="user_id" readonly>
								<input type="hidden" value="${notice.boId }" name="bo_id" readonly>
								<input type="text" name="c_content" placeholder="댓글을 입력해주세요" id=comm>
								<button type="submit" id="commmbtn">등록</button>
							</form>
						  </c:when>
						  <c:when test="${user != null && notice.usage != 'e' }">
							<form method="post" action="commentAdd.do">
						
								<input type="hidden" value="${userId }" name="user_id" readonly>
								<input type="hidden" value="${notice.boId }" name="bo_id" readonly>
								<input type="text" name="c_content" placeholder="댓글을 입력해주세요" id=comm>
								<button type="submit" id="commmbtn">등록</button>
							</form>
						  </c:when>
						</c:choose>
					</td>
				</tr>
			</table>
	
			<!-- 댓글 -->
			<table id="commlist">
				<tr>
					<th id = "con">댓글내용</th>
					<th id = "con">작성자</th>
					<th id = "con"></th>
				</tr>
				<c:forEach items="${List }" var="comm">
					<tr>
						<td id = "con">${comm.coContent }</td>
						<td id = "con">${comm.userId }</td>
					<c:if test="${userId == comm.userId}">
						<td id = "con"><button type="button" onclick="deleteComment(${comm.coNo })" id="delcommbtn">삭제</button></td>
					</c:if>
					</tr>				
				</c:forEach>
			</table>
			<!-- 댓글 -->
	
	
	<!-- 댓글 달기 -->
	
	
	<script>
		function deleteComment(co_no) {
			location.href = "commentRemove.do?boId=${notice.boId }&coNo=" + co_no;
		}
	</script>