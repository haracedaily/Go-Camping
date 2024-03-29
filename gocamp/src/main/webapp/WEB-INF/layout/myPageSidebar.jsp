<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#sidebar-wrapper{
display:block;
left:0;
text-align:center;
width:310px;
}
</style>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>myPage</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이 페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="userInfo.do">내 정보 확인</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">장바구니</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="perReserv.do">예약 정보</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">상품 구매 내역</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="userMessageList.do">쪽지함</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="commentList.do">내가 쓴 댓글</a>
                    
                </div>
            </div>
            
            