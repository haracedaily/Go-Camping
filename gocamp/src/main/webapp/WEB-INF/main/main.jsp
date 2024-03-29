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
#top-container {
	display: block;
	float: right;
	margin: 50, auto;
	width: 550px;
}

#personal {
	display: block;
	float: right;
	margin-right: 20px;
}

#personal li {
	display: block;
	float: right;
	font-size: small;
	margin-right: 15px;
}

#menu {
	display: block;
	float: right;
}

#menu li {
	display: block;
	float: right;
	font-size: large;
	font-weight: bold;
}

#container {
	overflow: hidden;
	margin:0;
	padding:0;
}
#blank{
width:100%;
height:95px;
display:both;
}
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

</style>
</head>
<body id="page-top">
	<!-- Navigation-->
	<!-- <img class="img-fluid" src="assets/img/bg-masthead.jpg" alt="..." id="bgimage1" /> -->
	<nav>
		<div id="top-container">
		
			<ul class="navbar-nav ms-auto" id="personal">
				<li class="nav-item"><a class="nav-link" href="userInfo.do">마이페이지</a></li>
				<li class="nav-item"><a class="nav-link" href="#projects">쪽지함</a></li>
				<li class="nav-item"><a class="nav-link" href="#signup">쪽지함</a></li>
				<li class="nav-item"><a class="nav-link" href="#signup">쪽지함</a></li>
				<li class="nav-item"><a class="nav-link" href="#signup">쪽지함</a></li>
			</ul>
			<ul id="menu">
				<li class="nav-item"><a class="nav-link" href="noticeList.do">Notice</a></li>
				<li class="nav-item"><a class="nav-link" href="product.do">Product</a></li>
				<li class="nav-item"><a class="nav-link" href="loca.do">Location</a></li>
			</ul>
		
		</div>
		
		<div id="blank">
		</div>


		
	</nav>
	<!-- Masthead-->

	<section style="background-image: url('assets/img/bg-masthead.jpg')" id="mastHead">
	<div
		class="container px-4 px-lg-5 d-flex h-100 align-items-center justify-content-center">
		<div class="d-flex justify-content-center">
			<div class="text-center">
				<p class="text-white-50 mx-auto my-0 text-uppercase" id="headFont">go Camping</p>
				<h3 class="text-white-50 mx-auto mt-2 mb-5">당신의 자유를 저희와 함께 하시죠</h3>
			</div>
			
		</div>
		
	</div>
	<a class="hoverSign" href="loginForm.do">Sign in</a>
	</section>
	<!-- About-->
	<section class="about-section text-center" id="about">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5 justify-content-center">
				<div class="col-lg-8">
					<h2 class="text-white mb-4">Built with Bootstrap 5</h2>
					<p class="text-white-50">
						Grayscale is a free Bootstrap theme created by Start Bootstrap. It
						can be yours right now, simply download the template on <a
							href="https://startbootstrap.com/theme/grayscale/">the
							preview page.</a> The theme is open source, and you can use it for
						any purpose, personal or commercial.
					</p>
				</div>
			</div>
			<img class="img-fluid" src="assets/img/ipad.png" alt="..." />
		</div>
	</section>
	<!-- Projects-->
	<section class="projects-section bg-light" id="projects">
		<div class="container px-4 px-lg-5">
			<!-- Featured Project Row-->
			<div class="row gx-0 mb-4 mb-lg-5 align-items-center">
				<div class="col-xl-8 col-lg-7">
					<img class="img-fluid mb-3 mb-lg-0"
						src="assets/img/bg-masthead.jpg" alt="..." />
				</div>
				<div class="col-xl-4 col-lg-5">
					<div class="featured-text text-center text-lg-left">
						<h4>Shoreline</h4>
						<p class="text-black-50 mb-0">Grayscale is open source and MIT
							licensed. This means you can use it for any project - even
							commercial projects! Download it, customize it, and publish your
							website!</p>
					</div>
				</div>
			</div>
			<!-- Project One Row-->
			<div class="row gx-0 mb-5 mb-lg-0 justify-content-center">
				<div class="col-lg-6">
					<img class="img-fluid" src="assets/img/demo-image-01.jpg" alt="..." />
				</div>
				<div class="col-lg-6">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-left">
								<h4 class="text-white">Misty</h4>
								<p class="mb-0 text-white-50">An example of where you can
									put an image of a project, or anything else, along with a
									description.</p>
								<hr class="d-none d-lg-block mb-0 ms-0" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Project Two Row-->
			<div class="row gx-0 justify-content-center">
				<div class="col-lg-6">
					<img class="img-fluid" src="assets/img/demo-image-02.jpg" alt="..." />
				</div>
				<div class="col-lg-6 order-lg-first">
					<div class="bg-black text-center h-100 project">
						<div class="d-flex h-100">
							<div class="project-text w-100 my-auto text-center text-lg-right">
								<h4 class="text-white">Mountains</h4>
								<p class="mb-0 text-white-50">Another example of a project
									with its respective description. These sections work well
									responsively as well, try this theme on a small screen!</p>
								<hr class="d-none d-lg-block mb-0 me-0" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Signup-->
	<section class="signup-section" id="signup">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-10 col-lg-8 mx-auto text-center">
					<i class="far fa-paper-plane fa-2x mb-2 text-white"></i>
					<h2 class="text-white mb-5">Subscribe to receive updates!</h2>
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form class="form-signup" id="contactForm"
						data-sb-form-api-token="API_TOKEN">
						<!-- Email address input-->
						<div class="row input-group-newsletter">
							<div class="col">
								<input class="form-control" id="emailAddress" type="email"
									placeholder="Enter email address..."
									aria-label="Enter email address..."
									data-sb-validations="required,email" />
							</div>
							<div class="col-auto">
								<button class="btn btn-primary disabled" id="submitButton"
									type="submit">Notify Me!</button>
							</div>
						</div>
						<div class="invalid-feedback mt-2"
							data-sb-feedback="emailAddress:required">An email is
							required.</div>
						<div class="invalid-feedback mt-2"
							data-sb-feedback="emailAddress:email">Email is not valid.</div>
						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3 mt-2 text-white">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3 mt-2">Error
								sending message!</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact-->
	<section class="contact-section bg-black">
		<div class="container px-4 px-lg-5">
			<div class="row gx-4 gx-lg-5">
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-map-marked-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Address</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">4923 Market Street,
								Orlando FL</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-envelope text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Email</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">
								<a href="#!">hello@yourdomain.com</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<div class="card py-4 h-100">
						<div class="card-body text-center">
							<i class="fas fa-mobile-alt text-primary mb-2"></i>
							<h4 class="text-uppercase m-0">Phone</h4>
							<hr class="my-4 mx-auto" />
							<div class="small text-black-50">+1 (555) 902-8832</div>
						</div>
					</div>
				</div>
			</div>
			<div class="social d-flex justify-content-center">
				<a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a> <a
					class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a> <a
					class="mx-2" href="#!"><i class="fab fa-github"></i></a>
			</div>
		</div>
	</section>
	<!-- Footer-->
	<footer class="footer bg-black small text-center text-white-50">
		<div class="container px-4 px-lg-5">Copyright &copy; Your
			Website 2022</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="js/scripts.js"></script>

	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
