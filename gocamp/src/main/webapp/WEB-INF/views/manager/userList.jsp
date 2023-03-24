<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.postion-mid{
margin:0 auto;
}
</style>
<div>
<sidebar>
	<%@ include file="/WEB-INF/layout/managerSidebar.jsp"%>
	</sidebar>
<body>
<section id="postionMid">
<table class="table">
	  <thead>
	    <tr><th>아이디</th><th>이름</th><th>닉네임</th><th>주소</th><th>전화번호</th><th>가입일</th><th>삭제</th></tr>
	  </thead>
		<tbody>
		<c:forEach items="${mangeUserList }" var="user">
				  <tr>
				    <td>${user.getUserId() }</td>
				    <td>${user.getUserName()}</td>
					<td>${user.getNickname()}</td>
					<td>${user.getUserAddr() }</td>
				    <td>${user.getUserTel() }</td>
				    <td>${user.getJoinDate() }</td>
				    <td><button id="delBtn" type="submit">삭제</button></td>
				  </tr>
				  </c:forEach>
		</tbody>
	</table>


</section>
</div>
<script>	
	
	//삭제 버튼
	let delBtn = document.querySelectorAll('#delBtn')
	console.log(delBtn);
	delBtn.innserText = '삭제';
	delBtn.addEventListner('click', function(){
		console.log(this); // 이벤트 대상 알아보기
		console.log(this.parentElement.parentElement.children[0].innerText);
		let delId = this.parentElement.parentElement.children[0].innerText;
		//ajax 호출
		fetch('userRemoveAjax.do',{
			method:'post',
			headers:{'Content-Type':'application/x-www-form-urlencoded'}, //key=val&key*val
			body:'userId='+delId
		})
			.then(resolve => resolve.json()) // resolve => {"retCode":Success}
			.then(result => {
				console.log(result);
				if (result.retCode == 'Success'){
					alert('삭제 성공');
					this.parentElement.parentElement.remove();
				}else if (result.retCode == 'Fail'){
					alert('삭제 실패');
				}
	})
		.catch(reject => console.log(reject));
		
		});

	
</script>
</body>
</html>