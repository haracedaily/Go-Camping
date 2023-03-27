<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />

<link href='./calendar/main.css' rel='stylesheet' />


<style>
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
position:relative;
left:10%;
top:20%;
width:40%;
height:80%;
	max-width: 60%;
	max-height:100%;
}
#calMo{
display:none;
background-color: rgb(255,255,255);
overflow:auto;
z-index:1;
left:0;
top:0;
position:absolute;
width:100%;
height:100%;
}
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}
.close{
position:absolute;
top:10%;
right:10%;
}
.modal-content {
position:absolute;
top:20%;
right:10%;
  background-color: #fefefe;
  border: 1px solid #888;
  width: 20%; /* Could be more or less, depending on screen size */
  padding: 15px;
}
#clBtn{
position:absolute;
right:10%;
bottom:20%;
}
.modal-content input{
margin-bottom:5px;
}
.modal-content button{
margin-bottom:5px;
}
</style>
</head>
<body>
<script src='calendar/main.js'></script>
<script src='calendar/ko.js'></script>
<script>
var startDate=null;
var endDate=null;

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	startDate = null;
	var resetButton = document.getElementById('reset');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		timeZone : 'local',
		selectable : true,
		initialView : 'dayGridMonth',
		locale : 'ko',
		headerToolbar : {
			left : 'prev',
			center : 'title',
			right : 'next'
		},
			selectAllow: function(selectInfo) {
				  var today = new Date();
				  var events = calendar.getEvents();
				  if(selectInfo.start==selectInfo.end){
					  return false;
				  }
				  for (var i = 0; i < events.length; i++) {
				    // Check if the event has the title '예약완료'
				    if (events[i].title === '예약완료') {
				      // Check if the selected date range overlaps with the event
				      if (selectInfo.start < events[i].end && selectInfo.end > events[i].start) {
				        return false;
				      }
				      if(selectInfo.start >= events[i].start &&
				              selectInfo.end <= events[i].end) {
				            return false;
				        }
				      if(selectInfo.start <events[i].start&&selectInfo.end>events[i].end){
				    	  return false;
				      }
				    }
				  }
				  return selectInfo.start > today;
				},
			select : function(info) {
				if (startDate == null) {
					alert('입실일 설정')
					startDate = info.startStr;
				} else {
					endDate = info.endStr;
					let test2 = endDate.substr(0,4);
					let test3 = endDate.substr(5,2);
					let test4 = endDate.substr(8,2)-1;//여기서 end 수정하기 gmt -9 시간
					let test5;
					if(test4<10){
					test5 = (test2+"-"+test3+"-0"+test4);
					}else if(test4>9){
					test5 = (test2+"-"+test3+"-"+test4);
					};
					alert('퇴실일 설정');
					// 여기서 startDate와 endDate를 처리할 수 있습니다.
					if (new Date(startDate) < new Date(endDate)) {
						calendar.addEvent({
							start : startDate,
							end : endDate,
							display : 'background',
							color : '#0044cc'
						})
						calendar.addEvent({
							title : '선택한 기간',
							start : startDate,
							end : endDate,
							backgroundColor : '#1288dc',
							borderColor : '#0044cc',
							textColor : '#000000'
						});
					document.getElementById('resSdate').value=startDate;
					document.getElementById('resEdate').value=test5;
					} else {
						alert('퇴실일은 입실일보다 빠를 수 없습니다.');
						startDate = null;
					}
				}
			}
		});
					startDate = null;
					endDate=null;
		fetch('getReservListAjax.do',{
			method:'post',
			headers:{'Content-type':'application/x-www-form-urlencoded'},
			body: 'roomId='+'${locaId}'
		})
		.then(function(resolve){
			return resolve.json(); 
		})
		.then(function(result){
			console.log(result);
			for (let i=0; i<result.length; i++){
				let event = result[i];
				let title = '예약완료';
				let start = event.resSdate;
				let end = event.resEdate;
				
				console.log(end)
					calendar.addEvent({
						start : start,
						end : end,
						display : 'background',
						color : '#ff0000'
					});
					calendar.addEvent({
					title : title,
					start : start,
					end : end,
					textColor : '#000000',
					backgroundColor : '#ff0000',
					borderColor : '#ff0000'
				});
			}
		})
		.catch(function (reject){
			console.error(reject);
		});
			calendar.render();
