<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();

if (cookies != null) {
	for (Cookie cookie : cookies) {
		if (cookie.getName().equals("id")) {
	String id = cookie.getValue();
	session.setAttribute("id", id);
		}
	} //for
}

String id = (String) session.getAttribute("id");
%>
<!--================Header Menu Area =================-->
<header class="header_area">
	<div class="main_menu">
		<nav class="navbar navbar-expand-lg navbar-light">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<a class="navbar-brand logo_h" href="index.hj"><img
					src="img/logo.png" alt=""></a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse offset"
					id="navbarSupportedContent">
					<ul class="nav navbar-nav menu_nav ml-auto">
						<li class="nav-item"><a class="nav-link" href="index.hj">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="feature.hj">Features</a></li>
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">Blog</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="blog.hj">Blog</a></li>

							</ul></li>
						<li class="nav-item"><a class="nav-link" href="contact.hj">Contact</a></li>

						
						<%
						
						if(id !=null){
                                if (id.equals("admin")) { 
						%>
						
						<li class="nav-item submenu dropdown"><a href="#"
							class="nav-link dropdown-toggle" data-toggle="dropdown"
							role="button" aria-haspopup="true" aria-expanded="false">관리자페이지</a>
							<ul class="dropdown-menu">
								<li class="nav-item"><a class="nav-link" href="memberPage.hj">회원관리</a></li>
								<li class="nav-item"><a class="nav-link" href="statistics.hj">통계</a></li>
							</ul>
						</li>
						
						<%
							}else{
								%>
							
									<% 
							}
						}
						%>
						

					</ul>
				</div>
				<div class="right-button">
					<ul>
						<%
							if (id != null) {
						%>
						<li>Signed in as <%=id%></li>
						<li><a class="sign_up" href="logout.hj">Sign Out</a></li>
						<%
							} else {
						%>
						<li><a class="sign_up" href="login.hj">Sign In</a></li>
						<li><a class="sign_up" href="join.hj">Sign Up</a></li>
						<%
							}
						%>


					</ul>
				</div>
			</div>
		</nav>
	</div>
</header>
<!--================Header Menu Area =================-->