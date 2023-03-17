<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="noticeAdd.do" method="post" enctype="multipart/form-data">

<style>
#cbar{

margin-left:20%;
margin-right:20%;
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
	<table class="table">
		<tr>
			<td>
                <select>
                    <option>자유게시판</option>
                    <option>중고게시판</option>
                    <option>문의게시판</option>
                    <option>건의게시판</option>
                </select>
            </td>
		<tr>
			<td>제목</td>
			<td><input type="text" name="title" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea cols="30" rows="5" name="subject" placeholder="내용을 입력해주세요"></textarea></td>
		</tr>
		<tr>
			<td>파일</td>
			<td><input type="file" name="attach"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="저장">
			</td>
		</tr>
	</table>
</form>