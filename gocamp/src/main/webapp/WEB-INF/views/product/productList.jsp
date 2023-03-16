<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>


	.guide_contents{
	margin-left:15%;
}
	.cat{
	diplay: inline-block;
	padding: 15px 25px;
	margin-right: 5px;
	font-size: x-large;
	float: left;
	list-style-type:none;

	
	}
	.cat a:hover{
	color:black;
	}
	
	.rate{
		diplay: inline-block;
	padding: 15px 25px;
	margin-right: 5px;
	font-size: small;
	float: left;
	list-style-type:none;
	
	}
</style>
<!-- 공통으로 들어가는 부분 -->
<div class="guide_contents" >
<ul class="site-nav">
	
	<li class="cat">
		<a href="#">모든상품</a>
		</li>
	<li class="cat">
		<a href="#">텐트</a>
		</li>
	<li class="cat">
		<a href="#">테이블</a>
	</li>
	<li class="cat">
		<a href="#">침낭/매트</a>
	</li>
	<li class="cat">
		<a href="#">식기</a>
	</li>

</ul>
</div>
<div class="guide_contents" >
<ul class="site-nav">
	
	<li class="rate">
		<a href="#">비싼가격순</a>
		</li>
	<li class="rate">
		<a href="#">낮은가격순</a>
		</li>
	<li class="rate">
		<a href="#">세일상품</a>
	</li>
	<li class="rate">
		<a href="#">별점순</a>
	</li>
	

</ul>
</div>





<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div
			class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

			<c:forEach var="product" items="${list }">

				<div class="col mb-5">
					<div class="card h-100">
						<!-- Sale badge-->
						<div class="badge bg-dark text-white position-absolute"
							style="top: 0.5rem; right: 0.5rem">Sale</div>
						<!-- Product image-->
						<a href="#">
						<img class="card-img-top" src="./img/${product.prodImga }"  alt="..." />
						</a>
						<!-- Product details-->
						<div class="card-body p-4">
							<div class="text-center">
								<!-- Product name-->
								<h5 class="fw-bolder">${product.prodName }</h5>
								<!-- Product reviews-->



								<!-- Product price-->
								<span class="text-muted text-decoration-line-through"> 
								<fmt:formatNumber value="${product.prodPrice }" pattern="#,###" /> 원
								</span>
								<fmt:formatNumber value="${product.prodSalePrice }" pattern="#,###" />
								원
							</div>
						</div>
						<!-- Product actions-->
						<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
							<div class="text-center">
								<a class="btn btn-outline-dark mt-auto" href="#">Add to cart<hr>
								<a class="btn btn-outline-dark mt-auto" href="#">바로 구매하기</a>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>	