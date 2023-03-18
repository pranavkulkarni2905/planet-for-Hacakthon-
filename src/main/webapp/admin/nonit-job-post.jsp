<%@page import="com.job.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Admin Dashboard | WorkConnect</title>
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


		<div class="pagetitle">
			<h1>Post Non-IT Job</h1>
		</div>
		<!-- End Page Title -->

		<%try{
			Boolean msg1 = (Boolean) session.getAttribute("job-post-success");
			if (msg1==true) {
			%>
				<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        
    
        <div class="toast fade show">
            <div class="toast-header bg-success text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Success!!</strong>
                <small>1 seconds ago</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b>Job Posted Successfully !</b></h5>
            </div>
        </div>
    </div>
			<%
			}
       	
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("job-post-success");
			%>
			
			<%try{
			Boolean msg1 = (Boolean) session.getAttribute("job-post-fail");
			if (msg1==false) {
			%>
				<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        
    
        <div class="toast fade show">
            <div class="toast-header bg-danger text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Error!</strong>
                <small>2 seconds ago</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b>Something Went wrong</b></h5>
            </div>
        </div>
    </div>
			<%
			}
       	
			}catch(Exception e){
				//e.printStackTrace();
			}
			session.removeAttribute("job-post-fail");
			%>
    <div class="pagetitle">
      
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="recruiter-index.jsp">Home</a></li>
          <li class="breadcrumb-item">Admin</li>
          <li class="breadcrumb-item active">Post a Non-IT Job</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
     <div class="card">
    <div class="card-body">
      <h5 class="card-title"><i class="bi bi-file-post"></i> Post a Non-IT job</h5>

      <!-- Multi Columns Form -->
      <form action="../NonITJobPostController" method="post" class="row g-3">
        <div class="col-md-4">
          <label for="inputTitle" class="form-label">Job Title</label>
          <input type="text" class="form-control" id="jobTitle" name="title">
        </div>

        <div class="col-md-4">
          <label for="inputType" class="form-label">Job Type</label>
          <select id="jobType" class="form-select" name="type">
            <option selected>Select...</option>
            <option value="Full-Time">Full-Time</option>
            <option value="part-Time">Part-Time</option>
            <option value="Contract">Contract</option>
            <option value="Internship">Internship</option>
            <option value="Temporary">Temporary</option>
          </select>
        </div>
          <div class="col-md-4">
          <label for="inputType" class="form-label">Job Categories</label>
          <select id="jobType" class="form-select" name="category" >
            <option selected disabled>Select...</option>
            <option value="Full-Time">educator</option>
            <option value="part-Time">Marketing</option>
            <option value="Contract">Pharmaceuticals/Health care</option>
            <option value="Internship">Construction</option>
          </select>
        </div>
        <div class="col-md-4">
          <label for="inputVac" class="form-label">Vacancy</label>
          <input type="number" class="form-control" id="jobVac" name="vacancy">
        </div>
        
        


        <div class="col-4">
          <label for="inputLoc" class="form-label">Job Location</label>
          <input type="text" class="form-control" id="jobLoc" name="location">
        </div>


        <div class="col-md-4">
          <label for="inputSal" class="form-label">Salary</label>
          <div class="input-group mb-3">
            <span class="input-group-text">Rupee</span>
            <input type="text" class="form-control" aria-label="Amount" name="salary">
          </div>
        </div>

        <div class="col-md-4">
          <label for="inputDate" class="form-label">Application Deadline</label>
          <input type="date" class="form-control" id="inputDead" name="deadline">
        </div>
        
        <div class="col-md-6">
          <label for="inputDesc" class="form-label">Job Description</label>
          <textarea class="form-control" id="jobDesc" style="height: 100px;" name="desc"></textarea>
        </div>
        
         <div class="col-md-6">
          <label for="inputSkills" class="form-label">Skills and Qualification</label>
          <textarea class="form-control" id="skills" style="height: 100px;" name="skills"></textarea>
        </div>
        
<!-- 
          <div class="col-md-6">
          <label for="inputCmp" class="form-label">Application Instruction</label>
          <textarea class="form-control" id="appInstruction" style="height: 100px;"></textarea>
        </div>
        

        <div class="col-md-6">
          <label for="inputContact" class="form-label">Contact Information</label>
          <textarea class="form-control" id="contact" style="height: 100px;"></textarea>
        </div> -->
        
        
        
        

        <div class="col-12">
          <div class="form-check">
            <input class="form-check-input" type="checkbox" id="gridCheck">
            <label class="form-check-label" for="gridCheck">
              Check me out
            </label>
          </div>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-primary">Submit</button>
          <button type="reset" class="btn btn-secondary">Reset</button>
        </div>
      </form><!-- End Multi Columns Form -->

    </div>
  </div>
		
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


</body>

</html>