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
<style>
span.btnDelFile {
	color: white;
	background-color: #f84b67;
	font-weight: bold;
	border: 0px;
	border-radius: 5px;
	padding: 3px;
	cursor: pointer;
}
</style>

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
					<li class="breadcrumb-item active" aria-current="page">Blog
						Details</li>
				</ol>
			</nav>
		</div>
	</section>
	<!--================Hero Banner Area End =================-->


	<!--================Blog Area =================-->
	<section class="blog_area single-post-area area-padding">
		<div class="container">



			<div class="row">

				<div class="col-lg-8">
					<form class="form-contact contact_form" action="updatePro.hj"
						method="post" enctype="multipart/form-data">
						<!--input type="hidden" name="no" value="${no}"--> <input
							type="hidden" name="pageNum" value="${pageNum}">

						<div class="row"></div>
						<div class="col-sm-6">
							<div class="form-group">
								No<br> <input class="form-control" name="no"
									id="pass1" type="text" value="${no}" readonly>
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								Name<br> <input class="form-control" name="name" id="name"
									type="text" value="${blog.name}">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								Password<br> <input class="form-control" name="passwd"
									id="pass1" type="password" required>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								subject <input class="form-control" name="subject" id="subject"
									type="text" value="${blog.subject }">
							</div>
						</div>
						<div class="col-12">
							<div class="form-group">
								content
								<textarea class="form-control w-100" name="content" id="content"
									cols="30" rows="9" value="${blog.content }"></textarea>
							</div>
						</div>

						<div class="col-12">
							<div class="form-group">
								file<br>
								<%--
									if (vo.getFilename() == null) {
								%>
								<input type="file" name="filename">
								<%
									} else {
								%>
								<div class="oldFileArea">
									<%=vo.getFilename()%>
									<span class="btnDelFile">X</span>
								</div>
								<input type="hidden" name="oldFilename"
									value="<%=vo.getFilename()%>">
								<%
									}
								--%>
							</div>
						</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="form-group mt-3">
					<button type="submit" class="button button-contactForm">submit</button>
					<button type="button" class="button button-contactForm"
						onclick="location.href='blog.hj?pageNum=${pageNum}'">List</button>
				</div>
				</form>
			</div>
		</div>
		</div>




	</section>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

/
$('span.btnDelFile').click(function() {
	
	$(this).closest('div').next().prop('name','delFilename');
	$(this).closest('td').prepend('<input type="file" name="filename"><br>');
	$(this).closest('div').remove();
});

</script>
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