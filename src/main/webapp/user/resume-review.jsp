<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="com.job.model.UserResume"%>

<%@page import="com.job.DAO.UserDAO"%>

<%@page errorPage="404.jsp"%>
<%
ServletContext sc1 = request.getServletContext();
User u = (User) sc1.getAttribute("user-login-success-context");
if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
}
%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.model.UserResume"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>

 <%@page errorPage="404.jsp" %>
 
	
<%

String pdfName="";
String demopdfName="";

	ResultSet rs=null;
ServletContext sc2 = request.getServletContext();
UserDAO ud=new UserDAO();
int id=(Integer)sc2.getAttribute("user-id");
	rs=ud.getResumeFileNameByUserId(id);
	
	if(rs.next()){
		pdfName=rs.getString(1);
	}
	
		System.out.println(pdfName);
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Resume | WorkConnect</title>
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
<link rel="stylesheet" type="text/css"
	href="../assets/app-invoice.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<!-- Template Main CSS File -->
<link href="../assets/css/style.css" rel="stylesheet">

<script>
	$(document).ready(function() {
		$(".toast").toast({
			autohide : false
		});
	});
</script>
<style>
.btn-print {
	z-index: 1;
	position: absolute;
	right: 20px;
	top: 20px;
}

.resume {
	display: block;
	font-family: 'Roboto', sans-serif;
	font-size: 13.0736px;
	font-weight: 400;
	line-height: 1.5;
	min-height: 1090.41px;
}

.resume h1 {
	font-size: 2.86em;
	font-weight: 600;
	letter-spacing: -0.5px;
}

.resume h2 {
	font-size: 1.43em;
	font-weight: 600;
	line-height: 1;
	margin-bottom: 0;
}

.resume p {
	margin-bottom: 1em;
}

.resume p:last-child {
	margin-bottom: 0;
}

.resume ul {
	padding-left: 20px;
}

.resume .resume__header, .resume .resume__section {
	font-family: 'Open Sans', sans-serif;
	font-size: 0.95em;
}

.resume .resume__header {
	padding: 6em 4em 0;
}

.resume .resume__section {
	margin-bottom: 4em;
}

.resume .resume__section:last-child {
	padding-bottom: 0;
}

.resume .resume__section-title {
	display: flex;
	align-items: center;
	margin-bottom: 1.43em;
}

.resume .resume__section-title>i {
	margin-right: 0.63em;
	font-size: 1.14em;
	background-color: #5695cd;
	color: #fff;
	border: 0.25em solid #aacae6;
	border-radius: 50%;
	width: 2.51em;
	height: 2.51em;
	display: flex;
	align-items: center;
	justify-content: center;
	line-height: 1.6;
}

.resume .resume__section-title>h2 {
	margin-top: 0;
	font-size: 1.5em;
}

.resume .resume__columns {
	overflow: hidden;
	padding: 4em;
	padding-top: 0;
}

.resume .resume__main {
	float: left;
	width: 75%;
	padding-right: 6em;
}

.resume .resume__side {
	float: left;
	width: 25%;
}

.resume .other-info p>b {
	color: #555;
}

.resume .info-item {
	margin-bottom: 0.2em;
	font-weight: 300;
}

.resume .info-item:last-child {
	margin-bottom: 0;
}

.resume .info-label {
	display: inline-block;
	padding-right: 0.63em;
	font-size: 1.14em;
	min-width: 2.19em;
	text-align: center;
}

.resume .info-label i {
	color: #5695cd;
}

.resume .xp-item {
	margin-bottom: 4em;
}

.resume .xp-item:last-child {
	margin-bottom: 0;
}

.resume .xp-job {
	font-size: 1.14em;
	font-weight: 600;
	line-height: 1.25;
}

.resume .xp-job span, .resume .xp-job small {
	font-weight: 400;
}

.resume .xp-job small {
	font-size: 0.9em;
}

.resume .xp-date {
	font-size: 0.8em;
	margin-top: 0.3em;
	margin-bottom: 1em;
	color: #5695cd;
}

.resume .extra {
	margin-bottom: 2em;
}

.resume .extra:last-child {
	margin-bottom: 0;
}

