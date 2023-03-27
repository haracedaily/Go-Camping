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
<div id='locaDetail'> 
<div id="map" style="width:25vw;height:50vh;"></div>

<div class="loca-exp">
<table class="detail-exp loca-sub-menu">
<thead>
<tr>
<th>이름</th>
<th><a href="locaDetail.do?locaId=${list.locaId }">${list.locaName }</a></th>
</tr>
<tbody>
<tr>
<td>위치</td>
<td>${list.locaAddr }</td>
</tr>
<tr>
<td>연락처</td>
<td>${list.locaTel }</td>
</tr>
<tr>
<td>소개</td>
<td>${list.locaExp }</td>
</tr>
<c:choose>
<c:when test="${user != null }">
<tr><td><button id="reserBtn" value="${list.locaId }" style="width:auto;">예약하기</button></td></tr>
</c:when>
<c:otherwise>
<tr><td>로그인 후 이용해주세요</td></tr>
</c:otherwise>
</c:choose>
<tr>
</tr>
</tbody>
</table>
</div>
</div>
<div class="img-boxer">
<div class="img-container">
<div class='img-content'>
<img src="upload/${list.locaName }1.jpg">
</div>
<div class='img-content'>
<img src="upload/${list.locaName }2.jpg">
</div>
<div class='img-content'>
<img src="upload/${list.locaName }3.jpg">
</div>
<div class='img-content'>
<img src="upload/${list.locaName }4.jpg">
</div>
</div>
<button class="prev-button">&lt;</button><input type="text" id="imgpage" style="border:none;width:1vw;" value="1" readonly></input><button class="next-button"> &gt;</button>
</div>
<div id="blank"/>





<form action="locaReserv.do" method="POST" id="reservFrm">
<input type="hidden" name="locaId" id="reId">
</form>


<script>
document.querySelector('#reserBtn').addEventListener('click',function(e){
e.preventDefault();
	let reFrm = document.querySelector('#reservFrm');

document.getElementById('reId').value='${locaId}';

	reFrm.submit();
})
</script>
<script>
const prevButton = document.querySelector('.prev-button');
const nextButton = document.querySelector('.next-button');
const imgContainer = document.querySelector('.img-container');
const currImages = document.querySelectorAll('img');
let imgcount = 0;
let imgpc=0;

prevButton.addEventListener('click', function(){
	if(imgcount!=0){
		imgcount -= 1;
		console.log(imgcount);
		imgpc = imgcount+1;
		document.getElementById('imgpage').value=imgpc;
	   imgContainer.style.transform = 'translate(-'+100*imgcount+'vw)';	
	}else if(imgcount==0){
		imgcount = 3;
		imgpc = imgcount+1;
		document.getElementById('imgpage').value=imgpc;
		imgContainer.style.transform = 'translate(-'+100*imgcount+'vw)';
	}
});

nextButton.addEventListener('click', function(){
	if(imgcount==3){
		imgcount=0;
		imgpc = imgcount+1;
		document.getElementById('imgpage').value=imgpc;
		imgContainer.style.transform ='translate(-'+100*imgcount+'vw)';
	}
	else if (imgcount>=-1){
	   imgcount += 1;
	   imgpc = imgcount+1;
	   console.log(imgcount);
	   document.getElementById('imgpage').value=imgpc;
	   imgContainer.style.transform ='translate(-'+100*imgcount+'vw)';
	   
	}
});
var imm = setInterval(function(){imgMo()} ,1600);

prevButton.onmouseout=function(){
	imm = setInterval(function(){imgMo()},1600);
}
prevButton.onmouseover = function(){
	clearInterval(imm);
};
nextButton.onmouseout = function(){
	imm = setInterval(function(){imgMo()},1600);
};
nextButton.onmouseover = function(){
	clearInterval(imm);
};
		
function imgMo(){
	if(imgcount==3){
		imgcount=0;
		imgpc = imgcount+1;
		document.getElementById('imgpage').value=imgpc;
		imgContainer.style.transform ='translate(-'+100*imgcount+'vw)';
	}
	else if (imgcount>=-1){
	   imgcount += 1;
	   imgpc = imgcount+1;
	   document.getElementById('imgpage').value=imgpc;
	   imgContainer.style.transform ='translate(-'+100*imgcount+'vw)';
	}
	
};
</script>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5ca12e7c10d8949c4309573d8d938a9&libraries=services,clusterer"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(36.05460161809957, 128.6627968591243), // 지도의 중심좌표
    level: 2 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커를 표시할 위치와 title 객체 배열입니다 
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${loAddr}', function(result, status) {

// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

    // 결과값으로 받은 위치를 마커로 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords,
        title:'${loNm}'
    });
    map.setCenter(coords);
 } 
}); 
</script>
</body>
</html>
