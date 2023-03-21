<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
</style>

<div class="untree_co-section">
	<div class="container">
		<div class="row justify-content-center text-center">
			<div class="col-lg-6">
				<h2 class="text-secondary heading-2">${usageName} 글쓰기</h2>
			</div>
		</div>
	</div>
</div>
<form method="post" action="boardAdd.do" enctype="multipart/form-data">
<input type="hidden" name="usage" value="${usage }">
	<table id="bTable">
		<tr>
			<td>
			<input type="hidden" name="boId" value="${notice.getboId() }">
			<input type="hidden" name="userId" value="${user.getUserId() }">
			<input type="text" name="title" placeholder="제목을 입력해주세요" id="titleTable"></td>
		</tr>
		<tr>
			<td><textarea cols="30" rows="5" name="subject" placeholder="내용을 입력해주세요" id="contTable"></textarea></td>
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