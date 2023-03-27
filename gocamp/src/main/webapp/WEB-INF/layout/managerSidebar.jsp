<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
#sidebar-wrapper{
float:right;
width:310px;
text-align:center;
}
</style>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Manager</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">관리 페이지</div>
                <div class="list-group list-group-flush">
              
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="userListControl.do">회원 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">상품 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">주문 배송 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="allreserv.do">예약 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="messageList.do">쪽지 관리</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#">구매 후기 관리</a>
                </div>
            </div>
