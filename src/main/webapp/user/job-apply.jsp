<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.model.UserResume"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
 <%@page errorPage="404.jsp" %>
 <%
	ServletContext sc2 = request.getServletContext();
	UserDAO ad1 = new UserDAO();
	//int id = (Integer) sc2.getAttribute("user-id");
	int jobid = Integer.parseInt(request.getParameter("jobid"));
	int userid = Integer.parseInt(request.getParameter("userid"));
	int recid = Integer.parseInt(request.getParameter("recid"));
	//int id=27;
	System.out.println(userid + " " + jobid);
	User us = ad1.getUserDataById(userid);
	UserResume ur = ad1.getUserResumeDataById(userid);
	%>
	
 <%
 UserDAO u = new UserDAO();

ResultSet rs = u.checkJobApplied(jobid, userid);
	if(rs.next()){
		session.setAttribute("already-fail", false);
		response.sendRedirect("user-profile.jsp");
	}
 
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link href="../assets/css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
	font-family: 'Open Sans', sans-serif;
}

#signUpForm {
	width: 100%;
	background-color: #ffffff;
	margin: 40px auto;
	padding: 20px;
	/* box-shadow: 0px 6px 18px rgb(0 0 0 / 9%); */
	border-radius: 12px;
}

#signUpForm .form-header {
	gap: 5px;
	text-align: center;
	font-size: .9em;
}

#signUpForm .form-header .stepIndicator {
	position: relative;
	flex: 1;
	padding-bottom: 30px;
}

#signUpForm .form-header .stepIndicator.active {
	font-weight: 600;
}

#signUpForm .form-header .stepIndicator.finish {
	font-weight: 600;
	color: #009688;
}

#signUpForm .form-header .stepIndicator::before {
	content: "";
	position: absolute;
	left: 50%;
	bottom: 0;
	transform: translateX(-50%);
	z-index: 9;
	width: 20px;
	height: 20px;
	background-color: #d5efed;
	border-radius: 50%;
	border: 3px solid #ecf5f4;
}

#signUpForm .form-header .stepIndicator.active::before {
	background-color: #a7ede8;
	border: 3px solid #d5f9f6;
}

#signUpForm .form-header .stepIndicator.finish::before {
	background-color: #009688;
	border: 3px solid #b7e1dd;
}

#signUpForm .form-header .stepIndicator::after {
	content: "";
	position: absolute;
	left: 50%;
	bottom: 8px;
	width: 100%;
	height: 3px;
	background-color: #f3f3f3;
}

#signUpForm .form-header .stepIndicator.active::after {
	background-color: #a7ede8;
}

#signUpForm .form-header .stepIndicator.finish::after {
	background-color: #009688;
}

#signUpForm .form-header .stepIndicator:last-child:after {
	display: none;
}

#signUpForm input {
	padding: 10px 20px;
	width: 100%;
	font-size: 1em;
	border: 1px solid #e3e3e3;
	border-radius: 10px;
}

#signUpForm input:focus {
	border: 1px solid #009688;
	outline: 0;
}

#signUpForm input.invalid {
	border: 1px solid #ffaba5;
}

#signUpForm .step {
	display: none;
}

#signUpForm .form-footer {
	overflow: auto;
	gap: 20px;
}

#signUpForm .form-footer button {
	background-color: #009688;
	border: 1px solid #009688 !important;
	color: #ffffff;
	border: none;
	padding: 13px 30px;
	font-size: 1em;
	cursor: pointer;
	border-radius: 5px;
	flex: 1;
	margin-top: 5px;
}

#signUpForm .form-footer button:hover {
	opacity: 0.8;
}

