<%@page import="com.job.model.Recruiter"%>
<%@page import="com.job.model.UserResume"%>
<%@page import="com.job.model.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
ServletContext sc1 = request.getServletContext();
Recruiter u = (Recruiter) sc1.getAttribute("recruiter-login-success-context");
if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>WorkConnect Users</title>
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

<!-- <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<link
	href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap.min.css"
	rel="stylesheet">


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
	<%

UserDAO ad1 = new UserDAO();
int id = Integer.parseInt(request.getParameter("userid"));
User us = ad1.getUserDataById(id);
UserResume ur = ad1.getUserResumeDataById(id);
%>
<main id="main" class="main">




		

		<section class="section profile">
			<div class="row">

				<div class="col-xl-10">

					<div class="card">
						<div class="card-body pt-3">
													<div class="tab-content pt-2">

								<div class="tab-pane fade show active profile-overview"
									id="profile-overview">
									
									
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
										</div>




									</div>
								</div>
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

	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>



</body>

</html>