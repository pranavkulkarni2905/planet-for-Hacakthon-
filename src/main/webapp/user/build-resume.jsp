<%@page import="com.job.model.UserResume"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	ServletContext sc2 = request.getServletContext();
	UserDAO ad1 = new UserDAO();
	int id = (Integer) sc2.getAttribute("user-id");
	User us = ad1.getUserDataById(id);
	UserResume ur = ad1.getUserResumeDataById(id);
	%>
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
					<li class="breadcrumb-item active">Resume</li>
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
										data-bs-target="#profile-overview">Overview</button>
								</li>

								<li class="nav-item">
									<button class="nav-link" data-bs-toggle="tab"
										data-bs-target="#profile-edit">Edit Profile</button>
								</li>



							</ul>
							<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">
									<%
									if (ur.getLocation() == null || ur.getCity() == null || ur.getState() == null || ur.getCountry() == null
											|| ur.getPincode() == null || ur.getEduactionTitle1() == null || ur.getEducationFromYear1() == null
											|| ur.getEducationToYear1() == null || ur.getEducationDesctiption1() == null || ur.getLanguages() == null
											|| ur.getSkills() == null || ur.getProjectTitle1() == null || ur.getProjectFromYear1() == null
											|| ur.getProjectToYear1() == null || ur.getProjectUrl1() == null || ur.getProjectDescription1() == null) {
									%>
									<h2 style="color: red">**The page you are looking for
										doesn't exist.Complete Your Profile and Build Resume</h2>
									<img src="../user-images/not.webp" class="img-fluid py-5"
										alt="Page Not Found">
									<%
									} else {
									%>
									<div id="invoice">
									<div  class="sheet">
										<button class="btn btn-print btn-sm btn-light"
											onClick="handlePrint()">
											<i class="fa fa-print"></i>

											<div class="invoice-action-btn">
												<button  class="btn btn-primary" id="download"><i class="fa fa-download"></i> Download</button>
											</div>
										</button>
										<div class="two-column resume">
											<section class="resume__section resume__header">
												<div class="resume__content">

													<h1><%=us.getFirst_name() + " " + us.getLast_name()%></h1>
													<div class="info-item">
														<h6 class="info-text">
															<i class="bi ri-user-location-fill"></i>
															<%=ur.getLocation() + ", " + ur.getCity() + ", " + ur.getState() + ", " + ur.getCountry()%>,
															Pincode:
															<%=ur.getPincode()%></h6>
													</div>
													<div class="info-item">
														<h6 class="info-text">
															<i class="bi-envelope"></i>
															<%=us.getEmail_id()%></h6>
													</div>
													<div class="info-item">
														<h6 class="info-text">
															<i class="bi-phone"></i> +91
															<%=us.getPhon_no()%></h6>
													</div>
												</div>
											</section>
											<div class="resume__columns">
												<div class="resume__main">
													<section class="resume__section resume__summary">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-pencil-square-o"></i>
																<h2>Education Details</h2>
															</div>
															<div class="other">
																<div class="other-info">
																	<h2>
																		<b><%=ur.getEduactionTitle1()%></b>
																	</h2>
																	<hr>
																	<small><strong>From :</strong><%=ur.getEducationFromYear1()%>
																		- <strong>To :</strong><%=ur.getEducationToYear1()%></small> <br>
																	<br>
																	<p>
																		<%=ur.getEducationDesctiption1()%>
																	</p>
																	<%
																	String eduTitle2 = ur.getEduactionTitle2();
																	String eduTitle3 = ur.getEduactionTitle3();

																	if (eduTitle2 != null) {
																	%>
																	<h2>
																		<b><%=ur.getEduactionTitle2()%></b>
																	</h2>
																	<hr>
																	<small><strong>From :</strong><%=ur.getEducationFromYear2()%>
																		- <strong>To :</strong><%=ur.getEducationToYear2()%></small> <br>
																	<br>
																	<p>
																		<%=ur.getEducationDescription2()%>
																	</p>
																	<%
																	}
																	%>
																	<%
																	if (eduTitle3 != null) {
																	%>
																	<h2>
																		<b><%=ur.getEduactionTitle3()%></b>
																	</h2>
																	<hr>
																	<small><strong>From :</strong><%=ur.getEducationFromYear3()%>
																		- <strong>To :</strong><%=ur.getEducationToYear3()%></small> <br>
																	<br>
																	<p>
																		<%=ur.getEducationDescription3()%>
																	</p>
																	<%
																	}
																	%>
																</div>
															</div>
														</div>
													</section>
													<section class="resume__section resume__experience">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-briefcase"></i>
																<h2>Employment History (InternShips)</h2>
															</div>
															<div class="xp-item">
																<div class="xp-job">
																	<b><%=ur.getJobTitle()%> </b> <br /> <small>@
																		<%=ur.getJobLocation()%></small>
																</div>
																<br> <small><strong>From :</strong><%=ur.getJobFromYear()%>
																	- <strong>To :</strong><%=ur.getJobToYear()%></small><br>
																<br>
																<div class="xp-detail">

																	<i>Description :</i>
																	<%=ur.getJobDescription()%>
																</div>
															</div>

														</div>
													</section>
													<section class="resume__section resume__summary">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-pencil-square-o"></i>
																<h2>Project Details</h2>
															</div>
															<div class="other">
																<div class="other-info">
																	<h2>
																		<b><%=ur.getProjectTitle1()%></b> <a
																			href="<%=ur.getProjectUrl1()%>" target="_blank"><small>[
																				Project Demo ]</small></a>
																	</h2>
																	<hr>
																	<small><strong>From :</strong><%=ur.getProjectFromYear1()%>
																		- <strong>To :</strong><%=ur.getProjectToYear1()%></small> <br>
																	<br>
																	<p>
																		<%=ur.getProjectDescription1()%>
																	</p>
																	<%
																	String prjTitle2 = ur.getProjectTitle2();
																	//String eduTitle3 = ur.getEduactionTitle3();

																	if (prjTitle2 != null) {
																	%>
																	<h2>
																		<b><%=ur.getProjectTitle2()%></b> <a
																			href="<%=ur.getProjectUrl2()%>" target="_blank"><small>[
																				Project Demo]</small></a>
																	</h2>
																	<hr>
																	<small><strong>From :</strong><%=ur.getProjectFromYear2()%>
																		- <strong>To :</strong><%=ur.getProjectToYear2()%></small> <br>
																	<br>
																	<p>
																		<%=ur.getProjectDescription2()%>
																	</p>
																	<%
																	}
																	%>

																</div>
															</div>
														</div>
													</section>

												</div>

												<div class="resume__side">
													<section class="resume__section resume__skills">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-align-center"></i>
																<h2>Professional Summary</h2>
															</div>
															<div class="resume__text">
																<div class="extra">
																	<%=us.getAbout()%>

																</div>

															</div>
														</div>
													</section>
													<section class="resume__section resume__skills">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-align-center"></i>
																<h2>Skills</h2>
															</div>
															<div class="resume__text">
																<div class="extra">

																	<%
																	String str = ur.getSkills();
																	String[] words = str.split(" ");

																	for (String word : words) {
																	%>
																	<div class="extra-info"><%=word%><br /> <br>
																		<hr>
																	</div>

																	<%
																	}
																	%>
																</div>

															</div>
														</div>
													</section>
													<section class="resume__section resume__languages">
														<div class="resume__content">
															<div class="resume__section-title">
																<i class="fa fa-globe"></i>
																<h2>Languages</h2>
															</div>
															<div class="extra">
																<%
																String str2 = ur.getLanguages();
																String[] words2 = str2.split(" ");

																for (String word2 : words2) {
																%>
																<div class="extra-info"><%=word2%><br> <br>
																	<hr>
																</div>
																<%
																}
																%>


															</div>

														</div>
													</section>
												</div>
												<%
												}
												%>
											</div>
										</div>




									</div>
								</div>
