<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WorkConnect | User DashBoard</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

 <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  
  <script>
$(document).ready(function(){
    $(".toast").toast({
    	autohide: false
    });
});
</script>
</head>

<body>
<%@ include file="_header.jsp" %>
<%@ include file="_sidebar.jsp" %>



  <main id="main" class="main">
  
  

<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	%>
	<%
	String uname = (String) session.getAttribute("user-uname");
	%>

	<div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="">Home</a></li>
          <li class="breadcrumb-item">Dashboard</li>
          <li class="breadcrumb-item">Talk with experts</li>
          <li class="breadcrumb-item active">Buy a plan</li>
          
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
    
    <div class="row mb-3">
    
    <!-- Card with titles, buttons, and links -->
    <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Free  $0</h5>
              <h6 class="card-subtitle mb-2 text-muted">FREE ACCESS</h6>
              <p class="card-text"> The Free license allows you to customize, filter various jobs according to your area of interest & provides you the material for Interview Preparation.</p>
              <p class="card-text"><a href="#" class="btn btn-primary disabled">Buy Now</a></p>
              
            </div>
          </div><!-- End Card with titles, buttons, and links -->
      </div>
      
      <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Pro $29 /month</h5>
              <h6 class="card-subtitle mb-2 text-muted">PRO PLAN</h6>
              <p class="card-text"> The Pro license allows you to see your profile views and Job Apply for other cities that are outside your state. It also provides you the Resume review score for your resume. </p>
              <p class="card-text"><a href="#" class="btn btn-primary">Buy Now</a></p>
              
            </div>
          </div><!-- End Card with titles, buttons, and links -->
      </div>
      
      <div class="col-md-4">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Premium $50 /month</h5>
              <h6 class="card-subtitle mb-2 text-muted">PREMIUM PLAN</h6>
              <p class="card-text"> The Premium license allows you to arrange meetings with top intelligent industry experts for your interview preparation & guidance.</p>
              <p class="card-text"><a href="#" class="btn btn-primary">Buy Now</a></p>
              
            </div>
          </div><!-- End Card with titles, buttons, and links -->
      </div>
      
      <hr>
      
      <div class="continue d-flex justify-content-center mt-3">
      <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalDialogScrollable">Continue with Free Trial</a>
      
      <div class="modal fade" id="modalDialogScrollable" tabindex="-1">
                <div class="modal-dialog modal-dialog-scrollable">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Confirm meeting</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <!-- Floating Labels Form -->
              <form class="row g-3">
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="text" class="form-control" id="floatingName" placeholder="Your Name">
                    <label for="floatingName">Your Name</label>
                  </div>
                </div>
                <div class="col-md-12">
                  <div class="form-floating">
                    <input type="email" class="form-control" id="floatingEmail" placeholder="Your Email">
                    <label for="floatingEmail">Your Email</label>
                  </div>
                </div>
                
                <div class="col-12">
                  <div class="form-floating">
                    <textarea class="form-control" placeholder="Address" id="floatingTextarea"
                      style="height: 100px;"></textarea>
                    <label for="floatingTextarea">Address</label>
                  </div>
                </div>
                
                <div class="col-md-12 text-center">
                <a href="#" class="btn btn-primary">Check Available Slots</a>
                
                </div>
                
                 <div class="col-md-6">
                  <label for="inputDate" class="col-sm-2 col-form-label">Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control">
                  </div>
                </div>
                <div class="col-md-6">
                  <label for="inputTime" class="col-sm-2 col-form-label">Time</label>
                  <div class="col-sm-10">
                    <input type="time" class="form-control">
                  </div>
                </div>
               
                
              </form><!-- End floating Labels Form -->
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary">Confirm</button>
                      
                
                    </div>
                  </div>
                </div>
              </div><!-- End Modal Dialog Scrollable-->
      
      
      </div>
                 
                 
	</div>
 
    </section>

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>WorkConnect</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
     
      Designed by <a href="">WorkConnect Team</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/chart.js/chart.umd.js"></script>
  <script src="../assets/vendor/echarts/echarts.min.js"></script>
  <script src="../assets/vendor/quill/quill.min.js"></script>
  <script src="../assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="../assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>
  
  <script src="../assets/css/saber-toast.js"></script>
<script src='./assets/css/script.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
</body>

</html>