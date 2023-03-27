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
	<sidebar> <%@ include
		file="/WEB-INF/layout/myPageSidebar.jsp"%> </sidebar>
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
								<td size="1px"></td>
							</tr>
							<tr>
								<td colspan='11'><hr></td>
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
						<th colspan='4'>예약완료</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${List }" var="list" varStatus="locaIndexes">
						<c:if test="${list.getResState() =='예약완료' }">
							<tr>
								<th>숙소이름</th>
								<th>숙소주소</th>
								<th>숙소연락처</th>
								<th>입실일자</th>
								<th>퇴실일자</th>
								<th>금액</th>
								<th>총 금액</th>
								<th>환불</th>
							<tr>
								<td><a href="locaDetail.do?locaId=${list.getRoomId() }">${list.getLocaName() }</a></td>
								<td>${list.getLocaAddr() }</td>
								<td>${list.getLocaTel() }</td>
								<td>${list.getResSdate() }</td>
								<td>${list.getResEdate() }</td>
								<td>${list.getLocaPrice() }</td>
								<td>${list.getResPrice() }</td>
								<c:if test='${list.getReq().equals("N") }'>
								<td><button class="reqBtn" value="${list.getResId() }">환불요청</button></td>
								</c:if>
								<c:if test='${list.getReq().equals("Y") }'>
								<td><button class="reBtn" value="${list.getResId() }">환불취소</button></td>
								</c:if>
							</tr>
							<tr>
								<td colspan='8'><hr></td>
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
						<th>총 금액</th>
						<th>결제</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="checkbox" onclick='getAllCheckBox(this)'
							id="aRC" name="aRC"></td>
						<td>합계 : <input type="text" value="0" id="totalPrice"
							readonly> 원</td>
						<td><button onclick='requestPay(this)' class="cBtn" id="charge">결제</button></td>
					</tr>
				</tbody>
			</table>

<button onclick="cancelPay()">환불하기</button>


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
	  let result=0;
	  selectedBoxes.forEach((res) => {
	    result += Number(res.value);
	  });
	  
	  console.log("result : "+result);
	  // 출력
	  document.getElementById('totalPrice').value = result;
	  document.querySelector('.cBtn').value = result;
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
		if(confirm('환불 요청을 진행하시겠습니까?')){
	    	document.querySelector('input[name="resId"]').value=resId;
	    	moFrm.action="reqReserv.do";
	    	
	    	moFrm.submit();
		}
	})
})

document.querySelectorAll('.reBtn').forEach(button => {
	let moFrm = document.querySelector('#modifyReFrm');
	button.addEventListener('click',() => {
		let resId = button.value;
		console.log(resId);
		if(confirm('환불 요청을 반려하시겠습니까?')){
	    	document.querySelector('input[name="resId"]').value=resId;
	    	moFrm.action="reReserv.do";
	    	
	    	moFrm.submit();
		}
	})
})
</script>
<script>
var IMP = window.IMP; // 생략 가능
IMP.init("imp42481643"); // 예: imp00000000a

function requestPay(cB) {
	var reses = document.querySelectorAll('input[name="resCheck"]:checked');
	var respr = 0;
	var resnm = "";
	var resId = "";
	var resepr = "";
	console.log(reses);
	reses.forEach((res,index) =>{
		respr += Number(res.value);
		
		resepr += res.value;
		if(index<reses.length-1){
		resepr += ","	
		}
		
		resId += res.getAttribute('data-resId');
		if(index<reses.length-1){
			resId += ","
		};
		
		resnm += res.getAttribute('data-locName');
		if(index<reses.length-1){
			resnm += ","
		};
	})
	console.log(respr);
	console.log(resnm);
	console.log(resId);
	console.log(resepr);
	
  IMP.request_pay({
    pg: "INIpayTest",
    pay_method: "card",
    merchant_uid: "ORD20180131-0000021",   // 주문번호
    name: (resnm),
    amount: respr,                         // 숫자 타입
    res_id: (resId),
  }, function (rsp) { // callback
    if (rsp.success) {
      // 결제 성공 시 로직
      alert("결제 성공");
      location.href="ChargeReserv.do?resId="+resId;
    } else {
      // 결제 실패 시 로직
      alert("결제 실패");
      alert(rsp.error_msg);
    }
  });
}
/* 
function (rsp) {
    console.log(rsp);
    if (rsp.success) {
      var msg = '결제가 완료되었습니다.';
      alert(msg);
      location.href = "결제 완료 후 이동할 페이지 url"
    } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
    }
  } */

/* 
 IMP.request_pay({
	   결제 요청 객체를 채워주세요. 
	  m_redirect_url: "{리디렉션 될 URL}"
	},  callback ); // 리디렉션 방식의 경우 callback은 실행되지 않습니다. */
</script>
	</body>
</div>
</html>