<%@page import="com.exam.domain.BlogVo"%>
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
			<h2>Blog Details</h2>
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
				<div class="col-lg-8 posts-list">
					<div class="single-post">
						<div class="feature-img">
							<img class="img-fluid" src="img/blog/main-blog/m-blog-1.jpg"
								alt="">
						</div>

						<div class="blog_details">
							<h2>No.${ no }💦💦${ blog.subject }</h2>
							<ul class="blog-info-link mt-3 mb-4">
								<li><a href="#"><i class="far fa-user"></i> written by
										${ blog.name }</a></li>
								<li><a href="#"><i class="far fa-comments"></i> <fmt:formatDate
											value="${ blog.regDate }" pattern="yyyy.MM.dd" /></a></li>
							</ul>

							<div class="quote-wrapper">
								<div class="quotes">
									<pre>${ blog.content }</pre>
								</div>
							</div>
						</div>
					</div>
					<div class="navigation-top">
						<div class="d-sm-flex justify-content-between text-center">
							<p class="like-info">
								<span class="align-middle"><i class="far fa-heart"></i></span>파일
								<c:if test="${ hasFile eq true }">

									<c:choose>
										<c:when test="${ isImage eq true }">
											<a href="/upload/${ board.filename }"> <img
												src="/upload/${ board.filename }" width="100" height="100">
											</a>
										</c:when>
										<c:otherwise>
											<a href="/upload/${ board.filename }"> ${ board.filename }
											</a>
										</c:otherwise>
									</c:choose>

								</c:if>
							</p>
							<div class="col-sm-4 text-center my-2 my-sm-0">
								<p class="comment-count">
									<span class="align-middle"><i class="far fa-comment"></i></span>
									06 Comments
								</p>
							</div>
							<ul class="social-icons">
								<li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-dribbble"></i></a></li>
								<li><a href="#"><i class="fab fa-behance"></i></a></li>
							</ul>
						</div>

						<div class="navigation-area">
							<div class="row">
								<div
									class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/blog/prev.jpg" alt="">
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white lnr-arrow-left"></span>
										</a>
									</div>
									<div class="detials">
										<p>Prev Post</p>
										<a href="singleblog.hj?no=${prev}&pageNum=${pageNum}">
											<h4>Space The Final Frontier</h4>
										</a>
									</div>
								</div>
								<div
									class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
									<div class="detials">
										<p>Next Post</p>
										<a href="singleblog.hj?no=${next}&pageNum=${pageNum}">
											<h4>Telescopes 101</h4>
										</a>
									</div>
									<div class="arrow">
										<a href="#"> <span class="lnr text-white lnr-arrow-right"></span>
										</a>
									</div>
									<div class="thumb">
										<a href="#"> <img class="img-fluid"
											src="img/blog/next.jpg" alt="">
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>


					<div class="blog-author">
						<div class="media align-items-center"
							style="display: flex; justify-content: space-around">
							<c:choose>
									<c:when test="${empty id}">
										<!-- 세션이 없을때 -->
										
									</c:when>
									<c:otherwise>
										<!-- 세션이 있을때 -->
										<div class="form-group">
								<button type="button" class="button button-contactForm"
									onclick="location.href = 'updateCheckForm.hj?no=${no}&pageNum=${pageNum}'">UPDATE</button>
							</div>
							<div class="form-group">
								<!--button type="button" class="button button-contactForm" onclick="location.href= 'deleteForm.jsp?no=${ blog.no }'">DELETE</button-->
								<button type="button" class="button button-contactForm"
									onclick="del(${no })">DELETE</button>
							</div>


							<div class="form-group">
								<button type="button" class="button button-contactForm">답글</button>
							</div>
									</c:otherwise>
								</c:choose>
							
							<div class="form-group">
								<button type="button"
									onclick="location.href='blog.hj?pageNum=${pageNum}'"
									class="button button-contactForm">LIST</button>
							</div>
						</div>
					</div>

					<script>
 function del(no){
		//alert(no);
		if(confirm("정말 삭제할까요?")){
			location.href="deletePro.hj?no="+no;
		}
 }
		
 
 
 </script>


					<div class="comments-area">
						<h4>05 Comments</h4>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c1.png" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea
											lesser rule open subdue female fill which them Blessed, give
											fill lesser bearing multiply sea night grass fourth day sea
											lesser</p>

										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>

											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">reply</a>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c2.png" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea
											lesser rule open subdue female fill which them Blessed, give
											fill lesser bearing multiply sea night grass fourth day sea
											lesser</p>

										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>

											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">reply</a>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
						<div class="comment-list">
							<div class="single-comment justify-content-between d-flex">
								<div class="user justify-content-between d-flex">
									<div class="thumb">
										<img src="img/blog/c3.png" alt="">
									</div>
									<div class="desc">
										<p class="comment">Multiply sea night grass fourth day sea
											lesser rule open subdue female fill which them Blessed, give
											fill lesser bearing multiply sea night grass fourth day sea
											lesser</p>

										<div class="d-flex justify-content-between">
											<div class="d-flex align-items-center">
												<h5>
													<a href="#">Emilly Blunt</a>
												</h5>
												<p class="date">December 4, 2017 at 3:12 pm</p>
											</div>

											<div class="reply-btn">
												<a href="#" class="btn-reply text-uppercase">reply</a>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>



					<div class="comment-form">
						<h4>Leave a Reply</h4>
						<form class="form-contact comment_form" action="#"
							id="commentForm">
							<div class="row">
								<div class="col-12">
									<div class="form-group">
										<textarea class="form-control w-100" name="comment"
											id="comment" cols="30" rows="9" placeholder="Write Comment"></textarea>
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<input class="form-control" name="name" id="name" type="text"
											placeholder="Name">
									</div>
								</div>
								<div class="col-sm-6">
									<div class="form-group">
										<input class="form-control" name="email" id="email"
											type="email" placeholder="Email">
									</div>
								</div>
								<div class="col-12">
									<div class="form-group">
										<input class="form-control" name="website" id="website"
											type="text" placeholder="Website">
									</div>
								</div>
							</div>
							<div class="form-group">
								<c:choose>
									<c:when test="${empty id}">
										<!-- 세션이 없을때 -->
										<span class="lg">로그인이후에 댓글쓰기가 가능합니다.</span>
									</c:when>
									<c:otherwise>
										<!-- 세션이 있을때 -->
										<button type="submit" class="button button-contactForm" id="commentBtn">Send
									Message</button>
									</c:otherwise>
								</c:choose>
								
							</div>
						</form>
					</div>
				</div>


				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<div class="input-group mb-3">
										<input type="text" class="form-control"
											placeholder="Search Keyword">
										<div class="input-group-append">
											<button class="btn" type="button">
												<i class="ti-search"></i>
											</button>
										</div>
									</div>
								</div>
								<button class="button rounded-0 primary-bg text-white w-100"
									type="submit">Search</button>
							</form>
						</aside>

						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Category</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex">
										<p>Resaurant food</p>
										<p>(37)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Travel news</p>
										<p>(10)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Modern technology</p>
										<p>(03)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Product</p>
										<p>(11)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Inspiration</p>
										<p>(21)</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Health Care</p>
										<p>(21)</p>
								</a></li>
							</ul>
						</aside>

						<aside class="single_sidebar_widget popular_post_widget">
							<h3 class="widget_title">Recent Post</h3>
							<div class="media post_item">
								<img src="img/blog/popular-post/post1.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>From life was you fish...</h3>
									</a>
									<p>January 12, 2019</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post2.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>The Amazing Hubble</h3>
									</a>
									<p>02 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post3.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Astronomy Or Astrology</h3>
									</a>
									<p>03 Hours ago</p>
								</div>
							</div>
							<div class="media post_item">
								<img src="img/blog/popular-post/post4.jpg" alt="post">
								<div class="media-body">
									<a href="single-blog.html">
										<h3>Asteroids telescope</h3>
									</a>
									<p>01 Hours ago</p>
								</div>
							</div>
						</aside>
						<aside class="single_sidebar_widget tag_cloud_widget">
							<h4 class="widget_title">Tag Clouds</h4>
							<ul class="list">
								<li><a href="#">project</a></li>
								<li><a href="#">love</a></li>
								<li><a href="#">technology</a></li>
								<li><a href="#">travel</a></li>
								<li><a href="#">restaurant</a></li>
								<li><a href="#">life style</a></li>
								<li><a href="#">design</a></li>
								<li><a href="#">illustration</a></li>
							</ul>
						</aside>





						<aside class="single_sidebar_widget newsletter_widget">
							<h4 class="widget_title">Newsletter</h4>

							<form action="#">
								<div class="form-group">
									<input type="email" class="form-control"
										placeholder="Enter email" required>
								</div>
								<button class="button rounded-0 primary-bg text-white w-100"
									type="submit">Subscribe</button>
							</form>
						</aside>
					</div>
				</div>
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