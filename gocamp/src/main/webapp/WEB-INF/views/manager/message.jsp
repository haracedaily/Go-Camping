<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div>
	<sidebar>
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
	</sidebar>
	<body>
<section class="py-5">
	<div class="row justify-content-center">
		<div>
			<table class="table">
    <tr>
      <td>쪽지번호</td>
      <td><input type="text" name="mNum" readonly value="${message.mNum }"></td>
    </tr>
    <tr>
      <td>제목</td>
      <td colspan=2><input type="text" name="title" value="${notice.noticeTitle }"></td>
    </tr>
       <tr>
      <td>보낸 날짜</td>
      <td colspan=2><input type="text" name="writer" readonly value="${notice.noticeWriter }"></td>
    </tr>
    <tr>
      <td>받은 날짜</td>
      <td colspan=2><textarea cols="30" rows="5" name="subject">${notice.noticeSubject}</textarea></td>
    </tr>
    <tr>
      <td>확인 여부</td>
      <td colspan=2><textarea cols="30" rows="5" name="subject">${notice.noticeSubject}</textarea></td>
    </tr>
    <tr>
      <td colspan="2" align="center">

        <button id = "modBtn">수정</button>
        <button id="delBtn">삭제</button>

        </td>
    </tr>
  </table>
  <form id="myFrm" action="noticeModify.do">
  </form>

				<button id="modBtn" type="submit" class="btn btn-primary mb-4">정보
					수정</button>

		</div>
	</div>
</section>
</body>
</div>
