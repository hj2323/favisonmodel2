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
			<h2>MemberPage</h2>
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


				<table class="table">
					<thead>
						<tr>
							<th></th>
							<th>ID</th>
							<th>Name</th>
							<th>email</th>
							<th>address</th>
							<th>phone number</th>
							<th>gender</th>
							<th>가입일</th>
						</tr>
					</thead>
					<form action="deleteSelectedMember.hj" method="post">
					<button type="submit" class="btn btn-default">선택삭제</button>
					<tbody>
						<c:choose>
							<c:when
								test="${ pageDto.totalCount gt 0 && pageDto.searchCount ==0 && word == null}">
								<c:forEach var="member" items="${mlist }">
									<tr>
										<td><input type="checkbox" name="checkRow"
											value="${member.id}"></td>
										<td>${member.id}</td>
										<td>${member.name}</td>
										<td>${member.email}</td>
										<td>${member.address}</td>
										<td>${member.tel}</td>
										<td>${member.gender}</td>
										<td>${member.regDate}</td>

									</tr>
								</c:forEach>
							</c:when>
							<c:when test="${totalCount==0 }">
								<tr>
									<td>게시판 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:when
								test="${ pageDto.totalCount gt 0 && pageDto.searchCount !=0}">
								<c:forEach var="sblog" items="${slist }">
									<tr>
										<td><input type="checkbox" name="checkRow"
											value="${member.id}"></td>
										<td>${member.id}</td>
										<td>${member.name}</td>
										<td>${member.email}</td>
										<td>${member.address}</td>
										<td>${member.tel}</td>
										<td>${member.gender}</td>
										<td>${member.regDate}</td>

									</tr>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>게시판 글이 없습니다.
								</tr>
							</c:otherwise>
						</c:choose>


					</tbody>

				</table>
				
				</form>
				<div style="margin-left: 50px;">
					<ul class="pagination" style="align: center;">
						<c:choose>
							<c:when
								test="${ pageDto.totalCount gt 0 && pageDto.searchCount == 0 && word == null}">
								<%-- [이전] 출력 --%>
								<c:if test="${ pageDto.startPage gt pageDto.pageBlock } ">
									<li class="page-item"><a
										href="memberPage.hj?pageNum=${startPage - pageBlock}"
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
									<a href="memberPage.hj?pageNum=${ i }" class="page-link">${ i }</a>
									</li>
								</c:forEach>

								<%-- [다음] 출력 --%>
								<c:if test="${ pageDto.endPage lt pageDto.pageCount }">
									<li class="page-item"><a
										href="memberPage.hj?pageNum=${startPage + pageBlock }"
										class="page-link" aria-label="Next"> <i
											class="ti-angle-right"></i>
									</a></li>
								</c:if>

							</c:when>

							<c:when test="${ pageDto.searchCount gt 0 }">
								<%-- [이전] 출력 --%>
								<c:if test="${ pageDto.startPage gt pageDto.pageBlock } ">
									<li class="page-item"><a
										href="memberPage.hj?pageNum=${startPage - pageBlock}&field=${field}&word=${word}"
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
									<a
										href="memberPage.hj?pageNum=${ i }&field=${field}&word=${word}"
										class="page-link">${ i }</a>
									</li>
								</c:forEach>

								<%-- [다음] 출력 --%>
								<c:if test="${ pageDto.endPage lt pageDto.pageCount }">
									<li class="page-item"><a
										href="memberPage.hj?pageNum=${startPage + pageBlock }&field=${field}&word=${word}"
										class="page-link" aria-label="Next"> <i
											class="ti-angle-right"></i>
									</a></li>
								</c:if>

							</c:when>
						</c:choose>
					</ul>
				</div>
				
				
				<form action="memberPage.hj">
					<div style="margin-left: 50px;" class="form-group">
						<select class="form-control" id="sel1">
        <option  value="name">name</option>
        <option  value="gender">gender</option>
      </select><input type="text"
							class="form-control" name="word">
							 <button type="submit" class="btn btn-default">Submit</button>
					</div>
					
				</form>

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