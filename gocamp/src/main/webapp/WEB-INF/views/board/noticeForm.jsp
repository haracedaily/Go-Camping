<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
          <h2 class="text-secondary heading-2">�۾���</h2>
        </div>
      </div>
    </div>
  </div>

<form method="post" action="noticeformadd.do" enctype="multipart/form-data">

	<table id="bTable">
		<tr>
			<td>
			<input type="hidden" name="boId" value="${notice.getboId() }">
			<input type="hidden" name="userId" value="${user.getUserId() }">
			<input type="text" name="title" placeholder="������ �Է����ּ���" id="titleTable"></td>
		</tr>
		<tr>
			<td><textarea cols="30" rows="5" name="subject" placeholder="������ �Է����ּ���" id="contTable"></textarea></td>
		</tr>
		<tr>	
			<td><input type="file" name="attach" id=imgfile placeholder='null'></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit" id="subBtn">����</button>
			</td>
		</tr>
	</table>
</form>

<script>
	document.querySelector('button').addEventListener('click', function(e){
		
		let title = document.querySelector('input[name="title"]').value;
		let subject = document.querySelector('textearea["subject"]').textContent;

		let isOK = true;
		if(title == '' || title =='null'){
			isOK = false;
		}
		if(subject == '' || subject == 'null'){
			isOK = false;
		}
		if(!isOK){
			alert("Ȯ�����ּ���");
			return false;
		}

		console.log(this);
		
	})
</script>