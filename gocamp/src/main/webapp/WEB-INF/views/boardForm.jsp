<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="noticeAdd.do" method="post" enctype="multipart/form-data">

<style>
#bTable{
margin-left:20%;
}

#titleTable{
 width: 60vw;
 padding: 12px 20px;
 margin: 8px 0;
 box-sizing: border-box;left-padding:100px
}

#contTable{
 width: 60vw;
 height: 35vw;
 padding: 12px 20px;
 margin: 8px 0;
 box-sizing: border-box;
}

#boardselect{
 width: 20vw;
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
          <h2 class="text-secondary heading-2">글쓰기</h2>
        </div>
      </div>
    </div>
  </div>
	<table id="bTable">
			<td colspan=2 >
                <select id="boardselect">
                    <option>자유게시판</option>
                    <option>중고게시판</option>
                    <option>문의게시판</option>
                    <option>건의게시판</option>
                </select>
            </td>
		<tr>
			<td><input type="text" name="title" placeholder="제목을 입력해주세요" id="titleTable"></td>
		</tr>
		<tr>
			<td><textarea cols="30" rows="5" name="subject" placeholder="내용을 입력해주세요" id="contTable"></textarea></td>
		</tr>
		<tr>
			
			<td><input type="file" name="attach" id=imgfile></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="저장">
			</td>
		</tr>
	</table>
</form>