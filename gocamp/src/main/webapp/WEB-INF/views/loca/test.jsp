<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>

<div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="reservationModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reservationModalLabel">���� ���� �Է�</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form id="reservationForm">
          <div class="mb-3">
            <label for="name" class="form-label">�̸�</label>
            <input type="text" class="form-control" id="name" name="name">
          </div>
          <div class="mb-3">
            <label for="phone" class="form-label">����ó</label>
            <input type="text" class="form-control" id="phone" name="phone">
          </div>
          <div class="mb-3">
            <label for="people" class="form-label">�ο���</label>
            <input type="number" class="form-control" id="people" name="people" min="1">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">���</button>
        <button type="button" class="btn btn-primary" id="submitReservation">Ȯ��</button>
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

  // �Էµ� �����Ͱ� ��ȿ���� �����ϴ� �ڵ尡 �ʿ��մϴ�.
  // ���⼭�� �ܼ��� �� ���ڿ����� üũ�߽��ϴ�.
  if (!name || !phone || !people) {
    alert('��� �׸��� �Է����ּ���.');
    return;
  }

  // �Էµ� �����͸� ������ �����մϴ�.
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
	      // �����κ����� ���� ó��
	      if (response.result === 'success') {
	        alert('������ �Ϸ�Ǿ����ϴ�.');
	        // ������ �Ϸ�� �Ŀ��� ���â�� �ݰ�, Ķ������ ���ΰ�ħ�Ͽ� ����� ������ �ݿ��մϴ�.
	        $('#reserve-modal').modal('hide');
	        $('#calendar').fullCalendar('refetchEvents');
	      } else {
	        alert('���࿡ �����߽��ϴ�. �ٽ� �õ����ּ���.');
	      }
	    },
	    error: function(xhr, status, error) {
	      // ��� ���� ó��
	      console.error(error);
	      alert('��� ������ �߻��߽��ϴ�.');
	    }
	  });
	});

</script>
</html>