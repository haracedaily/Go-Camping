<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8' />
<link href='./calendar/main.css' rel='stylesheet' />
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
					//endDate.setTime(info.end.getTime()-(540*60*1000));
					endDate=info.endStr;
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
							backgroundColor : '#0044cc',
							borderColor : '#0044cc',
							textColor : '#000000'
						});
					document.getElementById('resSdate').value=startDate;
					document.getElementById('resEdate').value=endDate;
					} else {
						alert('퇴실일은 입실일보다 빠를 수 없습니다.');
						startDate = null;
					}
				}
			}
		});
					startDate = null;
					endDate=null;
		fetch('getReservListAjax.do')
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
html, body {
	margin: 0;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

#calendar {
position:absolute;
left:10%;
top:20%;
width:40%;
height:80%;
	max-width: 60%;
	max-height:100%;
	margin-right:10px;
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
position:relative;
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
<div class='modal' id='calMo'>
 <span onclick="document.getElementById('calMo').style.display='none'" class="close" title="Close Modal">&times;</span>
	<div id='calendar'><button id='reset'>선택 취소</button></div>
<form class="modal-content animate" action="reserv.do" method="post" id="resFrm">
	<label for='resNm'>예약자 이름</label><input type='text' id='resNm'>
	<label for='resTel'>예약자 연락처</label><input type='text' id='resTel'>
	<label for='resPer'>방문인원</label><input type='text' id='resPer'>
	<label for='resSdate'>입실일</label><input type='text' id='resSdate' readonly>
	<label for='resEdate'>퇴실일</label><input type='text' id='resEdate' readonly>
	<button type='submit'>예약</button>
	<button type='reset'>취소</button>
</form>
	<button onclick="document.getElementById('calMo').style.display='none'" id='clBtn'>창닫기</button>
</div>
<button onclick="document.getElementById('calMo').style.display='block'" style="width:auto;">예약하기</button>
<script>
document.querySelector('#resFrm').addEventListener('submit',function(e){
e.preventDefault();
let nm = document.getElementById('resNm').value;
let tel = document.getElementById('resTel').value;
let per = document.getElementById('resPer').value;
let sdate = document.getElementById('resSdate').value;
let edate = document.getElementById('resEdate').value;
if(confirm('예약자 이름 : '+nm+'\n\n연락처 : '+tel+'\n\n인원 : '+per+'\n\n입실일자 : '+sdate+'\n퇴실일자 : '+edate+'\n\n 예약하시겠습니까?')){
	this.submit();
}

})

</script>
</body>
</html>