#signUpForm .form-footer #prevBtn {
	background-color: #fff;
	color: #009688;
}
</style>




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
					<li class="breadcrumb-item">Listed Jobs</li>
					<li class="breadcrumb-item">Job Details</li>
					<li class="breadcrumb-item active">Apply</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">

			<div class="row mb-3">
				<div class="col-md-7 pt-2">


					<div class="card">
						<!-- style="height :50rem" -->
						<div class="card-body">
							<h5 class="card-title">Application</h5>
							<!-- <div class="progress">
                <div class="progress-bar" role="progressbar" style="width: 10%" aria-valuenow="10" aria-valuemin="0" aria-valuemax="100"></div>
              </div> -->


							<form id="signUpForm" action="../JobApplyController" method="post" enctype='multipart/form-data' class="row g-3 pt-1">
								<input type="hidden" name="userid" value="<%=userid%>">
								<input type="hidden" name="recid" value="<%=recid%>">
								<input type="hidden" name="jobid" value="<%=jobid%>">
								<!-- start step indicators -->
								<div class="form-header d-flex mb-4">
									<span class="stepIndicator">Personal Information</span> <span
										class="stepIndicator">Social Profiles</span> <span
										class="stepIndicator">Resume</span> <span
										class="stepIndicator">Questions</span> <span
										class="stepIndicator">Apply</span>

								</div>
								<!-- end step indicators -->

								<!-- <h5>Step 1: Personal Information</h5> -->
								<div class="step">
									<div class="col-md-12">
										<label for="inputName5" class="form-label">Full Name</label> <input
											type="text" readonly="readonly" class="form-control"
											value="<%=us.getFirst_name() + " " + us.getMiddle_name() + " " + us.getLast_name()%> "
											id="inputName5" name="fName">
									</div>

									<div class="row">

										<div class="col-md-7 pt-2">
											<label for="inputEmail5" class="form-label">Email</label> <input
												type="email" readonly="readonly" class="form-control"
												value="<%=us.getEmail_id()%>" id="inputEmail5" name="email">
										</div>
										<div class="col-md-5 pt-2">
											<label for="inputPassword5" class="form-label">Phone
												no</label> <input type="text" readonly="readonly"
												value="<%=us.getPhon_no()%>" class="form-control"
												id="inputPhone5" name="phone">
										</div>

									</div>


									<div class="row">

										<div class="col-md-6 pt-2">
											<label for="inputEmail5" class="form-label">DOB</label> <input
												type="date" readonly="readonly" value="<%=us.getDob()%>"
												class="form-control" id="inputDOB5" name="dob">
										</div>

										<div class="offset-1 col-md-4 pt-2">
											<label for="inputPassword5" class="form-label">Gender</label>
											<input type="text" readonly="readonly"
												value="<%=us.getGender()%>" class="form-control"
												id="inputPhone5" name="phone">

										</div>

									</div>

									<div class="col-12 pt-2">
										<label for="inputAddress5" class="form-label">Address</label>
										<input type="text" readonly="readonly" class="form-control"
											id="inputAddres5s" value="<%=ur.getCity()%>" name="address">
									</div>

								</div>

								<!--      step 2 -->

								<div class="step">

									<div class="col-md-12 pt-2">
										<label for="inputName5" class="form-label">LinkedIn
											Profile</label> <input type="text" class="form-control"
											readonly="readonly" value="<%=us.getLinkedin_url()%>"
											id="inputName5" name="linkedin">
									</div>

									<div class="col-md-12 pt-2">
										<label for="inputName5" class="form-label">GitHub
											Profile</label> <input type="text" class="form-control"
											value="<%=us.getGithub_url()%>" readonly="readonly"
											id="inputName5" name="github">
									</div>

								</div>

								<!--   step 3 -->

								<div class="step">
									<div class="row mb-3">



										<!-- Special title treatmen -->
										<div class="card text-center">

											<div class="card-body">

												<div class="card-title">
													<i class="fa fa-file-pdf-o" style="font-size: 30px"></i>Upload
													Your Own Resume
												</div>

												<!--  <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
												<label for="inputNumber"
													class="col-sm-12 col-form-label text-center"></label>
												<div class="col-sm-12">
													<input class="form-control" name="resume" type="file"
														id="formFile">
												</div>
											</div>
										</div>
										<!-- End Special title treatmen -->

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

									</div>


								</div>
								<div class="step">

									<div class="col-md-12 pt-2">
										<label for="inputName5" class="form-label">Why should you be hired for this role?
