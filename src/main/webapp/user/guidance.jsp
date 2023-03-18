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
          <li class="breadcrumb-item active">Talk with experts</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
    
    <div class="row mb-3">
                  <h5>Filter</h5>
                  <label class="col-sm-2 col-form-label">Year of experience</label>
               
                  <div class="col-sm-2">
                    <select class="form-select" aria-label="Default select example" name="jType">
                      <option selected>Select</option>
                      <option value="fullTime">1-3</option>
                      <option value="partTime">4-6</option>
                      <option value="contract">7-9</option>    
            		  <option value="temp">10 or More</option>
                    </select>
                  </div>
                  
                  
                  <label class="col-sm-1 col-form-label">Level</label>
                  <div class="col-sm-2">
                    <select class="form-select" aria-label="Default select example" name="jLoc">
                      <option selected>Select</option>
                      <option value="pune">1</option>
                      <option value="mumbai">2</option>
                      <option value="chennai">3</option>
            		  <option value="bangalore">4</option>
            		  <option value="hyderabad">5</option>
                    </select>
                  </div>
                  
                  <!-- <label class="col-sm-1 col-form-label">Company</label>
                  <div class="col-sm-2">
                    <select class="form-select" aria-label="Default select example" name="jCmp">
                      <option selected>Select</option>
                      <option value="pune">Google</option>
                      <option value="mumbai">Amazon</option>
                      <option value="chennai">Meta</option>
            		  <option value="bangalore">Wipro</option>
            		  <option value="hyderabad">TCS</option>
                    </select>
                  </div> -->
                  
                  <div class="col-sm-2">
               		<button type="button" class="btn btn-primary">Search</button>

                  </div>
     
                  
                  
                  
                  
     <!--              cards in half div -->
     
     <div class="col-md-6 pt-5">

     
     <!-- Card with an image on left -->
          <div class="card mb-3">
            <div class="row g-0">
            
              <div class="col-md-3">
                <img src="../assets/img/messages-1.jpg" class="align-items-center" alt="...">
              </div>
              
              <div class="col-md-7">
                <div class="card-body">
                  <h5 class="card-title">Ms. Leela Loola</h5>
                  <p class="card-text">Clients : 345</p>
                  <p class="card-text">Year of Experience : 3 Years</p>
                  <p class="card-text">Domain : Frontend, Database</p>
                  <div class="d-flex justify-content-center">
                  	<button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#verticalycentered">Message</button>
                  	
                  	<div class="modal fade" id="verticalycentered" tabindex="-1">
                <div class="modal-dialog modal-dialog-centered">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Oops!</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      Looks like you did't have any premium plan! Continue to buy or take a free trial
                      </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                     <!--  <button type="button" class="btn btn-primary">Continue</button> -->
                      <a href="#" class="btn btn-primary">Continue</a>
                    </div>
                  </div>
                </div>
              </div><!-- End Vertically centered Modal-->
                  	<button type="button" class="btn btn-primary m-3">Meeting</button>
                  </div>
                </div>
              </div>
              
              <div class="col-md-2 pt-4"> 
              <button type="button" class="btn btn-primary rounded-pill">Profile</button>
              </div>
              
            </div>
          </div><!-- End Card with an image on left -->
     
     </div>
     
     
     <div class="col-md-6 pt-5">
   
     
     <!-- Card with an image on left -->
          <div class="card mb-3">
            <div class="row g-0">
            
              <div class="col-md-3">
                <img src="../assets/img/messages-1.jpg" class="align-items-center" alt="...">
              </div>
              
              <div class="col-md-7">
                <div class="card-body">
                  <h5 class="card-title">Ms. John</h5>
                  <p class="card-text">Clients : 35</p>
                  <p class="card-text">Year of Experience : 7 Years</p>
                  <p class="card-text">Domain : Backend, Database</p>
                  <div class="d-flex justify-content-center">
                  	<button type="button" class="btn btn-primary m-3"data-bs-toggle="modal" data-bs-target="#verticalycentered">Message</button>
                  	<button type="button" class="btn btn-primary m-3">Meeting</button>
                  </div>
                </div>
              </div>
              
              <div class="col-md-2 pt-4"> 
              <button type="button" class="btn btn-primary rounded-pill">Profile</button>
              </div>
              
            </div>
          </div><!-- End Card with an image on left -->
          
     </div>

          <div class="col-md-6">
   
     
     <!-- Card with an image on left -->
          <div class="card mb-3">
            <div class="row g-0">
            
              <div class="col-md-3">
                <img src="../assets/img/messages-1.jpg" class="align-items-center" alt="...">
              </div>
              
              <div class="col-md-7">
                <div class="card-body">
                  <h5 class="card-title">Ms. Jenny</h5>
                  <p class="card-text">Clients : 225</p>
                  <p class="card-text">Year of Experience : 2 Years</p>
                  <p class="card-text">Domain : Blockchain</p>
                  <div class="d-flex justify-content-center">
                  	<button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#verticalycentered">Message</button>
                  	<button type="button" class="btn btn-primary m-3">Meeting</button>
                  </div>
                </div>
              </div>
              
              <div class="col-md-2 pt-4"> 
              <button type="button" class="btn btn-primary rounded-pill">Profile</button>
              </div>
              
            </div>
          </div><!-- End Card with an image on left -->
          
     </div>
     
     
     <div class="col-md-6">
   
     
    <!-- Card with an image on left -->
          <div class="card mb-3">
            <div class="row g-0">
            
              <div class="col-md-3">
                <img src="../assets/img/messages-1.jpg" class="align-items-center" alt="...">
              </div>
              
              <div class="col-md-7">
                <div class="card-body">
                  <h5 class="card-title">Ms. Saurabh</h5>
                  <p class="card-text">Clients : 35</p>
                  <p class="card-text">Year of Experience : 2 Years</p>
                  <p class="card-text">Domain : Web Developer, Database</p>
                  <div class="d-flex justify-content-center">
                  	<button type="button" class="btn btn-primary m-3" data-bs-toggle="modal" data-bs-target="#verticalycentered">Message</button>
                  	<button type="button" class="btn btn-primary m-3">Meeting</button>
                  </div>
                </div>
              </div>
              
              <div class="col-md-2 pt-4"> 
              <button type="button" class="btn btn-primary rounded-pill">Profile</button>
              </div>
              
            </div>
          </div><!-- End Card with an image on left -->
          
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