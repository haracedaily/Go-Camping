<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src='calendar/main.js'></script>
<script src='calendar/ko.js'></script>
<link href='./calendar/main.css' rel='stylesheet' />
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
				    if (events[i].title === '예약완료') {
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
					let test4 = endDate.substr(8,2)-1;
					let test5;
					if(test4<10){
					test5 = (test2+"-"+test3+"-0"+test4);
					}else if(test4>9){
					test5 = (test2+"-"+test3+"-"+test4);
					};
					alert('퇴실일 설정');
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
		fetch('getPerReservListAjax.do',{
			method:'post',
			headers:{'Content-type':'application/x-www-form-urlencoded'},
			body: 'roomId='+'${roomId}'+'&resId='+'${resId}'
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
#positionMid{
  margin: 0 auto;
}
#calendar {
position:absolute;
left:20%;
top:15%;
width:20%;
height:40%;
	max-width: 60%;
	max-height:100%;
}
</style>
<div>
	<sidebar>
	<%@ include file="/WEB-INF/layout/myPageSidebar.jsp"%>
	</sidebar>
<body>


<section class="py-5" id="positionMid">

<div id='calendar'><button id='reset'>선택 취소</button></div>

<table>
<tbody>
<tr><th>예약번호</th><td><input type="text" value="${ Pres.resId }" readonly>예약고유번호로 변경불가합니다</td><td rowspan="5"></td></tr>
<tr><th>예약자명</th><td><input type="text" value="${ Pres.resName }"></td></tr>
<tr><th>예약자연락처</th><td><input type="text" value="${ Pres.resTel }"></td></tr>
<tr><th>입실일</th><td><input type="text" value="${ Pres.resSdate }" id="resSdate" readonly></td></tr>
<tr><th>퇴실일</th><td><input type="text" value="${ Pres.resEdate }" id="resEdate" readonly></td></tr>
</tbody>
</table>



</section>
</body>
</div>
</html>