</label> <textarea type="text" class="form-control"
											 
											id="inputName5" name="ques1"></textarea>
									</div>

									<div class="col-md-12 pt-2">
										<label for="inputName5" class="form-label">Are you ready to work 5 days a week, 4 hours a day?</label> <textarea type="text" class="form-control"
											 
											id="inputName5" name="ques2"></textarea>
									</div>

								</div>
								<div class="step">
<div class="card text-center">

											<div class="card-body">
												<h5 class="card-title">Your application details are been saved ! Please click submit button to proceed with your application.</h5>
												<!--  <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
												

											</div>
										</div>
									
								</div>










								<div class="form-footer d-flex pt-4">
									<button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
									<button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
								</div>
							</form>



							<!-- <div class="step"> -->
							<!-- <p class="text-center mb-4">Create your account</p> -->


							<!-- <div class="col-md-12">
                  <label for="inputName5" class="form-label">Full Name</label>
                  <input type="text" class="form-control" id="inputName5" name="fName">
                </div>
                <div class="col-md-6 pt-2">
                  <label for="inputEmail5" class="form-label">Email</label>
                  <input type="email" class="form-control" id="inputEmail5" name="email">
                </div>
                <div class="col-md-6 pt-2">
                  <label for="inputPassword5" class="form-label">Phone no</label>
                  <input type="text" class="form-control" id="inputPhone5" name="phone">
                </div>
                
                
                
                <div class="col-md-6 pt-2">
                  <label for="inputEmail5" class="form-label">DOB</label>
                  <input type="date" class="form-control" id="inputDOB5" name="dob">
                </div>
                <div class="col-md-6 pt-2">
                  <label for="inputPassword5" class="form-label">Gender</label>
                  <select id="inputState" class="form-select" name="gender">
                    <option selected>Choose...</option>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                  </select>
                </div>
                
                <div class="col-12 pt-2">
                  <label for="inputAddress5" class="form-label">Address</label>
                  <input type="text" class="form-control" id="inputAddres5s" placeholder="" name="address">
                </div>
                
                
          
                
        </div> -->

							<!-- step two -->
							<!--   <div class="step">
            <p class="text-center mb-4">Your presence on the social network</p>
            <div class="col-md-12 pt-2">
                  <label for="inputName5" class="form-label">LinkedIn Profile</label>
                  <input type="text" class="form-control" id="inputName5" name="linkedin">
                </div>
                
                <div class="col-md-12 pt-2">
                  <label for="inputName5" class="form-label">GitHub Profile</label>
                  <input type="text" class="form-control" id="inputName5" name="github">
                </div>
        </div> -->

							<!-- step three -->
							<!--  <div class="step">
            <p class="text-center mb-4">We will never sell it</p>
            <div class="mb-3">
                <input type="text" placeholder="Full name" oninput="this.className = ''" name="fullname">
            </div>
            <div class="mb-3">
                <input type="text" placeholder="Mobile" oninput="this.className = ''" name="mobile">
            </div>
            <div class="mb-3">
                <input type="text" placeholder="Address" oninput="this.className = ''" name="address">
            </div>
        </div> -->

							<!-- start previous / next buttons -->
							<!-- <div class="form-footer d-flex pt-5">
            <button type="button" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
            <button type="button" id="nextBtn" onclick="nextPrev(1)">Next</button>
        </div> -->
							<!-- end previous / next buttons -->
							<!--  </form> -->


							<!-- <div class="position-absolute bottom-0 start-50 translate-middle-x">
  <a href="#" class="btn btn-primary">Next Step</a>
