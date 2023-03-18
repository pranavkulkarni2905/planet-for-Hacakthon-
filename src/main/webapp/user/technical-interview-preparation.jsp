<%@page import="com.job.DAO.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp" %>
     <%

%>  
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

   <style>
      .container {
        font-size: 5em;
        background-color: #a8a8a8;
        color: white;
        width: 8em;
        height: 2em;
        line-height: 2;
        text-align: center;
        font-family: Helvetica, Arial, sans-serif;
        font-weight: bold;
        cursor: pointer;
        position: relative;
      }
      .link {
        position: absolute;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: 1;
      }
    </style>
</head>

<body>
<%@ include file="_header.jsp" %>
<%@ include file="_sidebar.jsp" %>


<%

String userSkills="";

	ResultSet rs=null;
ServletContext sc2 = request.getServletContext();
UserDAO ud=new UserDAO();
int id=(Integer)sc2.getAttribute("user-id");
	rs=ud.getSkillByUserId(id);
	
	if(rs.next()){
		userSkills=rs.getString(1);
	}
	
		System.out.println(userSkills);
%>
  <main id="main" class="main">


      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="">Home</a></li>
          <li class="breadcrumb-item active">technical-interview-preparation</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->
<section class="section dashboard">
    
              <div class="card">
            <div class="card-body">
              <!-- <h5 class="card-title">Best Learning Resources for you</h5>
 -->
              <!-- Bordered Tabs Justified -->
              <ul class="nav nav-tabs nav-tabs-bordered d-flex pt-3" id="borderedTabJustified" role="tablist">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="true">Youtube Resources [Based on Skills]</button>
                </li>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade show active" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
                
                
                   <div class="card">
            <div class="card-body">
             <!--  <h5 class="card-title">Pills Tabs</h5> -->

              <!-- Pills Tabs -->
              <ul class="nav nav-pills mb-3 justify-content-center mt-2" id="pills-tab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">Your Skills :<%=userSkills %></button>
                </li>
             
                
              </ul>
              <div class="tab-content pt-2" id="myTabContent">
                <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="home-tab">
            
         <div class="row">  
                <!-- Card with an image on left -->
          <!-- <div class="card col-md-6">
            <div class="row g-0">
              <div class="col-md-4">
                <img src="../assets/img/dsa.jpg" class="img-fluid rounded-start mt-3" alt="...">
              </div>
              <div class="col-md-8">
                <div class="card-body">
                  <h5 class="card-title">Card with an image on left</h5>
                  <p class="card-text">Software Developer</p>
                </div>
              </div>
            </div> -->
         <!--  </div> --><!-- End Card with an image on left -->
          
          
<iframe width="560" height="815" src="https://techdevguide.withgoogle.com/paths/interview/" ></iframe>

       
       
       
       
       </div>  
         </div>
         </div>
         </div>
  
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

</body>

</html>