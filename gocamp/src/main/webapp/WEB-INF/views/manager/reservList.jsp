<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<style>
#positionMid {
	margin: 0 auto;
	width: 70%;
}

.table td {
	padding: 0 2px;
}

button {
	transition: color 0.4s ease;
	transition: background-color 0.4s ease;
	transition: border-radius 0.4s ease;
	color: #ffffff;
	background-color: #000000;
}

button:hover {
	color: #000000;
	background-color: #ffffff;
	border-radius: 32%;
}

input {
	border: none;
}
</style>
<div>
<sidebar>
	<%@ include file="/WEB-INF/layout/managerSidebar.jsp"%>
	</sidebar>
<body>
		<section class="py-5" id="positionMid">
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	
			<table class="table">
				<thead>
					<tr>
						<th colspan='5'>예약 목록</th>
						<th colspan='6'>결제 전</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${List }" var="list">
						<c:if test="${list.getResState() =='결제 전' }">
							<tr>
								<th>선택</th>
								<th>숙소이름</th>
								<th>숙소주소</th>
								<th>숙소연락처</th>
								<th>입실일자</th>
								<th>퇴실일자</th>
								<th>금액</th>
								<th>총 금액</th>
								<th>예약수정</th>
								<th>예약취소</th>
								<th></th>
							</tr>
							<tr>
								<td><input type="checkbox" name="resCheck"
									value="${list.getResPrice() }" data-resId="${list.getResId() }" data-locName="${list.getLocaName() }" onclick='getCheckbox()'></td>
								<td><a href="locaDetail.do?locaId=${list.locaId }">${list.getLocaName() }</a></td>
								<td>${list.getLocaAddr() }</td>
								<td>${list.getLocaTel() }</td>
								<td>${list.getResSdate() }</td>
								<td>${list.getResEdate() }</td>
								<td>${list.getLocaPrice() }</td>
								<td>${list.getResPrice() }</td>
								<td><button class="modBtn" value="${list.getResId() }">수정</button></td>
								<td><button class="delBtn" value="${list.getResId() }">예약취소</button></td>
							</tr>
							<tr>
								<td colspan='10'><hr></td>
							</tr>

						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
			<br>
			
			<table class="table">
				<thead>
					<tr>
						<th colspan='4'>예약 목록</th>
						<th colspan='5'>예약완료</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${List }" var="list" varStatus="locaIndexes">
						<c:if test="${list.getResState() =='예약완료' }">
							<tr>
								<th>선택</th>
								<th>숙소이름</th>
								<th>숙소주소</th>
								<th>숙소연락처</th>
								<th>입실일자</th>
								<th>퇴실일자</th>
								<th>금액</th>
								<th>총 금액</th>
								<th>환불승인</th>
							<tr>
							<td><input type="checkbox" name="resCheck"
									value="${list.getResPrice() }" data-resId="${list.getResId() }" data-locName="${list.getLocaName() }" onclick='getCheckbox()'></td>
								<td><a href="locaDetail.do?locaId=${list.getRoomId() }">${list.getLocaName() }</a></td>
								<td>${list.getLocaAddr() }</td>
								<td>${list.getLocaTel() }</td>
								<td>${list.getResSdate() }</td>
								<td>${list.getResEdate() }</td>
								<td>${list.getLocaPrice() }</td>
								<td>${list.getResPrice() }</td>
								<c:choose>
								<c:when test='${list.getReq().equals("Y") }'>
								<td><button class="reqBtn" value="${list.getResId() }">환불승인</button></td>
								</c:when>
								<c:otherwise>
								<td></td>
								</c:otherwise>
								</c:choose>
							</tr>
							<tr>
								<td colspan='9'><hr></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			
			<br>
			<table class="table">
				<thead>
					<tr>
						<th>전체</th>
						<th>환불처리</th>
						<th>예약취소</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" onclick='getAllCheckBox(this)'
							id="aRC" name="aRC"></td>
							<td><a class="btn" href="https://classic-admin.portone.io/payments">환불처리</a></td>
						<td><button onclick='requestPay(this)' class="cBtn" id="cancle">예약취소</button></td>
					</tr>
				</tbody>
			</table>



			
			<form action="getPerReserv.do" method="POST" id="modifyReFrm">
			<input type="hidden" name="resId">
			</form>
		</section>






		<script>
function getAllCheckBox(allCheck){
	const checkboxes=document.getElementsByName('resCheck');
	
	checkboxes.forEach((res)=>{
		res.checked = allCheck.checked
	})
	getCheckbox();
}

function getCheckbox()  {
	  const resCheckBox = 'input[name="resCheck"]';
	  const resCheckedBox = 'input[name="resCheck"]:checked';
	  const selectedRes = 
	      document.querySelectorAll(resCheckBox);
	  const selectedBoxes = document.querySelectorAll(resCheckedBox);
	  const aRC=document.getElementById('aRC');
	  let result="";
	  selectedBoxes.forEach((res,index) => {
	    result += res.getAttribute("data-resId");
	    if(index<selectedBoxes.length-1){
	    	result +=",";
	    }
	  });
	  console.log("result : "+result);
	  // 출력
	  document.querySelector('#cancle').value = result;
	  if(selectedRes.length == selectedBoxes.length){
		  aRC.checked=true;
	  }else{
		  aRC.checked=false;
	  }
	}

document.querySelectorAll('.modBtn').forEach(button => {
	let moFrm = document.querySelector('#modifyReFrm');
	moFrm.action="getPerReserv.do";
	  button.addEventListener('click', () => {
	    let resId = button.value;
	    console.log(resId);
	    document.querySelector('input[name="resId"]').value=resId;
	    
	    moFrm.submit();
	  });
	});
	
document.querySelectorAll('.delBtn').forEach(button => {
	let moFrm = document.querySelector('#modifyReFrm');
	
	button.addEventListener('click', () => {
	    let resId = button.value;
	    console.log(resId);
	    if (confirm('정말로 예약을 취소하시겠습니까?')) {
	    	document.querySelector('input[name="resId"]').value=resId;
	    	moFrm.action="delPerReserv.do";
	    	
	    	moFrm.submit();
	    }
	  });
	});
	
document.querySelectorAll('.reqBtn').forEach(button => {
	let moFrm = document.querySelector('#modifyReFrm');
	button.addEventListener('click',() => {
		let resId = button.value;
		console.log(resId);
		if(confirm('환불을 승인하시겠습니까?')){
	    	document.querySelector('input[name="resId"]').value=resId;
	    	moFrm.action="acceptReqReserv.do";
	    	
	    	moFrm.submit();
		}
	});
});

document.querySelector('#cancle').addEventListener('click',()=>{
	let moFrm = document.querySelector('#modifyReFrm');
	console.log(document.querySelector('#cancle').value);
	document.querySelector('input[name="resId"]').value=document.querySelector('#cancle').value;
	
	moFrm.action="allCancleReserv.do";
	
	moFrm.submit();
	
});

</script>


	</body>
</div>
</html>