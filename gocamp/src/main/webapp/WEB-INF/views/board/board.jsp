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
			#btn{
				position: relative;
				left:68%;
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
			#noidcomm{
				width: 60vw;
				padding: 12px 20px;
				position: relative;
				left: 33%;
							
			}
			#comm{
				width: 60vw;
				padding: 12px 20px;
				position: relative;
				left: 31.5%;
						
			}
			#commmbtn{
				background-color: #bfd5f3;
				border: none;
				color: white;
				padding: 3px 6px;
				align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 12px;
				position: relative;
				left:28%;
				
				
			}
			#delcommbtn{
				background-color: #bfd5f3;
				border: none;
				color: white;
				padding: 3px 6px;
				align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 12px;
				position: relative;

			}
			
			#commlist{
			position: relative;
			bottom: 40%;
			
			}
		</style>


		<div class="untree_co-section">
			<div class="container">
				<div class="row justify-content-center text-center">
					<div class="col-lg-6">
						<h2 class="text-secondary heading-2">${notice.usage }게시판</h2>
					</div>
				</div>
			</div>
		</div>

		<div>
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
				<td id = "btn">
					<a href="/gocamp/boardModifyForm.do?boId=${notice.boId }"><button id="subBtn">수정</button></a>
					<a href="boardRemove.do?boId=${notice.boId }&usage=${notice.usage}"><button id="delBtn">삭제</button></a>
				</td>
				<table>
				<tr>
					<td>
						<c:if test="${userId == null}">							
							<p>
								<input type="text" placeholder="로그인 후 이용해주세요" readonly id="noidcomm">
							</p>
					
						</c:if>
							<form method="post" action="commentAdd.do">
								<c:if test="${userId != null}">
									<input type="hidden" value="${userId }" name="user_id" readonly>
									<input type="hidden" value="${notice.boId }" name="bo_id" readonly>
									<input type="text" name="c_content" id=comm>
									<button type="submit" id="commmbtn">등록</button>
								</c:if>
							</form>
					</td>
				</tr>
				
				<!-- 댓글 -->
				<c:forEach items="${List }" var="comm">
					<tr id="commlist">
						<td>
						내용: ${comm.coContent }						
						작성자: ${comm.userId }
						
					 	<c:if test="${userId == comm.userId}">
							<button type="button" onclick="deleteComment(${comm.coNo })" id="delcommbtn">댓글 삭제</button>
					  	</c:if>
					  </td>
					</tr>
				</c:forEach>
				<!-- 댓글 -->
			</table>
		</div>
		<!-- 댓글 달기 -->
		
		
		<script>
		
		  function deleteComment(co_no){
			  location.href = "commentRemove.do?boId=${notice.boId }&coNo="+co_no;
		  }
		</script>
	