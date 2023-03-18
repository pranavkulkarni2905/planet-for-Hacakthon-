<%@page import="com.job.DAO.RecruiterDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>WorkConnect | Job List</title>
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
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="../assets/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="../assets/css/style.css" rel="stylesheet">

<script>
	$(document).ready(function() {
		$(".toast").toast({
			autohide : false
		});
	});
</script>
</head>

<body>
	<%@ include file="_header.jsp"%>
	<%@ include file="_sidebar.jsp"%>

<%
	try{
	ServletContext sc1 = request.getServletContext();
	Recruiter u = (Recruiter) sc1.getAttribute("recruiter-login-success-context");
	if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
	}
%>

	<main id="main" class="main">





		<div class="pagetitle">

			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="recruiter-index.jsp">Home</a></li>
					<li class="breadcrumb-item"><a href="recruiter-index.jsp">Dashboard</a></li>
					<li class="breadcrumb-item active">Posted Jobs</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">
	<div class="row mb-3">
			<%
								RecruiterDAO uu=new RecruiterDAO();
								ResultSet rs=uu.getAllJobsPostedByRecruiter(u.getRecruiterId());
								ResultSet rs2=uu.getRecruitersById(u.getRecruiterId());
								rs2.next();
								while(rs.next()){
									
								
							%>	
					
				<div class="col-md-6 pt-5">


					<!-- Card with an image on left -->
					<div class="card mb-1 ">
						<div class="row g-0">

							<div class="col-md-2">
								<img src="../company-images/<%=rs2.getString(12)%>"
									class="img-fluid rounded-start" alt="...">
							</div>

							<div class="col-md-8">
								<div class="card-body">
									<h5 class="card-title"><%=rs2.getString(5)%></h5>
									<p class="card-text"><%=rs.getString(4)%></p>
									<p class="card-text">
										<span><i class="bx bxs-map"></i></span><span><%=rs.getString(7)%></span>
										<span class="p-1"><i class="bx bx-time"></i></span> <span><%=rs.getString(5)%></span><span
											class="p-1"><i class="bx bxs-calendar"></i></span><span
											class="p-1"><%=rs.getString(9)%></span>
										
								
								<div class="card-btns" style="display:flex; justify-content: space-between;">
								<a href="specific-job-applied-candidates.jsp?id=<%=rs.getInt(1)%>">
									<button type="button" class="btn btn-primary rounded-pill card-btns">All Candidates</button>
								</a>
								
								<a href="most-qulified-candidates.jsp?id=<%=rs.getInt(1)%>">
									<button type="button" class="btn btn-primary rounded-pill card-btns">Most Qualified</button>
								</a>
								</div>
								
								</p>
								</div>
							</div>

					

						</div>
					</div>
					<!-- End Card with an image on left -->

				</div>
				


				<%
				
				
								}
				} catch(Exception e) {

				}
				%>


				<!--              cards in half div -->
		</section>

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer" class="footer">
		<div class="copyright">
			&copy; Copyright <strong><span>WorkConnect</span></strong>. All
			Rights Reserved
		</div>
		<div class="credits">

			Designed by <a href="">WorkConnect Team</a>
		</div>
	</footer>
	<!-- End Footer -->

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

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

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
</body>

</html>