<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
#loca_menu{
list-style-type: none;
margin-right:60%;
}
#loca_menu li{
float:left;
padding:10px;
}
#loca_menu li:hover{
color:skyblue;
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
</style>

 <ul class="js-clone-nav d-none d-lg-inline-block text-left float-right site-menu" id="loca_menu">
 <li><a href="all">전 체</a></li>
 <li><a href="경기">경기도</a></li>
 <li><a href="충청">충청도</a></li>
 <li><a href="경상">경상도</a></li>
 </ul>

<form action="loca.do" id='locaChoice'>
<input type="hidden" name="addr" value="${addr }">

</form>
<script>
<!-- 
let myfrm=document.querySelector('#locaChoice');

document.querySelectorAll('.float-right.site-menu a').forEach(atag=>{
	atag.addEventListener('click',function(e){
		e.preventDefault();
		myfrm.addr.value=this.getAttribute('href');
		myfrm.submit();
	})
})-->
</script>

<div id='locaDetail'> 
<div id="map" style="width:35vw;height:70vh;"></div>

<div class="loca-exp">
<c:forEach items="${list }" var="list">
<table class="detail-exp">
<input type="hidden" name="locaId" id="locaId" value="${list.locaId }">
<thead>
<tr>
<th>이름</th>
<th>${list.locaName }</th>
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
</tbody>
</table>
</c:forEach>
</div>
</div>
<div id="blank"/>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f5ca12e7c10d8949c4309573d8d938a9&libraries=services,clusterer"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(36.0546016180995, 127.570667), // 지도의 중심좌표
        level: 14 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 


		// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
var listData = "${loAddr }";

	const string =listData.split(',');
console.log(string);


string.forEach(function(addr, index) {
	
    geocoder.addressSearch(addr, function(result, status) {
        if (status === daum.maps.services.Status.OK) {
            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            var marker = new daum.maps.Marker({
                map: map,
                position: coords,
                title : string[index]
            });

        } 
    });

});



</script>

<!--
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
        center: new kakao.maps.LatLng(36.05460161809957, 128.6627968591243), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커를 표시할 위치와 title 객체 배열입니다 
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('경기 파주시 문산읍 마정리 613-1', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
        map.setCenter(coords);
     } 
 }); 
// 마커 이미지의 이미지 주소입니다

//var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
//for (var i = 0; i < positions.length; i ++) {
    
    // 마커 이미지의 이미지 크기 입니다
    //var imageSize = new kakao.maps.Size(24, 35); 
    
    // 마커 이미지를 생성합니다    
    //var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
    
    // 마커를 생성합니다
//    var marker = new kakao.maps.Marker({
//        map: map, // 마커를 표시할 지도
//        position: positions[i].latlng, // 마커를 표시할 위치
//        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
//        image : markerImage // 마커 이미지 
//    });
} -->



<!-- 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('경기 파주시 문산읍 마정리 613-1', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
geocoder.addressSearch('경기 파주시 파평면 파평산로363', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
        });
        infowindow.open(map, marker);
         -->