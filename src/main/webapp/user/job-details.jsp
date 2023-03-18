<%@page import="com.job.DAO.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page errorPage="404.jsp" %>
    <%
ServletContext sc1 = request.getServletContext();
User u = (User) sc1.getAttribute("user-login-success-context");
if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
}
%>  
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WorkConnect | Job Details</title>
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

<%

	//int id=1;
	int id=(Integer.parseInt(request.getParameter("id")));
	UserDAO ud=new UserDAO();
	
	ResultSet rs=ud.getJobDetailsByJobId(id);
	rs.next();
	
	ResultSet rsCompany=ud.getCompanyDetails(rs.getInt(2));
	rsCompany.next();

%>

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
          <li class="breadcrumb-item"><a href="job-list.jsp">Job list</a></li>
          <li class="breadcrumb-item active">Job Details</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
    
    <div class="row mb-3">   
     <div class="col-md-7 pt-5">

     
     <div class="card" style="height :21.5rem">
            <div class="card-body">
              <h5 class="card-title">Job Details</h5>

              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered" id="borderedTab" role="tablist">
                <li class="nav-item" role="presentation">
                  <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-home" type="button" role="tab" aria-controls="home" aria-selected="true">Description</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-profile" type="button" role="tab" aria-controls="profile" aria-selected="false">Skills,Eligibility,Responsibilities</button>
                </li>
                <li class="nav-item" role="presentation">
                  <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#bordered-contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Company</button>
                </li>
              </ul>
              <div class="tab-content pt-2" id="borderedTabContent">
                <div class="tab-pane fade show active" id="bordered-home" role="tabpanel" aria-labelledby="home-tab">
                <%=rs.getString(10) %>
                </div>
                <div class="tab-pane fade" id="bordered-profile" role="tabpanel" aria-labelledby="profile-tab">
				<b>Skills :</b><%=rs.getString(11) %>      <br>
				<b>Eligibility: </b><%=rs.getString(13) %>     <br>
				<b>Responsibilities: </b><%=rs.getString(14) %> <br>
				</div>
                <div class="tab-pane fade" id="bordered-contact" role="tabpanel" aria-labelledby="contact-tab">
				<%=rsCompany.getString(13) %>            
		    </div>
              </div><!-- End Bordered Tabs -->
              
              
              <!-- <button type="button" class="align-self-end btn btn-primary">Apply Now</button> -->
<div class="position-absolute bottom-0 start-50 translate-middle-x">
  <a href="job-apply.jsp?jobid=<%=id %>&userid=<%= u.getUser_id()%>&recid=<%=rs.getInt(2) %>" class="btn btn-primary">Apply Now</a>
</div>

            </div>
          </div>
     
     </div>
     
     
     <div class="offset col-md-4 pt-5">
   
     
     <!-- Default Card -->
          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Job Summary</h5>
              
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Published On: <%=rs.getString(12) %></p>
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Vacancy: <%=rs.getString(6) %></p>
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Job Nature: <%=rs.getString(5) %></p>
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Salary: <%=rs.getString(8) %></p>
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Location: <%=rs.getString(7) %></p>
              <p class="card-text"><span><i class="ri-arrow-drop-right-line"></i></span> Deadline: <%=rs.getString(9) %></p>

            </div>
          </div><!-- End Default Card -->
          
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