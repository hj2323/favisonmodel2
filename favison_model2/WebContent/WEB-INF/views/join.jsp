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
            <h2>Sign Up</h2>
            <nav aria-label="breadcrumb" class="banner-breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sign Up</li>
                </ol>
            </nav>
        </div>
    </section>
    <!--================Hero Banner Area End =================-->


  <!-- ================ Sign up section start ================= -->
  <section class="contact-section area-padding">
    <div class="container">
      


      <div class="row">
        <div class="col-12">
          <h2 class="contact-title">Type your info</h2>
        </div>
        <div class="col-lg-8">
          <form class="form-contact contact_form" action="joinPro.hj" method="post" id="contactForm" novalidate="novalidate" name="frm" onsubmit="return checkId();">
            <div class="row">
            	 <div class="col-12">
                <div class="form-group">ID<br>
                  <input class="form-control" name="id" id="id" type="text" placeholder="Enter your id" required>
                	<input type="button"  class="button button-contactForm" value="double check" class="dup" onclick="winopen()">
                
                </div>
                
                 
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
               <div class="col-sm-6">
                <div class="form-group">Retype Password<br>
                  <input class="form-control"  id="pass2" type="password" onkeyup="checkPasswd()" placeholder="verify your password" required>
                	 <span id="messagePasswd"></span>
                </div>
              </div>
               <div class="col-12">
                <div class="form-group">Email<br>
                  <input class="form-control" name="email" id="email" type="email" placeholder="Enter email address">
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">Address<br>
                  <input class="form-control" name="address" id="address" type="text" placeholder="Enter your address">
                </div>
              </div>
              
              <div class="col-12">
                <div class="form-group">Phone number<br>
                  <input class="form-control" name="tel" id="tel" type="text" placeholder="Enter your phone number">
                </div>
              </div>
               <div class="col-12">
                <div class="form-group">Gender<br>
                 <input type="radio"  name="gender" value="male" required>male&nbsp;&nbsp;
				<input type="radio" name="gender" value="female" required>female
                </div>
              </div>
              
            </div>
            <div class="form-group mt-3">
              <button type="submit" class="button button-contactForm">Create your account</button>
            </div>
          </form>


        </div>

        <div class="col-lg-4">
         
        </div>
      </div>
    </div>
  </section>
  <script>
  function winopen(){
	  let id = document.frm.id.value;
	  
	  if(id == ''){
		  alert('type your id first and check if its available');
		  document.frm.id.focus();
		  return;
	  }
	  
	  open('joinIdDbCheck.hj?id='+id, 'dbCheck', 'width=500, height=400');
  }//winopen
  
  let pass1 = document.getElementById('pass1');
  let pass2 = document.getElementById('pass2');
  let spanPasswd = document.getElementById('messagePasswd');
  
  function checkPasswd(){
	  if(pass1.value==pass2.value){
		  spanPasswd.innerHTML = 'verified';
		  spanPasswd.style.color = 'green';
	  }else{
		  spanPasswd.innerHTML = 'wrong!';
		  spanPasswd.style.color = 'red';
	  }
  }//checkPasswd
  
  function checkId(){
		let id = frm.id.value.trim();//공백 제거하기
		if (!(id.length >= 3 && id.length <= 12)){
			alert('아이디 글자수는 3개 이상 12개 이하만 가능합니다.');
			frm.id.select();
			return false;
		}
		//return true;
	}//checkId
  
  </script>
  <!-- ================ Sign up section end ================= -->

   <%--footer영역 --%>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>


<!--================Contact Success and Error message Area =================-->
    <div id="success" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fas fa-times"></i>
                    </button>
                    <h2>Thank you</h2>
                    <p>Your message is successfully sent...</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals error -->

    <div id="error" class="modal modal-message fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <i class="fas fa-times"></i>
                    </button>
                    <h2>Sorry !</h2>
                    <p> Something went wrong </p>
                </div>
            </div>
        </div>
    </div>
    <!--================End Contact Success and Error message Area =================-->




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