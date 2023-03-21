<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>

<div class="untree_co-section">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">${usageName}게시판</h2>
			</div>
		</div>
	</div>
</div>

<form method="post" action="noticeformadd.do" enctype="multipart/form-data">
<input type="hidden" name="usage" value="a">
	<table id="bTable">
		<tr>
			<td>
				<input type="hidden" name="boId"  readonly value="${notice.boId }">
				<input type="text" name="writer" id="nm" readonly value="${notice.nickname }">
				<input type="text" name="bodate" readonly value="${notice.boDate }">
				<input type="text" name="title" readonly id="titleTable" value="${notice.boTitle }"></td>
		</tr>
		<tr>
			<td><textarea cols="30" rows="5" name="subject" readonly id="contTable">${notice.boCont }</textarea></td>
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
	document.querySelector('button').addEventListener('click', function (e) {

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

  	