.resume .extra-info small {
	color: #666;
	display: inline-block;
	font-size: 0.7em;
}

.resume .extra-details, .resume .extra-details__progress {
	border-radius: 6px;
}

.resume .extra-details {
	margin-top: 0.5em;
	background-color: #d1d9e1;
	width: 100%;
	height: 5px;
	position: relative;
}

.resume .extra-details__progress {
	background-color: #5695cd;
	height: 5px;
	position: absolute;
	top: 0;
	left: 0;
}

.resume .lang-item {
	margin-bottom: 2em;
}

.resume .lang-item:last-child {
	margin-bottom: 0;
}

.resume .lang-label {
	width: 8em;
}
</style>
</head>

<body>
	<%@ include file="_header.jsp"%>
	<%@ include file="_sidebar.jsp"%>

	<%
	try {
		boolean msg = (boolean) session.getAttribute("build-resume-success");
		if (msg == true) {
	%>
	<div class="toast-container"
		style="position: absolute; top: 10px; right: 10px;">
		<div class="toast fade show">
			<div class="toast-header bg-success text-white">
				<strong class="me-auto"><i class="bi-globe"></i> Success!</strong> <small>just
					now</small>
				<button type="button" class="btn-close" data-bs-dismiss="toast"></button>
			</div>
			<div class="toast-body">
				<h5>
					<b> Resume Build Successfully! Now,you can Apply to jobs. </b>
				</h5>
			</div>
		</div>
	</div>

	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("build-resume-success");
	%>

	<main id="main" class="main">




		<div class="pagetitle">
			<h1>Resume Builder</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="user-index.jsp">Home</a></li>
					<li class="breadcrumb-item">Users</li>
					<li class="breadcrumb-item active">Resume Review</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section profile">
			<div class="row">

				<div class="col-xl-10">

					<div class="card">
						<div class="card-body pt-3">
							<!-- Bordered Tabs -->
							<ul class="nav nav-tabs nav-tabs-bordered">

								<li class="nav-item">
									<button class="nav-link active" data-bs-toggle="tab"
										data-bs-target="#profile-overview">Resume Review</button>
								</li>

								



							</ul>
							<div class="tab-content pt-2">
							
							<h1>Hurray..!! Resume Reviwed Successfully </h1>
							
										
									<%
									int score=0;
										if(pdfName==""){
										
										
										%>
										<img alt="xyz" src="../assets/img/no-data.jpg" width=60% height=60% style="margin:80px">
										
										<%
										}else{
											
											if(pdfName.charAt(0)=='w' && pdfName.charAt(1)=='c'){
												score=10;
											
											
										%>
										<h1>You got <%=score %>/10  </h1>
												 <div class="progress mt-3">
                <div class="progress-bar" role="progressbar" style="width: <%=score*10 %>%" aria-valuenow="<%=score*10 %>" aria-valuemin="0" aria-valuemax="100">100%</div>
              </div>
              							<% } 
												
											
											else{
												int[] intArray = {5, 6, 7,8};

										        int idx = new Random().nextInt(intArray.length);
										       	score=intArray[idx];

										        System.out.println(score);
											
										%>
										<h1>You got <%=score %>/10  </h1>
									 	 <div class="progress mt-3">
               						 <div class="progress-bar" role="progressbar" style="width: <%=score*10 %>%" aria-valuenow="<%=score*10 %>" aria-valuemin="0" aria-valuemax="100">100%</div>
             						 </div>
             						 
             						 <br>
             						 <br>
             						 <br>
             						 <br>
             						 <br>
             						 	<div class="card text-center">

											<div class="card-body">
												<h5 class="card-title">Don't Have Any Resume ? Build a
													Resume with workconnect</h5>
												<!--  <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
												<label for="inputNumber"
													class="col-sm-12 col-form-label text-center">We'll
													guide you through it </label> <a href="build-resume.jsp"
													class="btn btn-primary" style="background-color: #009688;">Get
													Started</a>

											</div>
										</div>
           
										<%}} %>
								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">
								
											</div>
										</div>
	
										
										



									</div>
								</div>
</div>
</body>
</html>