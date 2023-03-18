<%@page import="com.job.DAO.UserDAO"%>
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

  <title>Profile | WorkConnect</title>
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
	ServletContext sc2 = request.getServletContext();
UserDAO ad1=new UserDAO();
int id=(Integer)sc2.getAttribute("user-id");
User us =ad1.getUserDataById(id);

%>
 

  <main id="main" class="main">
    <%
	try {
		Boolean msg1 = (Boolean) session.getAttribute("app-success");
		if (msg1 == true) {
	%>
	<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        <div class="toast fade show">
            <div class="toast-header bg-success text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Success!</strong>
                <small>just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b> Application Submitted successfully!!
            </b></h5>
            </div>
        </div>
        </div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("app-success");
	%>
	  <%
	try {
		Boolean msg1 = (Boolean) session.getAttribute("app-fail");
		if (msg1 == false) {
	%>
	<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        <div class="toast fade show">
            <div class="toast-header bg-warning text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Error!</strong>
                <small>just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b> Error!
            </b></h5>
            </div>
        </div>
        </div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("app-fail");
	%>
	<%
	try {
		Boolean msg1 = (Boolean) session.getAttribute("already-fail");
		if (msg1 == false) {
	%>
	<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        <div class="toast fade show">
            <div class="toast-header bg-warning text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Error!</strong>
                <small>just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b> Already Applied for this job !
            </b></h5>
            </div>
        </div>
        </div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("already-fail");
	%>
  <%
	try {
		Boolean msg1 = (Boolean) session.getAttribute("edit-profile-success");
		if (msg1 == true) {
	%>
	<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        <div class="toast fade show">
            <div class="toast-header bg-success text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Success!</strong>
                <small>just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b> Profile Changes saved successfully!!
            </b></h5>
            </div>
        </div>
        </div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("edit-profile-success");
	%>
	<%
	try {
		Boolean msg1 = (Boolean) session.getAttribute("edit-profile-fail");
		if (msg1 == false) {
	%>
	<div class="toast-container" style="position: absolute; top: 10px; right: 10px;">
        <div class="toast fade show">
            <div class="toast-header bg-danger text-white">
                <strong class="me-auto"><i class="bi-globe"></i> Error!</strong>
                <small>just now</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast"></button>
            </div>
            <div class="toast-body">
               <h5><b> Something went wrong!!
            </b></h5>
            </div>
        </div>
        </div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	session.removeAttribute("edit-profile-fail");
	%>

    <div class="pagetitle">
      <h1>Profile</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="">Home</a></li>
          <li class="breadcrumb-item">Users</li>
          <li class="breadcrumb-item active">Profile</li>
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section profile">
      <div class="row">
        <div class="col-xl-4">

          <div class="card">
            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
				
				<%try{
              if(us.getProfile_photo()==null){
            	  %>
            	<img src="../user-images/avtar.jpg" alt="Profile" class="rounded-circle">
            	  <% 
              }else{
            	  %>
            	  <img src="../user-images/<%=us.getProfile_photo() %>" alt="Profile" class="rounded-circle">
            	  <h2><%=us.getFirst_name() %> <%=us.getLast_name() %></h2>
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>
              
              
              
              
              <div class="social-links mt-2">
                <a href="<%=us.getGithub_url() %>" class="twitter"><i class="bi bi-github"></i></a>
                <a href="<%=us.getPortfolio_url() %>" class="instagram"><i class="bi bi-globe"></i></a>
                <a href="<%=us.getLinkedin_url() %>" class="linkedin"><i class="bi bi-linkedin"></i></a>
              </div>
            </div>
          </div>

        </div>

        <div class="col-xl-8">

          <div class="card">
            <div class="card-body pt-3">
              <!-- Bordered Tabs -->
              <ul class="nav nav-tabs nav-tabs-bordered">

                <li class="nav-item">
                  <button class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview">Overview</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-edit">Edit Profile</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-settings">Settings</button>
                </li>

                <li class="nav-item">
                  <button class="nav-link" data-bs-toggle="tab" data-bs-target="#profile-change-password">Change Password</button>
                </li>

              </ul>
              <div class="tab-content pt-2">

                <div class="tab-pane fade show active profile-overview" id="profile-overview">
                  <h5 class="card-title">About</h5>
                  <%try{
              if(us.getAbout()==null){
            	  %>
            	<p class="small fst-italic" style="color: red">**Please Complete Your Profile</p>
            	  <% 
              }else{
            	  %>
            	 <p class="small fst-italic"><%=us.getAbout() %></p>
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>
              
                  

                  <h5 class="card-title">Profile Details</h5>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label ">Full Name</div>
                    <%try{
              if(us.getFirst_name()==null){
            	  %>
            	<div class="col-lg-9 col-md-8" style="color: red" >**Please Complete Your Profile</div>
            	  <% 
              }else{
            	  %>
            	<div class="col-lg-9 col-md-8"><%=us.getFirst_name() %> <%=us.getMiddle_name() %> <%=us.getLast_name() %></div>
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>
                                     </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-3 label">Gender</div>
                    <%try{
              if(us.getGender()==null){
            	  %>
            	<div class="col-lg-3 col-md-3" style="color: red" >**Incomplete</div>
            	  <% 
              }else{
            	  %>
            	<div class="col-lg-3 col-md-3"><%=us.getGender() %></div>
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>
                    
                    <div class="col-lg-3 col-md-3 label">DoB</div>
		<%try{
              if(us.getDob()==null){
            	  %>
            	<div class="col-lg-3 col-md-8" style="color: red" >**Incomplete</div>
            	  <% 
              }else{
            	  %>
            	<div class="col-lg-3 col-md-8"><%=us.getDob() %></div>
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Phone No</div>
                    <div class="col-lg-9 col-md-8"><%=us.getPhon_no() %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Email-Id</div>
                    <div class="col-lg-9 col-md-8"><%=us.getEmail_id() %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">UserName</div>
                    <div class="col-lg-9 col-md-8"><%=us.getUsername() %></div>
                  </div>

                  <div class="row">
                    <div class="col-lg-3 col-md-4 label">Verified Account</div>
                    <div class="col-lg-9 col-md-8"><b><i class="bi bi-check-circle-fill" style="color: green"></i></b></div>
                  </div>

                 

                </div>

                <div class="tab-pane fade profile-edit pt-3" id="profile-edit">

                  <!-- Profile Edit Form -->
                  <form action="../PersonalProfileController" method="post" enctype='multipart/form-data' >
                  
                    <div class="row mb-3">
                      <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                      <div class="col-md-8 col-lg-9">
                      <%try{
              if(us.getProfile_photo()==null){
            	  %>
            	<img src="../user-images/avtar.jpg" alt="Profile" >
            	  <% 
              }else{
            	  %>
            	  <img src="../user-images/<%=us.getProfile_photo() %>" alt="Profile" >
            	  
            	  <% 
              }}catch(Exception e){
            	  e.printStackTrace();
              }
              %>
                      
                       
                        <div class="pt-2">
                        <input type="hidden" value="<%=us.getUser_id() %>" name="id" >
                          <input type="file" name="photo" accept="image/*" >
                     
                          <!-- <a href="#" class="btn btn-primary btn-sm" title="Upload new profile image"><i class="bi bi-upload"></i></a></input>
                          <a href="#" class="btn btn-danger btn-sm" title="Remove my profile image"><i class="bi bi-tr ash"></i></a>-->
                        </div>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">First Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="fname" type="text" class="form-control" id="fullName" value="<%=us.getFirst_name() %>" >
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Middle Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="mname" type="text" class="form-control" id="fullName" value="<%=us.getMiddle_name() %>" >
                      </div>
                    </div>
                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Last Name</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="lname" type="text" class="form-control" id="fullName" value="<%=us.getLast_name()%>" >
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="about" class="col-md-4 col-lg-3 col-form-label">About</label>
                      <div class="col-md-8 col-lg-9">
                        <textarea name="about" class="form-control" id="about" style="height: 100px"><%=us.getAbout() %></textarea>
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="inputDate" class="col-md-4 col-lg-3 col-form-label">DoB</label>
                  <div class="col-md-8 col-lg-9">
                    <input name="dob" type="date" value="<%=us.getDob() %>" class="form-control">
                  </div>
                    </div>

                    <div class="row mb-3">
                       <label class="col-md-4 col-lg-3 col-form-label">Gender</label>
                  <div class="col-md-8 col-lg-9">
                    <select name="gender" class="form-select" aria-label="Default select example">
                      <option value="Male" selected>Male</option>
                      <option value="Female">Female</option>
                      <option value="Other">Other</option>
                    
                    </select>
                  </div>
                    </div>


                    <div class="row mb-3">
                      <label for="Twitter" class="col-md-4 col-lg-3 col-form-label">Github Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="github" type="url" class="form-control" id="Twitter" value="<%=us.getGithub_url() %>" >
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Facebook" class="col-md-4 col-lg-3 col-form-label">LinkedIn Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="linkedin" type="url" class="form-control" id="Facebook" value="<%=us.getLinkedin_url() %>" >
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="Instagram" class="col-md-4 col-lg-3 col-form-label">Portfolio Profile</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="portfolio" type="url" class="form-control" id="Instagram" value="<%=us.getPortfolio_url() %>" >
                      </div>
                    </div>

                    

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End Profile Edit Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-settings">

                  <!-- Settings Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Email Notifications</label>
                      <div class="col-md-8 col-lg-9">
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="changesMade" checked>
                          <label class="form-check-label" for="changesMade">
                            Changes made to your account
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="newProducts" checked>
                          <label class="form-check-label" for="newProducts">
                            Information on new products and services
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="proOffers">
                          <label class="form-check-label" for="proOffers">
                            Marketing and promo offers
                          </label>
                        </div>
                        <div class="form-check">
                          <input class="form-check-input" type="checkbox" id="securityNotify" checked disabled>
                          <label class="form-check-label" for="securityNotify">
                            Security alerts
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
                  </form><!-- End settings Form -->

                </div>

                <div class="tab-pane fade pt-3" id="profile-change-password">
                  <!-- Change Password Form -->
                  <form>

                    <div class="row mb-3">
                      <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="password" type="password" class="form-control" id="currentPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="newpassword" type="password" class="form-control" id="newPassword">
                      </div>
                    </div>

                    <div class="row mb-3">
                      <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter New Password</label>
                      <div class="col-md-8 col-lg-9">
                        <input name="renewpassword" type="password" class="form-control" id="renewPassword">
                      </div>
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-primary">Change Password</button>
                    </div>
                  </form><!-- End Change Password Form -->

                </div>

              </div><!-- End Bordered Tabs -->

            </div>
          </div>

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


</body>

</html>