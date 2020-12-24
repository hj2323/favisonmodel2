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
			<h2>Blog</h2>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">Blog</li>
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
					<div class="blog_left_sidebar">
						<c:choose>
							<c:when test="${ pageDto.totalCount gt 0 && pageDto.searchCount ==0 && word == null}">
								<c:forEach var="blog" items="${list }">

									<article class="blog_item">
										<div class="blog_item_img">
											<img class="card-img rounded-0"
												src="img/blog/main-blog/m-blog-${ blog.no }.jpg" alt="">
											<a href="#" class="blog_item_date">
												<h3>
													<fmt:formatDate value="${blog.regDate}" pattern="dd" />
												</h3>
												<p>
													<fmt:formatDate value="${blog.regDate}" pattern="MMM" />
												</p>
											</a>
										</div>

										<div class="blog_details">
											<a class="d-inline-block" href="single-blog.html">
												<h2>
													<a href="singleblog.hj?no=${blog.no}&pageNum=${pageNum}">${ blog.subject }</a>
												</h2>
											</a>

											<ul class="blog-info-link">
												<li><a href="#"><i class="far fa-user"></i> Travel,
														Lifestyle</a></li>
												<li><a href="#"><i class="far fa-comments"></i> 0
														Comments</a></li>
												<li>hit ${blog.readcount }</li>
											</ul>
										</div>
									</article>
								</c:forEach>
							</c:when>
							<c:when test="${totalCount==0 }">
								<article class="blog_item">게시판 글이 없습니다.</article>
							</c:when>
							<c:when test="${ pageDto.totalCount gt 0 && pageDto.searchCount !=0}">
								<c:forEach var="sblog" items="${slist }">

									<article class="blog_item">
										<div class="blog_item_img">
											<img class="card-img rounded-0"
												src="img/blog/main-blog/m-blog-${ sblog.no }.jpg" alt="">
											<a href="#" class="blog_item_date">
												<h3>
													<fmt:formatDate value="${sblog.regDate}" pattern="dd" />
												</h3>
												<p>
													<fmt:formatDate value="${sblog.regDate}" pattern="MMM" />
												</p>
											</a>
										</div>

										<div class="blog_details">
											<a class="d-inline-block" href="single-blog.html">
												<h2>
													<a href="singleblog.hj?no=${sblog.no}&pageNum=${pageNum}">${ sblog.subject }</a>
												</h2>
											</a>

											<ul class="blog-info-link">
												<li><a href="#"><i class="far fa-user"></i> Travel,
														Lifestyle</a></li>
												<li><a href="#"><i class="far fa-comments"></i> 0
														Comments</a></li>
												<li>hit ${sblog.readcount }</li>
											</ul>
										</div>
									</article>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<article class="blog_item">게시판 글이 없습니다.</article>
							</c:otherwise>
						</c:choose>




						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
							<c:choose>
								<c:when test="${ pageDto.totalCount gt 0 && pageDto.searchCount == 0 && word == null}">
									<%-- [이전] 출력 --%>
									<c:if test="${ pageDto.startPage gt pageDto.pageBlock } ">
										<li class="page-item"><a
											href="blog.hj?pageNum=${startPage - pageBlock}"
											class="page-link" aria-label="Previous"> <i
												class="ti-angle-left"></i>
										</a></li>
									</c:if>


									<%-- 페이지블록의 시작페이지부터 끝페이지까지 페이지번호 출력하기 --%>
									<c:forEach var="i" begin="${ pageDto.startPage }"
										end="${ pageDto.endPage }" step="1">
										<c:choose>
											<%-- c:when test="${ pageScope.i eq requestScope.pageNum }" 구체적으로 명시하면 성능은 좋은데 코드가 길어짐--%>
											<c:when test="${ i eq pageNum }">
												<li class="page-item active">
											</c:when>
											<c:otherwise>
												<li class="page-item">
											</c:otherwise>
										</c:choose>
										<a href="blog.hj?pageNum=${ i }" class="page-link">${ i }</a>
										</li>
									</c:forEach>

									<%-- [다음] 출력 --%>
									<c:if test="${ pageDto.endPage lt pageDto.pageCount }">
										<li class="page-item"><a
											href="blog.hj?pageNum=${startPage + pageBlock }"
											class="page-link" aria-label="Next"> <i
												class="ti-angle-right"></i>
										</a></li>
									</c:if>

								</c:when>
								
								<c:when test="${ pageDto.searchCount gt 0 }">
									<%-- [이전] 출력 --%>
									<c:if test="${ pageDto.startPage gt pageDto.pageBlock } ">
										<li class="page-item"><a
											href="blog.hj?pageNum=${startPage - pageBlock}&field=${field}&word=${word}"
											class="page-link" aria-label="Previous"> <i
												class="ti-angle-left"></i>
										</a></li>
									</c:if>


									<%-- 페이지블록의 시작페이지부터 끝페이지까지 페이지번호 출력하기 --%>
									<c:forEach var="i" begin="${ pageDto.startPage }" end="${ pageDto.endPage }" step="1">
										<c:choose>
											<%-- c:when test="${ pageScope.i eq requestScope.pageNum }" 구체적으로 명시하면 성능은 좋은데 코드가 길어짐--%>
											<c:when test="${ i eq pageNum }">
												<li class="page-item active">
											</c:when>
											<c:otherwise>
												<li class="page-item">
											</c:otherwise>
										</c:choose>
										<a href="blog.hj?pageNum=${ i }&field=${field}&word=${word}" class="page-link">${ i }</a>
										</li>
									</c:forEach>

									<%-- [다음] 출력 --%>
									<c:if test="${ pageDto.endPage lt pageDto.pageCount }">
										<li class="page-item"><a
											href="blog.hj?pageNum=${startPage + pageBlock }&field=${field}&word=${word}"
											class="page-link" aria-label="Next"> <i
												class="ti-angle-right"></i>
										</a></li>
									</c:if>

								</c:when>
								</c:choose>
							</ul>
						</nav>
					
<c:choose>
									<c:when test="${empty id}">
										<!-- 세션이 없을때 -->
										<span class="lg">로그인이후에 글쓰기가 가능합니다.</span>
									</c:when>
									<c:otherwise>
										<!-- 세션이 있을때 -->
										<div class="form-group mt-3">
							<button type="submit" class="button button-contactForm"
								onclick="location.href='writeForm.hj'">Write</button>
						</div>
									</c:otherwise>
								</c:choose>
						
					</div>
				</div>





				<%--right menu --%>
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget search_widget">
							<form action="#">
								<div class="form-group">
									<select name="field" class="form-control" id="sel1">
										<option value="subject">title</option>
										<option value="name">author</option>
										
									</select>
									<div class="input-group mb-3">
										<input type="text" name="word" class="form-control"
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
										<p>21</p>
								</a></li>
								<li><a href="#" class="d-flex">
										<p>Health Care (21)</p>
										<p>09</p>
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


						<aside class="single_sidebar_widget instagram_feeds">
							<h4 class="widget_title">Instagram Feeds</h4>
							<ul class="instagram_row flex-wrap">
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i1.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i2.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i3.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i4.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i5.png" alt="">
								</a></li>
								<li><a href="#"> <img class="img-fluid"
										src="img/instagram/widget-i6.png" alt="">
								</a></li>
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