</div> -->

						</div>
					</div>

				</div>


				<div class="col-md-5 pt-2">


					<!-- Default Card -->
					<div class="card" style="height: 590px; overflow-y: auto;">
						<div class="card-body" style="font-size: 16px;">
							<h5 class="card-title">Job Details</h5>
							<hr>

							<p class="card-text">
								<b>Job Description</b>
							</p>
							<p class="card-text">Graduate Engineering Trainee (Fresher)
								in HiPaaS is responsible for the programming and development of
								applications and software using Python/React/C#/Boomi/etc.
								Individuals in this role should possess a strong logical and
								technical bent of mind.</p>


							<p class="card-text">
								<b>Job Requirements/qualification</b>
							</p>

							<p class="card-text">
								<!-- List group with active and disabled items -->
							<ul class="list-group list-group-flush">
								<li class="list-group-item">Degree BE/BTech in Computer
									Science/IT or MCA degree.</li>
								<li class="list-group-item">eager to learn, adapt and excel
									in an extreme technology</li>
								<li class="list-group-item">Deep understanding of algorithm
									and data structure is a MUST</li>
								<li class="list-group-item">Sound understanding of coding
									and development processes.</li>

							</ul>
							<!-- End Clean list group -->
							</p>
							<p class="card-text">
								<b>Job Nature: </b> <span>Full Time</span>
							</p>

							<p class="card-text">
								<b>Location: </b><span>Pune</span>
							</p>
							<p class="card-text">
								<b>Deadline: </b>
							</p>

						</div>
					</div>
					<!-- End Default Card -->

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
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->

	<script>
		var currentTab = 0; // Current tab is set to be the first tab (0)
		showTab(currentTab); // Display the current tab

		function showTab(n) {
			// This function will display the specified tab of the form...
			var x = document.getElementsByClassName("step");
			x[n].style.display = "block";
			//... and fix the Previous/Next buttons:
			if (n == 0) {
				document.getElementById("prevBtn").style.display = "none";
			} else {
				document.getElementById("prevBtn").style.display = "inline";
			}
			if (n == (x.length - 1)) {
				document.getElementById("nextBtn").innerHTML = "Submit";
			} else {
				document.getElementById("nextBtn").innerHTML = "Next";
			}
			//... and run a function that will display the correct step indicator:
			fixStepIndicator(n)
		}

		function nextPrev(n) {
			// This function will figure out which tab to display
			var x = document.getElementsByClassName("step");
			// Exit the function if any field in the current tab is invalid:
			/*                if (n == 1 && !validateForm()) return false; */
			// Hide the current tab: 
			x[currentTab].style.display = "none";
			// Increase or decrease the current tab by 1:
			currentTab = currentTab + n;
			// if you have reached the end of the form...
			if (currentTab >= x.length) {
				// ... the form gets submitted:
				document.getElementById("signUpForm").submit();
				return false;
			}
			// Otherwise, display the correct tab:
			showTab(currentTab);
		}

		/* function validateForm() {
		  // This function deals with validation of the form fields
		  var x, y, i, valid = true;
		  x = document.getElementsByClassName("step");
		  y = x[currentTab].getElementsByTagName("input");
		  // A loop that checks every input field in the current tab:
		  for (i = 0; i < y.length; i++) {
		    // If a field is empty...
		    if (y[i].value == "") {
		      // add an "invalid" class to the field:
		      y[i].className += " invalid";
		      // and set the current valid status to false
		      valid = false;
		    }
		  }
		  // If the valid status is true, mark the step as finished and valid:
		  if (valid) {
		    document.getElementsByClassName("stepIndicator")[currentTab].className += " finish";
		  }
		  return valid; // return the valid status
		} */

		function fixStepIndicator(n) {
			// This function removes the "active" class of all steps...
			var i, x = document.getElementsByClassName("stepIndicator");
			for (i = 0; i < x.length; i++) {
				x[i].className = x[i].className.replace(" active", "");
			}
			//... and adds the "active" class on the current step:
			x[n].className += " active";
		}
	</script>

</body>

</html>