<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Go Camping</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<style>
#mastHead{
width:100vw;
height:100vh;
background-color: rgba(0,0,0,0.6);
background-blend-mode: multiply;
}
#headFont{
font-size:60pt;
font-weight:bold;
}
.hoverSign {
transition: color 0.4s ease;
transition: opacity 0.4s ease;
transition: background-color 0.4s ease;
transition: border-radius 0.4s ease;
box-shadow: 0 0.1875rem 0.1875rem 0 rgba(0, 0, 0, 0.1) !important;
    padding: 1.25rem 2rem;
    font-family: "Varela Round", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji";
    font-size: 80%;
    text-transform: uppercase;
    letter-spacing: 0.15rem;
    border: 0;
    display: inline-block;
    font-weight: 400;
    line-height: 1.5;
    text-align: center;
    text-decoration: none;
    vertical-align: middle;
    cursor: pointer;
    border-radius: 0.25rem;
    background-color:#ffffff;
}
.hoverSign:hover{
color:#ffffff;
opacity:0.4;
background-color:#0088dd;
border-radius:40%;
}
</style>
</head>
<body id="page-top">
	<!-- Navigation-->
	<!-- <img class="img-fluid" src="assets/img/bg-masthead.jpg" alt="..." id="bgimage1" /> -->

	<!-- Masthead-->

	<section style="background-image: url('assets/img/bg-masthead.jpg')" id="mastHead">
	<div
		class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
		<div class="d-flex justify-content-center">
			<div class="text-center">
				<p class="text-white-50 mx-auto my-0 text-uppercase" id="headFont">go Camping</p>
				<h3 class="text-white-50 mx-auto mt-2 mb-5">당신의 자유를 저희와 함께 하시죠</h3>
				<c:if test="${user==null }">
				<a class="hoverSign" href="loginForm.do">Sign in</a>
				</c:if>
			</div>
		</div>
		
	</div>
	</section>


</body>
</html>