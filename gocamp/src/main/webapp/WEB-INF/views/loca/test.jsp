<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reservationModalLabel">예약 정보 입력</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="reservationForm">
          <div class="mb-3">
            <label for="name" class="form-label">이름</label>
            <input type="text" class="form-control" id="name" name="name">
          </div>
          <div class="mb-3">
            <label for="phone" class="form-label">연락처</label>
            <input type="text" class="form-control" id="phone" name="phone">
          </div>
          <div class="mb-3">
            <label for="people" class="form-label">인원수</label>
            <input type="number" class="form-control" id="people" name="people" min="1">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="submitReservation">확인</button>
      </div>
    </div>
  </div>
</div>


<script>
var reservationModal = new bootstrap.Modal(document.getElementById('reservationModal'));
var reservationForm = document.getElementById('reservationForm');
var submitReservation = document.getElementById('submitReservation');

submitReservation.addEventListener('click', function() {
  var name = document.getElementById('name').value;
  var phone = document.getElementById('phone').value;
  var people = document.getElementById('people').value;

  // 입력된 데이터가 유효한지 검증하는 코드가 필요합니다.
  // 여기서는 단순히 빈 문자열인지 체크했습니다.
  if (!name || !phone || !people) {
    alert('모든 항목을 입력해주세요.');
    return;
  }

  // 입력된 데이터를 서버에 전송합니다.
  var event = calendar.getEvents()[calendar.getEvents().length - 1];
  var reservation = {
    title: name,
    start: event.startStr,
    end: event.endStr,
    backgroundColor: '#007bff',
    borderColor: '#007bff',
    textColor: '#fff',
    name: name,
    phone: phone,
    people: people
  };

  fetch('addReservationAjax.do', {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(reservation)
  })
  .then(function(resolve) {
    return resolve.json();
 

$('#reserve-btn').on('click', function() {
	  var name = $('#name-input').val();
	  var phone = $('#phone-input').val();
	  var people = $('#people-input').val();
	  
	  $.ajax({
	    url: 'reserve.do',
	    method: 'POST',
	    data: {
	      name: name,
	      phone: phone,
	      people: people,
	      startDate: startDate,
	      endDate: endDate
	    },
	    success: function(response) {
	      // 서버로부터의 응답 처리
	      if (response.result === 'success') {
	        alert('예약이 완료되었습니다.');
	        // 예약이 완료된 후에는 모달창을 닫고, 캘린더를 새로고침하여 예약된 일정을 반영합니다.
	        $('#reserve-modal').modal('hide');
	        $('#calendar').fullCalendar('refetchEvents');
	      } else {
	        alert('예약에 실패했습니다. 다시 시도해주세요.');
	      }
	    },
	    error: function(xhr, status, error) {
	      // 통신 오류 처리
	      console.error(error);
	      alert('통신 오류가 발생했습니다.');
	    }
	  });
	});

</script>
</html>