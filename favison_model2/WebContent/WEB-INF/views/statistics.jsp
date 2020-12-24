<%@page import="java.util.List"%>
<%@page import="com.exam.domain.BlogVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.exam.dao.BlogDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


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
			<h2>Statistics</h2>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">관리자페이지</a></li>
				</ol>
			</nav>
		</div>
	</section>
	<!--================Hero Banner Area End =================-->


	<!--================Blog Area =================-->
	<section class="blog_area area-padding">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 mb-5 mb-lg-0">
					
					
					
					
					
				</div>





				
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

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