</div>

								<div class="tab-pane fade profile-edit pt-3" id="profile-edit">
									<div class="card">
										<div class="card-body">
											<!-- Profile Edit Form -->
											<form class="row g-3 needs-validation"
												action="../UserBuildResumeController" method="post"
												novalidate>





												<h5 class="card-title">Address Details</h5>


												<div class="col-md-6">
													<label for="inputEmail5" class="form-label">Address</label>
													<input type="text" value="<%=ur.getLocation()%>"
														name="address" class="form-control" id="inputEmail5">
												</div>
												<div class="col-md-6">
													<label for="inputPassword5" class="form-label">Country</label>
													<input type="text" value="<%=ur.getCountry()%>"
														name="country" class="form-control" id="inputPassword5">
												</div>


												<div class="col-md-6">
													<label for="inputCity" class="form-label">City</label> <input
														type="text" name="city" value="<%=ur.getCity()%>"
														class="form-control" id="inputCity">
												</div>
												<div class="col-md-4">
													<label for="inputState" class="form-label">State</label> <select
														id="inputState" name="state" class="form-select">
														<option value="<%=ur.getState()%>" selected>Choose...</option>
														<option value="Maharashtra">Maharashtra</option>
														<option value="Gujrat">Gujrat</option>
														<option>...</option>
													</select>
												</div>
												<div class="col-md-2">
													<label for="inputZip" class="form-label">Zip</label> <input
														type="text" value="<%=ur.getPincode()%>" name="pincode"
														class="form-control" id="inputZip">
												</div>

												<hr>

												<h5 class="card-title">Skills & Languages</h5>


												<div class="col-md-6">
													<label for="inputEmail5" class="form-label">Skills</label>
													<input type="text" value="<%=ur.getSkills()%>"
														name="skills" class="form-control" id="inputEmail5">
												</div>
												<div class="col-md-6">
													<label for="inputPassword5" class="form-label">Languages</label>
													<input type="text" name="languages"
														value="<%=ur.getLanguages()%>" class="form-control"
														id="inputPassword5">
												</div>


												<hr>




												<h5 class="card-title">Education Details</h5>

												<div class="col-md-6">
													<label for="inputCity" class="form-label">School/College
														Name</label> <input type="text" name="education_title1"
														value="<%=ur.getEduactionTitle1()%>" class="form-control"
														id="inputCity">
												</div>
												<div class="col-md-3">
													<label for="inputState" class="form-label">From</label> <input
														type="date" name="education_from_date1"
														value="<%=ur.getEducationFromYear1()%>"
														class="form-control" id="inputZip">
												</div>
												<div class="col-md-3">
													<label for="inputZip" class="form-label">To</label> <input
														type="date" name="education_to_date1"
														value="<%=ur.getEducationToYear1()%>" class="form-control"
														id="inputZip">
												</div>

												<div class="col-md-8">
													<label for="inputPassword5" class="form-label">Description</label>
													<textarea type="text" name="education_description1"
														class="form-control" id="inputPassword5"><%=ur.getEducationDesctiption1()%></textarea>
												</div>






												<div class="option">
													<input type="checkbox" id="toggle1" class="toggle" />    
													<label class="title" for="toggle1">Add Education 2</label>
													<div class="content">
														<div class="card">
															<div class="card-body">
																<br>
																<div class="row">
																	<div class="col-md-6">
																		<label for="inputCity" class="form-label">School/College
																			Name</label> <input type="text" name="education_title2"
																			value="<%=ur.getEduactionTitle2()%>"
																			class="form-control" id="inputCity">
																	</div>
																	<div class="col-md-3">
																		<label for="inputState" class="form-label">From</label>
																		<input type="date" name="education_from_date2"
																			value="<%=ur.getEducationFromYear2()%>"
																			class="form-control" id="inputZip">
																	</div>
																	<div class="col-md-3">
																		<label for="inputZip" class="form-label">To</label> <input
																			type="date" name="education_to_date2"
																			value="<%=ur.getEducationToYear2()%>"
																			class="form-control" id="inputZip">
																	</div>
																</div>
																<div class="col-md-8">
																	<label for="inputPassword5" class="form-label">Description</label>
																	<textarea type="text" name="education_description2"
																		class="form-control" id="inputPassword5"><%=ur.getEducationDescription2()%></textarea>
																</div>

															</div>
														</div>
														<br> <br>
													</div>
												</div>

												<div class="option">
													<input type="checkbox" id="toggle2" class="toggle">
													    <label class="title" for="toggle2">Add
														Education 3 </label>
													<div class="content">

														<div class="card">
															<div class="card-body">
																<br>
																<div class="row">
																	<div class="col-md-6">
																		<label for="inputCity" class="form-label">School/College
																			Name</label> <input type="text" name="education_title3"
																			value="<%=ur.getEduactionTitle3()%>"
																			class="form-control" id="inputCity">
																	</div>
																	<div class="col-md-3">
																		<label for="inputState" class="form-label">From</label>
																		<input type="date" name="education_from_date3"
																			value="<%=ur.getEducationFromYear3()%>"
																			class="form-control" id="inputZip">
																	</div>
																	<div class="col-md-3">
																		<label for="inputZip" class="form-label">To</label> <input
																			type="date" name="education_to_date3"
																			value="<%=ur.getEducationToYear3()%>"
																			class="form-control" id="inputZip">
																	</div>
																</div>
																<div class="col-md-8">
																	<label for="inputPassword5" class="form-label">Description</label>
																	<textarea type="text" name="education_description3"
																		class="form-control" id="inputPassword5"><%=ur.getEducationDescription3()%></textarea>
																</div>

															</div>
														</div>
														<br> <br>
													</div>
												</div>

												<hr>

												<h5 class="card-title">Work Experience /InternShip
													Details</h5>


												<div class="col-md-6">
													<label for="inputEmail5" class="form-label">Job
														Title</label> <input type="text" value="<%=ur.getJobTitle()%>"
														name="job_title" class="form-control" id="inputEmail5">
												</div>
												<div class="col-md-6">
													<label for="inputState" class="form-label">Job
														Location</label> <input type="text" name="job_location"
														value="<%=ur.getJobLocation()%>" class="form-control"
														id="inputCity">
												</div>
												<div class="col-md-6">
													<label for="inputPassword5" class="form-label">From</label>
													<input type="date" value="<%=ur.getJobFromYear()%>"
														name="job_from_date" class="form-control"
														id="inputPassword5">
												</div>


												<div class="col-md-6">
													<label for="inputCity" class="form-label">To</label> <input
														type="date" name="job_to_date"
														value="<%=ur.getJobToYear()%>" class="form-control"
														id="inputCity">
												</div>

												<div class="col-md-8">
													<label for="inputZip" class="form-label">Description</label>
													<textarea type="text" name="job_description"
														class="form-control" id="inputZip"><%=ur.getJobDescription()%></textarea>
												</div>




												<hr>
												<h5 class="card-title">Project Details</h5>


												<div class="col-md-6">
													<label for="inputEmail5" class="form-label">Project
														Title</label> <input type="text"
														value="<%=ur.getProjectTitle1()%>" name="project_title1"
														class="form-control" id="inputEmail5">
												</div>
												<div class="col-md-6">
													<label for="inputState" class="form-label">Project
														URL</label> <input type="url" name="project_url1"
														value="<%=ur.getProjectUrl1()%>" class="form-control"
														id="inputCity">
												</div>
												<div class="col-md-6">
													<label for="inputPassword5" class="form-label">From</label>
													<input type="date" value="<%=ur.getProjectFromYear1()%>"
														name="project_from_date1" class="form-control"
														id="inputPassword5">
												</div>


												<div class="col-md-6">
													<label for="inputCity" class="form-label">To</label> <input
														type="date" name="project_to_date1"
														value="<%=ur.getProjectToYear1()%>" class="form-control"
														id="inputCity">
												</div>

												<div class="col-md-8">
													<label for="inputZip" class="form-label">Description</label>
													<textarea type="text" name="project_description1"
														class="form-control" id="inputZip"><%=ur.getProjectDescription1()%></textarea>
												</div>





												<div class="option">
													<input type="checkbox" id="toggle5" class="toggle" />    
													<label class="title" for="toggle5">Project 2
														details</label>
													<div class="content">
														<div class="card">
															<div class="card-body">
																<br>
																<div class="row">
																	<div class="col-md-6">
																		<label for="inputEmail5" class="form-label">Project
																			Title</label> <input type="text"
																			value="<%=ur.getProjectTitle2()%>"
																			name="project_title2" class="form-control"
																			id="inputEmail5">
																	</div>
																	<div class="col-md-6">
																		<label for="inputState" class="form-label">Project
																			URL</label> <input type="url" name="project_url2"
																			value="<%=ur.getProjectUrl2()%>" class="form-control"
																			id="inputCity">
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-6">
																		<label for="inputPassword5" class="form-label">From</label>
																		<input type="date"
																			value="<%=ur.getProjectFromYear2()%>"
																			name="project_from_date2" class="form-control"
																			id="inputPassword5">
																	</div>


																	<div class="col-md-6">
																		<label for="inputCity" class="form-label">To</label> <input
																			type="date" name="project_to_date2"
																			value="<%=ur.getProjectToYear2()%>"
																			class="form-control" id="inputCity">
																	</div>
																</div>
																<div class="col-md-8">
																	<label for="inputZip" class="form-label">Description</label>
																	<textarea type="text" name="project_description2"
																		class="form-control" id="inputZip"><%=ur.getProjectDescription2()%></textarea>
																</div>
															</div>
														</div>
														<br> <br>
													</div>
												</div>


												<br>
												<div class="col-12">
													<button class="btn btn-primary" type="submit">Create
														Resume</button>
												</div>

												<!-- End Profile Edit Form -->




											</form>
											<!-- End Profile Edit Form -->
										</div>
									</div>
								</div>



							</div>
							<!-- End Bordered Tabs -->

						</div>
					</div>

				</div>
			</div>
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
		
		<script type="text/javascript">
window.onload = function () {
    document.getElementById("download")
        .addEventListener("click", () => {
            const invoice = this.document.getElementById("invoice");
            console.log(invoice);
            console.log(window);
            var opt = {
                margin: 1,
                filename: 'Resume.pdf',
                image: { type: 'jpeg', quality: 1 },
                html2canvas: { scale: 2 },
                jsPDF: { unit: 'in', format: 'letter', orientation: 'portrait' }
            };
            html2pdf().from(invoice).set(opt).save();
        })
}
</script>  

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
	<script src="../assets/app-invoice.min.js"></script>
</body>

</html>