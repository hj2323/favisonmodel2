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
            <h2>Write</h2>
            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Blog Details</li>
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
          <form class="form-contact contact_form" action="writePro.hj" method="post" enctype="multipart/form-data">
            <div class="row">
            	
               
                 
              </div>
               <div class="col-12">
                <div class="form-group">Name<br>
                  <input class="form-control" name="name" id="name" type="text" placeholder="Enter your name">
                </div>
              </div>
               <div class="col-sm-6">
                <div class="form-group">Password<br>
                  <input class="form-control" name="passwd" id="pass1" type="password" placeholder="Enter your password" required >
                </div>
              </div>

              <div class="col-12">
                <div class="form-group">subject
                  <input class="form-control" name="subject" id="subject" type="text" placeholder="Enter Subject">
                </div>
              </div>
              <div class="col-12">
                <div class="form-group">content
                    <textarea class="form-control w-100" name="content" id="content" cols="30" rows="9" placeholder="Enter content"></textarea>
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">file<br>
                  <input class="form-control" name="filename" id="address" type="file">
                </div>
              </div>
              
              
              
            </div>
            


        </div>

        <div class="col-lg-4">
         <div class="form-group mt-3">
              <button type="submit" class="button button-contactForm">Write</button>
               <button type="button" class="button button-contactForm" onclick="location.href='blog.jsp'">List</button>
            </div>
          </form>
        </div>
      </div>
    </div>
 
  
  
  
</section>
<!--================Blog Area end =================-->
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
<script src="js/contact.js"></script>
<script src="js/jquery.form.js"></script>
<script src="js/jquery.validate.min.js"></script>
<script src="js/mail-script.js"></script>
<script src="js/theme.js"></script>
</body>
</html>