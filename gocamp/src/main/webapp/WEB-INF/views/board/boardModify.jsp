<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#cbar {

		margin-left: 20%;
		margin-right: 20%;
	}
	#bTable{
	margin-left:20%;
	}

	#titleTable{
 	width: 60vw;
	 padding: 12px 20px;
	 margin: 8px 0;
	 box-sizing: border-box;
	}
	
	#contTable{
	 width: 60vw;
	 height: 35vw;
	 padding: 12px 20px;
	 margin: 8px 0;
	 box-sizing: border-box;
	}
	
	
	#imgfile{
	 width: 20vw;
	 padding: 12px;
	
	}
	#subBtn{
	  background-color: #bfd5f3;
	  border: none;
	  color: white;
	  padding: 10px 15px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 15px;
	  position: relative; 
	  margin-bottom: 30px;
	}
</style>

<div class="untree_co-section">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">${notice.usage} 수정</h2>
			</div>
		</div>
	</div>
</div>
<form method="post" action="boardModify.do" enctype="multipart/form-data">
<input type="hidden" name="usage" value="${usage }">
	<table id="bTable">
		<tr>
			<td>
			<input type="hidden" name="boId" value="${notice.boId }">
			<input type="hidden" name="userId" value="${notice.userId }">
			<input type="text" name="title" id="titleTable" value="${notice.boTitle }"></td>
		</tr>
		
		<tr>
			<td><img src="./upload/${notice.boImg }" alt="이미지"></td>
		</tr>
		<tr>
			<td><textarea cols="30" rows="5" name="subject" id="contTable">${notice.boCont }</textarea></td>
		</tr>
		<tr>	
			<td><input type="file" name="attach" id=imgfile placeholder='null'></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" id="subBtn">저장</button>
			</td>
		</tr>
	</table>
</form>

<script>
	document.querySelector('subBtn').addEventListener('click', function (e) {
	
	let title = document.querySelector('input[name="title"]').value;
	let subject = document.querySelector('textearea["subject"]').textContent;

	let isOK = true;
	if (title == '' || title == 'null') {
		isOK = false;
	}
	if (subject == '' || subject == 'null') {
		isOK = false;
	}
	if (!isOK) {
		alert("확인해주세요");
		return false;
	}

	console.log(this);

})
</script>