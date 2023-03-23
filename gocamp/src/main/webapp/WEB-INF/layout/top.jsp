<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
   <head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Untree.co">
  <link rel="shortcut icon" href="favicon.png">

  <meta name="description" content="" />
  <meta name="keywords" content="" />

  <link href="https://fonts.googleapis.com/css2?family=Lato:wght@400;900&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="css/style2/bootstrap.min.css">
  <link rel="stylesheet" href="css/style2/owl.carousel.min.css">
  <link rel="stylesheet" href="css/style2/owl.theme.default.min.css">
  <link rel="stylesheet" href="css/style2/jquery.fancybox.min.css">
  <link rel="stylesheet" href="fonts/icomoon/style.css">
  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
  <link rel="stylesheet" href="css/style2/aos.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">
  <link rel="stylesheet" href="css/style2/style.css">

  <title>Go Camping</title>
</head>

<body>

  <div class="lines-wrap">
    <div class="lines-inner">
      <div class="lines"></div>
    </div>
  </div>
  <!-- END lines -->

  <div class="site-mobile-menu site-navbar-target">
    <div class="site-mobile-menu-header">
      <div class="site-mobile-menu-close">
        <span class="icofont-close js-menu-toggle"></span>
      </div>
    </div>
    <div class="site-mobile-menu-body"></div>
  </div>

  <nav class="site-nav">
    <div class="container">
      <div class="site-navigation">
    
        <ul class="js-clone-nav d-none d-lg-inline-block text-left float-right site-menu">
          <c:choose>
          <c:when test="${user != null }">
          <li>[ ${user.getNickname()} ] 님 반갑습니다!</li>
          </c:when>
          <c:otherwise>
          <li>[ 손님 ] 반갑습니다!</li>
          </c:otherwise>
          </c:choose>
		  <li><a href="userMessageList.do">쪽지함</a></li>
		  <c:choose>
		  <c:when test="${user.getUserId() != null}">
          <li><a href="userInfo.do">마이페이지</a></li>
		  </c:when>
		  <c:otherwise>
		  </c:otherwise>
		  </c:choose>
		  <c:if test="${user.getUserId() == 'admin' && user != null }">
		  <li><a href="userListAjax.do">관리자 페이지</a></li>
		  </c:if>		  
          <c:choose>
          <c:when test="${user != null}" >
          <li class="cta-button active"><a href="logOut.do">로그아웃</a></li>
          </c:when>
          <c:otherwise>
          <li class="cta-button active"><a href="loginForm.do">로그인</a></li>
          <li><a href="join.do">회원가입</a></li> 
          </c:otherwise>
          </c:choose>
          

        </ul>

        <a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
          <span></span>
        </a>

      </div>
    </div>
  </nav>