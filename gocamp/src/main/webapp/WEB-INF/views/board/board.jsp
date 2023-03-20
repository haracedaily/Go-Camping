<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

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
          <h2 class="text-secondary heading-2">NOTICE</h2>
        </div>
      </div>
    </div>
  </div>
  	
  	<table class="table">
  	<tr>
  		<td><input type="text" name="boid" readonly value="${notice.boId }"></td>
  		<td><input type="text" name="title" value="${notice.boTitle }"></td>
  	</tr>
  	<tr>
  		<td>작성자</td>
  		<td><input type="text" name="writer" value="${notice.nickname }"></td>
  		<td>작성일</td>
  		<td><input type="date" name="date" value="${notice.boDate }"></td>
  	</tr>
  	<tr>
  		<td><textarea cols="50" row="10" name="subject">${notice.boCont }</textarea></td>
  	</tr>
  	</table>
  	