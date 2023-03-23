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
<table class="table">
	  <thead>
	    <tr><th>Id</th><th>이름</th><th>닉네임</th><th>주소</th><th>전화번호</th><th>가입일</th><th>삭제</th></tr>
	  </thead>
		<tbody id="list">
		</tbody>
	</table>
</div>
<script>

	fetch('userListAjax.do') // json 포맷으로 데이터 정상 출력 확인용
		.then(function (resolve) {
			//console.log(resolve); // body : readablestream
			return resolve.json(); // json 포맷에 따라 javascript object 변경
		})
		.then(function (result) {
			console.log(result); // result : [{},{},{},{}....{}]
			for (let i = 0; i < result.length; i++) {
				let id = result[i].id;
				makeTr(result[i]);
			}
		})
		.catch(function (reject) {
			console.error(reject);
		})
	
	//tr 생성 함수
	function makeTr(user={}){
		//완료. tr>td+td+td+td+td+td>button
			let tr = document.createElement('tr');
			//td 만들기(아이디, 이름, 비밀번호, 메일, 권한)
			for (let prop in user){
				let td = document.createElement('td');
				td.innerText = member[prop];
				tr.append(td);
			}
</script>
</body>
</div>
</html>