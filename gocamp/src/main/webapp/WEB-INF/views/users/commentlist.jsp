<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.position-mid {
   margin: 0 auto;
}

.delcommbtn {
      background-color: #bfd5f3;
      border: none;
      color: white;
      padding: 3px 6px;
      align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 12px;

   }
table{
 	border-collapse: collapse;
 	width: 60vw;
 }
 
th,td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}
   
</style>
<div>
   <sidebar> <%@ include
      file="/WEB-INF/layout/myPageSidebar.jsp"%> </sidebar>
   <body>
      <section class="position-mid">
         	<table>
            <thead>
               <tr>
                  <th>댓글</th>
                  <th>날짜</th>        
               </tr>
            </thead>

            <tbody>
               <c:forEach items="${list }" var="comment">
                  <tr>            
                     <td><a href="/gocamp/board.do?boId=${comment.boId }">${comment.getCoContent() }</a></td>
                     <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${comment.coDate }" /></td>  
                <td id = "con"><button type="button" class="delcommbtn" data-boId="${comment.getBoId() }" data-coNo="${comment.getCoNo() }">삭제</button></td>            
                  </tr>
               </c:forEach>   
            </tbody>

         </table>
      </section>
   </body>
</div>
<form action="commentRemove.do" id="commReFrm">
<input type="hidden" name="boId">
<input type="hidden" name="coNo">
</form>
<script>
document.querySelectorAll('.delcommbtn').forEach(button => {
   let coReFrm = document.querySelector('#commReFrm');
   button.addEventListener('click',() => {
      let boNo=button.getAttribute('data-boId');
      let coId=button.getAttribute('data-coNo');
      
      if(confirm('작성한 댓글을 삭제하시겠습니까?')){
          document.querySelector('input[name="boId"]').value=boNo;
          document.querySelector('input[name="coNo"]').value=coId;
          
          coReFrm.submit();
      }
   })
});
      </script>