//reset 버튼에 대한 이벤트 핸들러 등록
resetButton.addEventListener('click',function(){
	var events = calendar.getEvents();
	 console.log(events);
	for(var i=0; i< events.length;i++){
		if(events[i].title==='선택한 기간'){
			events[i].remove();
		}
	}
	startDate=null;
	endDate=null;
	})
	});
</script>
<style>
#loca_menu{
list-style-type: none;
margin-right:60%;
}
#loca_menu li{
float:left;
padding:10px;
}
#loca_menu a:hover{
color:black;
}
#map{
margin-left:20%;
margin-top:30px;
float:left;
}
.loca-exp{
margin-top:30px;
margin-left:10px;
float:left;
}
#blank{
clear:both;
width:100vw;
}
.detail-exp{
margin-bottom:20px;
}
.list-none{
list-style-type: none;

}
.loca-sub-menu a:hover{
color:black;
}
.img-container{
width:400vw;
margin : 0;
transition : transform 0.5s;
}
.img-container *{
margin : 0;
}
.img-content{
width:100vw;
float:left;
}
.img-cotent img{
width:100%;
}
.img-boxer{
overflow:hidden;
}
button {
transition: color 0.4s ease;
transition: background-color 0.4s ease;
transition: border-radius 0.4s ease;
color:#000000;
background-color:#ffffff;
}
button:hover{
cursor:pointer;
border-radius:50%;
background-color:rgba(10,230,180,0.4);
color:#000000;
border:1px;
}
#resFrm{
width:272.3px;
position:absolute;
top:28%;
right:28%;
}
#resFrm.input{
width:170px;
}
#resFrm.label{
size : 94.5px;
}
</style>

 <ul class="js-clone-nav d-none d-lg-inline-block text-left float-right site-menu" id="loca_menu">
 <li><a href="all">전 체</a></li>
 <li><a href="경기">경기도</a></li>
 <li><a href="강원">강원도</a></li>
 <li><a href="충청">충청도</a></li>
 <li><a href="경상">경상도</a></li>
 </ul>
 
			

<form action="loca.do" method="POST" id='locaChoice'>
<input type="hidden" name="addrs" value="${addrs }">
<input type="hidden" name="choice" value="${choice }">
</form>
<script>
let myfrm=document.querySelector('#locaChoice');

document.querySelectorAll('#loca_menu a').forEach(atag=>{
	atag.addEventListener('click',function(e){
		e.preventDefault();
		myfrm.addrs.value=this.getAttribute('href');
		myfrm.submit();
	})
})

</script>

<div id="blank"/>


<div>
	<div id='calendar'><button id='reset'>선택 취소</button></div>

<form id="resFrm">
	<label style="margin-right:15px;" for='resNm'>예약자 이름</label><input type='text' id='resNm'>
	<label for='resTel'>예약자 연락처</label><input type='text' id='resTel'>
	<label style="margin-right:49px" for='resSdate'>입실일</label><input type='text' id='resSdate' readonly>
	<label style="margin-right:49px" for='resEdate'>퇴실일</label><input type='text' id='resEdate' readonly>
	<br>
	<button type='submit'>예약</button>
	<button type='reset'>취소</button>
</form>
</div>





<form action="reserv.do" method="POST" id="reservFrm">
<input type="hidden" name="locaId" id="reId">
<input type="hidden" name="usId" id="usId">
<input type="hidden" name="resNm" id="reNm">
<input type="hidden" name="resTel" id="reTe">
<input type="hidden" name="resSdate" id="reSd">
<input type="hidden" name="resEdate" id="reEd">
</form>


<script>
document.querySelector('#resFrm').addEventListener('submit',function(e){
e.preventDefault();
	let reFrm = document.querySelector('#reservFrm');
let run = true;
	
let nm = document.getElementById('resNm').value;
let tel = document.getElementById('resTel').value;
let sdate = document.getElementById('resSdate').value;
let edate = document.getElementById('resEdate').value;

if(!nm||!tel||!sdate||!edate){
	alert('입력해주세요')
	return run = false;
}
if(run){
document.getElementById('reId').value='${locaId}';
document.getElementById('usId').value='${userId}';
document.getElementById('reNm').value=nm;
document.getElementById('reTe').value=tel;
document.getElementById('reSd').value=sdate;
document.getElementById('reEd').value=edate;


if(confirm('예약자 이름 : '+nm+'\n\n연락처 : '+tel+'\n\n입실일자 : '+sdate+'\n퇴실일자 : '+edate+'\n\n 예약하시겠습니까?')){
	reFrm.submit();
}
}
})
</script>
</body>
</html>
