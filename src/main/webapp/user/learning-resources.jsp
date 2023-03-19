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
					<li class="breadcrumb-item active">Learning Resources</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<section class="section dashboard">

			<div class="card">
				<div class="card-body">
					<!-- <h5 class="card-title">Best Learning Resources for you</h5>
 -->
					<!-- Bordered Tabs Justified -->
					<ul class="nav nav-tabs nav-tabs-bordered d-flex pt-3"
						id="borderedTabJustified" role="tablist">
						<li class="nav-item flex-fill" role="presentation">
							<button class="nav-link w-100 active" id="home-tab"
								data-bs-toggle="tab" data-bs-target="#bordered-justified-home"
								type="button" role="tab" aria-controls="home"
								aria-selected="true">Youtube Resources</button>
						</li>
						<li class="nav-item flex-fill" role="presentation">
							<button class="nav-link w-100" id="profile-tab"
								data-bs-toggle="tab"
								data-bs-target="#bordered-justified-profile" type="button"
								role="tab" aria-controls="profile" aria-selected="false">Udemy
								Courses</button>
						</li>
						<li class="nav-item flex-fill" role="presentation">
							<button class="nav-link w-100" id="strategy-tab"
								data-bs-toggle="tab"
								data-bs-target="#bordered-justified-strategy" type="button"
								role="tab" aria-controls="profile" aria-selected="false">Job
								Search Strategy</button>
						</li>
						<li class="nav-item flex-fill" role="presentation">
							<button class="nav-link w-100" id="contact-tab"
								data-bs-toggle="tab" data-bs-target="#bordered-justified-que"
								type="button" role="tab" aria-controls="que"
								aria-selected="false">Frequently Asked Questions</button>
						</li>
					</ul>
					<div class="tab-content pt-2" id="borderedTabJustifiedContent">
						<div class="tab-pane fade show active"
							id="bordered-justified-home" role="tabpanel"
							aria-labelledby="home-tab">


							<div class="card">
								<div class="card-body">
									<!--  <h5 class="card-title">Pills Tabs</h5> -->

									<!-- Pills Tabs -->
									<ul class="nav nav-pills mb-3 justify-content-center mt-2"
										id="pills-tab" role="tablist">
										<li class="nav-item" role="presentation">
											<button class="nav-link active" id="pills-home-tab"
												data-bs-toggle="pill" data-bs-target="#pills-home"
												type="button" role="tab" aria-controls="pills-home"
												aria-selected="true">Data Structures</button>
										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link" id="pills-profile-tab"
												data-bs-toggle="pill" data-bs-target="#pills-profile"
												type="button" role="tab" aria-controls="pills-profile"
												aria-selected="false">Java</button>
										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link" id="pills-contact-tab"
												data-bs-toggle="pill" data-bs-target="#pills-contact"
												type="button" role="tab" aria-controls="pills-contact"
												aria-selected="false">Python</button>
										</li>
										<li class="nav-item" role="presentation">
											<button class="nav-link" id="pills-sql-tab"
												data-bs-toggle="pill" data-bs-target="#pills-sql"
												type="button" role="tab" aria-controls="pills-contact"
												aria-selected="false">SQL</button>
										</li>

									</ul>
									<div class="tab-content pt-2" id="myTabContent">
										<div class="tab-pane fade show active" id="pills-home"
											role="tabpanel" aria-labelledby="home-tab">

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
												<!--  </div> -->
												<!-- End Card with an image on left -->


												<!-- Card with an image on top -->
												<div class="card col-md-3">
													<img src="../assets/img/resource/dsa2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">CODE WITH HARRY</h5>
														<!-- <p class="card-text">Full tutorial on Data structure</p> -->
														<a
															href="https://www.youtube.com/playlist?list=PLu0W_9lII9ahIappRPN0MCAgtOu3lQjQi"
															class="card-link">Complete Tutorial</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/jenny.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Jenny's Lecture CS/IT</h5>
														<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
														<a
															href="https://www.youtube.com/playlist?list=PLdo5W4Nhv31bbKJzrsKfMpo_grxuLl8LU"
															class="card-link">Complete Tutorial</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/wscube.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">WsCube Tech</h5>
														<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
														<a href="https://www.youtube.com/watch?v=hCrO_cR7kno"
															class="card-link">DSA in One Video</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


												<div class="card col-md-3">
													<img src="../assets/img/resource/road.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Ishan Sharma</h5>
														<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
														<a href="https://www.youtube.com/watch?v=hCrO_cR7kno"
															class="card-link">Roadmap</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/road2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Nishant Chahar</h5>
														<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
														<a href="https://www.youtube.com/watch?v=UVP3123wNYQ"
															class="card-link">90 Days of DSA</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/harry2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Code With Harry</h5>
														<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
														<a href="https://www.youtube.com/watch?v=9OMYU8L32pc"
															class="card-link">Choose a Language</a>
													</div>
												</div>
												<!-- End Card with an image on top -->







											</div>
										</div>


										<div class="tab-pane fade" id="pills-profile" role="tabpanel"
											aria-labelledby="profile-tab">
											<div class="row">
												<div class="card col-md-3">
													<img src="../assets/img/resource/java1.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Apna College</h5>
														<a
															href="https://www.youtube.com/playlist?list=PLfqMhTWNBTe3LtFWcvwpqTkUSlB32kJop"
															class="card-link">Complete Java Tutorial</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/java2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Telusko</h5>
														<a href="https://www.youtube.com/watch?v=BGTx91t8q50"
															class="card-link">Java for beginners</a>
													</div>
												</div>
												<!-- End Card with an image on top -->



												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/java3.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Code With Harry</h5>
														<a href="https://www.youtube.com/watch?v=ntLJmHOJ0ME"
															class="card-link">Java Tutorial</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card col-md-3">
													<img src="../assets/img/resource/java4.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Kunal Kushwaha</h5>
														<a
															href="https://www.youtube.com/playlist?list=PL9gnSGHSqcnr_DxHsP7AW9ftq0AtAyYqJ"
															class="card-link">Java+DSA+Placement</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/java5.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Saurabh Shukla Sir</h5>
														<a
															href="https://www.youtube.com/playlist?list=PLX9Zi6XTqOKQ7TdRz0QynGIKuMV9Q2H8E"
															class="card-link">Java for absolute beginners</a>
													</div>
												</div>
												<!-- End Card with an image on top -->



											</div>
										</div>



										<div class="tab-pane fade" id="pills-contact" role="tabpanel"
											aria-labelledby="contact-tab">

											<div class="row">
												<div class="card col-md-3">
													<img src="../assets/img/resource/py1.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">edureka!</h5>
														<a
															href="https://www.youtube.com/playlist?list=PL9ooVrP1hQOE4KoZLUP4LgBwFH2IJCQs6"
															class="card-link">Full Python Course</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/py2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">FreeCodeCamp</h5>
														<a
															href="https://www.youtube.com/playlist?list=PLWKjhJtqVAbnqBxcdjVGgT3uVR10bzTEB"
															class="card-link">Python for beginners</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/py3.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Krish Naik</h5>
														<a
															href="https://www.youtube.com/playlist?list=PLZoTAELRMXVNUL99R4bDlVYsncUNvwUBB"
															class="card-link">Complete Python</a>
													</div>
												</div>
												<!-- End Card with an image on top -->

												<div class="card col-md-3">
													<img src="../assets/img/resource/py4.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Programming with Mosh</h5>
														<a href="https://www.youtube.com/watch?v=_uQrJ0TkZlc"
															class="card-link">Complete Python</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


											</div>
										</div>



										<div class="tab-pane fade" id="pills-sql" role="tabpanel"
											aria-labelledby="contact-tab">

											<div class="row">
												<div class="card col-md-3">
													<img src="../assets/img/resource/sql1.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">Simplilearn</h5>
														<a href="https://www.youtube.com/watch?v=AA7i2GcTGwU"
															class="card-link">Complete for beginner</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


												<div class="card offset-1 col-md-3">
													<img src="../assets/img/resource/sql2.jpg"
														class="card-img-top" alt="...">
													<div class="card-body">
														<h5 class="card-title">CodeHelp - by Babbar</h5>
														<a href="https://www.youtube.com/watch?v=D_wNQR3LeeM"
															class="card-link">SQL in one video</a>
													</div>
												</div>
												<!-- End Card with an image on top -->


											</div>

										</div>








									</div>
									<!-- End Pills Tabs -->

								</div>
							</div>




						</div>

						<div class="tab-pane fade" id="bordered-justified-profile"
							role="tabpanel" aria-labelledby="profile-tab">


							<div class="row">
								<div class="card col-md-3">
									<img src="../assets/img/resource/ude1.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">BackSpace Academy</h5>
										<h6 class="card-subtitle mb-2 text-muted">Amazon Web
											Services (AWS) - Zero to Hero</h6>

										<a
											href="https://www.udemy.com/course/amazon-web-services-aws-v/"
											class="card-link">Enroll Free</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/ude2.png" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Stone River eLearning</h5>
										<h6 class="card-subtitle mb-2 text-muted">HTML5 and CSS3
											Fundamentals- Build your own website</h6>
										<a
											href="https://www.udemy.com/course/html5-fundamentals-for-beginners/"
											class="card-link">Enroll Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/ude3.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Kalob Taulien</h5>
										<h6 class="card-subtitle mb-2 text-muted">Git & GitHub
											Crash Course: Create a Repository From Scratch!</h6>
										<a
											href="https://www.udemy.com/course/git-and-github-crash-course-creating-a-repository-from-scratch/"
											class="card-link">Enroll Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card col-md-3">
									<img src="../assets/img/resource/ude4.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Chris DeLeon</h5>
										<h6 class="card-subtitle mb-2 text-muted">Code Your First
											Game: Arcade Classic in JavaScript on Canvas</h6>
										<a href="https://www.udemy.com/course/code-your-first-game/"
											class="card-link"></a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/ude5.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">EN7RPRNR Global Mastery Program</h5>
										<h6 class="card-subtitle mb-2 text-muted">Productivity:
											Time Management, Focus and Success</h6>
										<a
											href="https://www.udemy.com/course/productivity-time-management-focus-and-success/"
											class="card-link"></a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/java5.jpg"
										class="card-img-top" alt="...">
									<div class="card-body">
										<h5 class="card-title"></h5>
										<a href="" class="card-link"></a>
									</div>
								</div>
								<!-- End Card with an image on top -->


							</div>
						</div>



						<div class="tab-pane fade" id="bordered-justified-strategy"
							role="tabpanel" aria-labelledby="strategy-tab">


							<div class="row mt-2">
								<div class="card col-md-3">
									<img src="../assets/img/resource/job1.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Anshika Gupta</h5>
										<h6 class="card-subtitle mb-2 text-muted">Off Campus
											Placement strategy (REAL EXAMPLE)</h6>

										<!-- <p class="card-text">Full tutorial on Data structure</p> -->
										<a href="https://www.youtube.com/watch?v=2aHnI2171l0"
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/job2.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Code With Harry</h5>
										<h6 class="card-subtitle mb-2 text-muted">How to get
											highest package in college?</h6>
										<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
										<a href="https://www.youtube.com/watch?v=5nbjgV4-sq4"
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/job3.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Professor Heather Austin</h5>
										<h6 class="card-subtitle mb-2 text-muted">MASTER Your Job
											Search</h6>
										<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
										<a href="https://www.youtube.com/watch?v=h_04pmxmHQc"
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->



								<div class="card col-md-3">
									<img src="../assets/img/resource/job4.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Anuj Bhaiya</h5>
										<h6 class="card-subtitle mb-2 text-muted">How to make
											linkedin profile better | Referrals | Profile Building | Jobs
											search [2023]</h6>
										<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
										<a href="https://www.youtube.com/watch?v=I17XCak_Suc"
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->

								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/job5.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">Badass Careers</h5>
										<h6 class="card-subtitle mb-2 text-muted">Modern Job
											Search Tips & Mistakes to Avoid When Job Hunting 🔎</h6>
										<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
										<a href="https://www.youtube.com/watch?v=ZUZfo4VfW7A"
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->


								<div class="card offset-1 col-md-3">
									<img src="../assets/img/resource/job6.jpg" class="card-img-top"
										alt="...">
									<div class="card-body">
										<h5 class="card-title">TEDx Talks</h5>
										<h6 class="card-subtitle mb-2 text-muted">Off Campus
											Placement strategy (REAL EXAMPLE)</h6>
										<!--  <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
        	 -->
										<a href=https://www.youtube.com/watch?v=tVKfJ6z4fYg
											class="card-link">Watch Now</a>
									</div>
								</div>
								<!-- End Card with an image on top -->


							</div>
						</div>
						<div class="tab-pane fade" id="bordered-justified-que"
							role="tabpanel" aria-labelledby="que-tab">

							<div class="row">
								<div class="col-lg-12">

									<div class="card">
										<div class="card-body">
											<!--               <h5 class="card-title">Mostly asked questions</h5>
 -->
											<!-- Default Accordion -->
											<div class="accordion" id="accordionExample">
												<div class="accordion-item">
													<h2 class="accordion-header" id="headingOne">
														<button class="accordion-button" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseOne"
															aria-expanded="true" aria-controls="collapseOne">
															Tell me about yourself and describe your background</button>
													</h2>
													<div id="collapseOne"
														class="accordion-collapse collapse show"
														aria-labelledby="headingOne"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong>I come from a small town, where
															opportunities were limited. Since good schools were a
															rarity, I started using online learning to stay up to
															date with the best. That's where I learned to code and
															then I went on to get my certification as a computer
															programmer. After I got my first job as a front-end
															coder, I continued to invest time in mastering both
															front- and back-end languages, tools, and frameworks.

														</div>
													</div>
												</div>
												<div class="accordion-item">
													<h2 class="accordion-header" id="headingTwo">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseTwo"
															aria-expanded="false" aria-controls="collapseTwo">
															How did you hear about this position?</button>
													</h2>
													<div id="collapseTwo" class="accordion-collapse collapse"
														aria-labelledby="headingTwo"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong>I learned about the position
															through LinkedIn as I’ve been following your
															company’s page for a while now. I’m really passionate
															about the work you’re doing in X, Y, and Z areas, so I
															was excited to apply. The required skills match well with
															the skills I have, and it seems like a great opportunity
															for me to contribute to your mission, as well as a great
															next move for my career.
														</div>
													</div>
												</div>
												<div class="accordion-item">
													<h2 class="accordion-header" id="headingThree">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseThree"
															aria-expanded="false" aria-controls="collapseThree">
															What type of work environment do you prefer?</button>
													</h2>
													<div id="collapseThree" class="accordion-collapse collapse"
														aria-labelledby="headingThree"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> That sounds great to me. I
															like fast-paced work environments because they make me
															feel like I’m always learning and growing, but I really
															thrive when I’m collaborating with team members and
															helping people reach a collective goal as opposed to
															competing. My last internship was at an organization with
															a similar culture, and I really enjoyed that balance.
														</div>
													</div>
												</div>


												<div class="accordion-item">
													<h2 class="accordion-header" id="headingFour">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseFour"
															aria-expanded="false" aria-controls="collapseFour">
															How do you deal with pressure or stressful situations?</button>
													</h2>
													<div id="collapseFour" class="accordion-collapse collapse"
														aria-labelledby="headingFour"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> I realize stressful situation
															are always going to come up, and I definitely have had to
															learn how to navigate them throughout my career. I think
															I get better at it with every new experience. While
															working on a new product launch at my last company, for
															example, things were not going according to plan with my
															team. Instead of pointing fingers, my first reaction was
															to take a step back and figure out some strategies around
															how we could we solve the problem at hand. Previously, I
															may have defaulted to panicking in that situation, so
															being calm and collected was definitely a step forward
															and helped me approach the situation with more clarity.
														</div>
													</div>
												</div>



												<div class="accordion-item">
													<h2 class="accordion-header" id="headingFive">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseFive"
															aria-expanded="false" aria-controls="collapseFive">
															Do you prefer working independently or on a team?</button>
													</h2>
													<div id="collapseFive" class="accordion-collapse collapse"
														aria-labelledby="headingFive"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> I enjoy a blend of the two. I
															like having a team to strategize with, get diverse
															opinions from, and reach out to for feedback. But I am
															also comfortable taking on assignments that require me to
															work independently. I find I do some of my best work when
															I can focus alone in a quiet space, but I really value
															collaborating with my teammates to come up with the best
															ideas.
														</div>
													</div>
												</div>

												<div class="accordion-item">
													<h2 class="accordion-header" id="headingSix">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseSix"
															aria-expanded="false" aria-controls="collapseSix">
															What did you do in the last year to improve your
															knowledge?</button>
													</h2>
													<div id="collapseSix" class="accordion-collapse collapse"
														aria-labelledby="headingSix"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> The extra time on my plate
															really allowed me to get introspective around where I
															want to take my career. I read a lot of journals to keep
															abreast of the latest ideas in my field, and sharpened my
															skills by taking some online courses, such as…” (and
															then be specific).
														</div>
													</div>
												</div>



												<div class="accordion-item">
													<h2 class="accordion-header" id="headingSeven">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseSeven"
															aria-expanded="false" aria-controls="collapseSeven">
															What are your salary expectations?</button>
													</h2>
													<div id="collapseSeven" class="accordion-collapse collapse"
														aria-labelledby="headingSeven"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> Based on my skills and
															experience and on the current industry rates, I’m
															looking at a salary around $____” (then fill in with
															your desired salary range and rationale).
														</div>
													</div>
												</div>

												<div class="accordion-item">
													<h2 class="accordion-header" id="headingEight">
														<button class="accordion-button collapsed" type="button"
															data-bs-toggle="collapse" data-bs-target="#collapseEight"
															aria-expanded="false" aria-controls="collapseEight">
															What are your greatest strengths?</button>
													</h2>
													<div id="collapseEight" class="accordion-collapse collapse"
														aria-labelledby="headingEight"
														data-bs-parent="#accordionExample">
														<div class="accordion-body">
															<strong>Example: </strong> In your answer to this
															question, share your most relevant technical and soft
															skills. While it may feel uncomfortable to speak highly
															of yourself, remember that this is your opportunity to
															tell your interviewers what makes you a great candidate.
															To answer, follow the formula below: 1. Share one to a
															few positive qualities and personal attributes: "I've
															always been a natural leader..." 2. Back them up with
															examples: "...I've exceeded my KPIs every quarter and
															have been promoted twice in the past five years. I look
															back at those successes and know that I wouldn’t have
															reached them if I hadn’t built and led teams composed
															of highly skilled and diverse individuals. I'm proud of
															my ability to get cross-functional groups on the same
															page...” 3. Relate them back to the role for which
															you're interviewing: "...I've also regularly honed my
															management skills through 360 reviews and candid sessions
															with my team, and I know continuing to build my
															leadership skills is something I want from my next
															role.”
														</div>
													</div>
												</div>






											</div>
											<!-- End Default Accordion Example -->






										</div>
									</div>

								</div>


							</div>
						</div>
						<!-- End Bordered Tabs Justified -->

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
	<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
</body>

</html>