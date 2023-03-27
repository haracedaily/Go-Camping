<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<style>
  #cbar {
    margin-left: 20%;
    margin-right: 20%;
  }
  #wbtn {
    background-color: #bfd5f3;
    border: none;
    color: white;
    padding: 5px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 13px;
    position: relative;
    left: 75%;
    margin-bottom: 10px;
  }
  .pagination {
    display: inline-block;
    position: relative;
    left: 50%;
    margin-bottom: 10px;
  }
  .pagination a {
    color: black;
    float: center;
    padding: 5px 10px;
    text-decoration: none;
    transition: background-color .3s;
    border: 1px solid #ddd;
    margin: 0 4px;
  }
  .pagination a.active {
    background-color: #bfd5f3;
    color: white;
    border: 1px solid #bfd5f3;
  }
  .pagination a:hover:not(.active) {
    background-color: #ddd;
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
<c:choose>
<c:when test='${usageName.equals("Event") }'>
<c:if test = '${userId.equals("admin") }'>
<button id="wbtn"><a href="/gocamp/boardform.do?usage=${usage }" >글쓰기</a></button>
</c:if>
</c:when>
<c:otherwise>
<c:if test="${userId !=null }">
<button id="wbtn"><a href="/gocamp/boardform.do?usage=${usage }" >글쓰기</a></button>
</c:if>
</c:otherwise>
</c:choose>
<nav class="bar" id="cbar">
  <table class="table">
    <thead>
      <tr>
        <th>글번호</th>
        <th id=titlearea style="width:550px; text-align:center;">제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>

    <tbody>
      <c:forEach items="${boardlist }" var="notice">
        <tr>
          <td>${notice.rn }</td>
          <td id=titlearea style="width:550px;"><a href="/gocamp/board.do?boId=${notice.boId }">${notice.boTitle } </a></td>
          <td id=nicknamearea>${notice.nickname }</td>
          <td>${notice.boDate }</td>
          <td>${notice.boCount }</td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</nav>

<div class="center">
  <div class="pagination">
    <c:if test="${page.prev }">
      <a href="/gocamp/boardList.do?page=${page.startPage - 1 }&usage=${usage }"> &laquo; </a>
    </c:if>

    <c:forEach begin="${page.startPage }" end="${page.endPage }" var="i">
      <c:choose>
        <c:when test="${i == page.page }">
          <a class="active" href="/gocamp/boardList.do?page=${i }&usage=${usage }">${i }</a>
        </c:when>
        <c:otherwise>
          <a href="/gocamp/boardList.do?page=${i }&usage=${usage }">${i }</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${page.next }">
      <a href="/gocamp/boardList.do?page=${page.endPage + 1 }&usage=${usage }"> &raquo; </a>
    </c:if>
  </div>
</div>