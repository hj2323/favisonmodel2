<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <%--headContent.jsp --%>
   <jsp:include page="/WEB-INF/views/include/headContent.jsp"/>
</head>
<body>

     <%--headerMenu.jsp --%>
   <jsp:include page="/WEB-INF/views/include/headerMenu.jsp"/>


    <!--================Hero Banner Area Start =================-->
    <section class="hero-banner d-flex align-items-center">
        <div class="container text-center">
            <h2>Sign In</h2>
            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sign In</li>
                </ol>
            </nav>
        </div>
    </section>
    <!--================Hero Banner Area End =================-->


  <!-- ================ Sign up section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
      


      <div class="row">
       
        <div class="col-lg-8">
          <form class="form-contact contact_form" action="loginPro.hj" method="post" id="contactForm" novalidate="novalidate" name="frm">
            <div class="row">
            	 <div class="col-12">
                <div class="form-group">ID<br>
                  <input class="form-control" name="id" id="id" type="text">
                	
                </div>
              </div>
               <div class="col-12">
                <div class="form-group">Password<br>
                  <input class="form-control" name="passwd" id="name" type="text" >
                </div>
              </div>
              <input type="checkbox" name="keepLogin" value="true">
				로그인 유지
              
              
            </div>
            <div class="form-group mt-3">
              <button type="submit" class="button button-contactForm">Continue</button>
            </div>
          </form>


        </div>

        <div class="col-lg-4">
         
        </div>
      </div>
    </div>
  </section>

  <!-- ================ Sign up section end ================= -->

   <%--footer영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>



<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="js/jquery-2.2.4.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/waypoints.min.js"></script>
<script src="js/mail-script.js"></script>
<!--  script src="js/contact.js"></script-->
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/theme.js"></script>
</body>
</html>