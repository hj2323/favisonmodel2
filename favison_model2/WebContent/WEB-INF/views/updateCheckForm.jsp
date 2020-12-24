<%@page import="com.exam.domain.BlogVo"%>
<%@page import="com.exam.dao.BlogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<%--headContent.jsp --%>
<jsp:include page="/WEB-INF/views/include/headContent.jsp" />
</head>
<body>

	<%--headerMenu.jsp --%>
	<jsp:include page="/WEB-INF/views/include/headerMenu.jsp" />

	<!--================Hero Banner Area Start =================-->
	<section class="hero-banner d-flex align-items-center">
		<div class="container text-center">
			<h2>update</h2>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Are you sure if you want to update this page?
						</li>
				</ol>
			</nav>
		</div>
	</section>
	<!--================Hero Banner Area End =================-->


	<!--================Blog Area =================-->
	<section class="blog_area single-post-area area-padding">
		<div class="container">
			<form action="updateForm.hj" method="post">
				<input type="hidden" name="no" value="${no }"> <input
					type="hidden" name="pageNum" value="${pageNum}">


				<div class="col-12">
					<div class="form-group">
						Password<br> <input class="form-control" name="passwd"
							id="name" type="password">
					</div>
				</div>


				<div id="col-12">

					<input type="submit" value="패스워드 확인 " class="btn"> 
					<!--사용자가 변심해서 삭제하지 않고 다시 목록으로 돌아가고싶을때를 위해서  -->
					<input type="button" value="목록" class="btn"
						onclick="location.href='blog.hj?pageNum=${pageNum}'">

				</div>
		</div>









	</section>
	<!--================Blog Area end =================-->
	<%--footer영역 --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp" />


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/contact.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/theme.js"></script>
</body>
</html>