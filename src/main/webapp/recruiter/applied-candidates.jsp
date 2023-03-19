<%@page import="com.google.zxing.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp"%>
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Applied candidates</title>
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
</head>

<body>
	<%@ include file="_header.jsp"%>
	<%@ include file="_sidebar.jsp"%>

	<%
	int i1 = 0;
	try {
		UserDAO ud1 = new UserDAO();

		int id = Integer.parseInt(request.getParameter("id"));
		int flag = Integer.parseInt(request.getParameter("flag"));
		int appid = Integer.parseInt(request.getParameter("appid"));
		String resume_status = request.getParameter("resume-status");
		String apti_status = request.getParameter("apti-status");
		String interview_status = request.getParameter("interview-status");
		String reject = request.getParameter("reject");
		String reason=request.getParameter("reason");
		
		//ResultSet rs2 = ud1.getJobIdByRecIdAndUserId(id, u.getRecruiterId());
		//ResultSet rs2 = ud1.getAllCandidatesById(u.getRecruiterId());
		//int appid=0;
		//if(rs2.next()){
			//appid=rs2.getInt(1);
	//	}
		if (resume_status != null && flag!=1) {
			i1 = ud1.updateShortlistResumeStatus(id,appid);
		} else if (apti_status != null && flag!=2) {
			i1 = ud1.updateShortlistAptiStatus(id,appid);
		} else if (interview_status != null && flag!=3) {
			i1 = ud1.updateShortlistInterviewStatus(id,appid);
		} else if(flag!=4){
			i1 = ud1.updateShortlistRejectStatus(id,appid,reason);
		}
	} catch (Exception e) {

	}
	%>
	<%
	try {

		if (i1 > 0) {
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
					<b> Status Changed successfully!! </b>
				</h5>
			</div>
		</div>
	</div>
	<%
	}

	} catch (Exception e) {
	//e.printStackTrace();
	}
	%>

	<main id="main" class="main">


		<div class="pagetitle">
			<h1>Applied Candidates</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="">Home</a></li>
					<li class="breadcrumb-item">Recruiter</li>
					<li class="breadcrumb-item active">Candidates</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<table id="example" class="table table-striped table-bordered"
			style="width: 100%">
			<thead>
				<tr>
					<th>SrNo</th>
					<th>Application Id</th>
					<th>CandidateName</th>
					<th>JFS</th>
					<th>JobTitle</th>
					
					<th>Subjective Answers</th>
					<th>Aptitude Marks</th>
					<th>Resume</th>
					<th>WorkConnectProfile</th>

					<th>Submitted Date</th>
					<th>Resume Shortlist</th>
					<th>Aptitude Shortlist</th>
					<th>Interview Shortlist</th>
					<th>Reject</th>
				</tr>
			</thead>
			<tbody>
				<%try{
				UserDAO ud = new UserDAO();
				ResultSet rs = ud.getAllCandidatesById(u.getRecruiterId());
				int i = 1;
				while (rs.next()) {
					User u1 = ud.getUserDataById(rs.getInt(3));
					ResultSet rs2 = ud.getJobDetailsByJobId(rs.getInt(4));
					if (rs2.next()) {
				%>
				<tr>
					<td><%=i%></td>
					<td><%=rs.getInt(1)%></td>
					<td><%=u1.getFirst_name() + " " + u1.getLast_name()%></td>
					
					
					<td style="color:green">
					
					<b><%=rs.getString(15)%> %</b>
					
						</td>
						
					<td><%=rs2.getString(4)%></td>
					
					<td><a href="subjective.jsp?que1=<%=rs.getString(6) %>&que2=<%=rs.getString(7) %>"
						 class="btn btn-primary">View</a></td>
					
					
					
					<td>
						<%
						if (rs.getInt(9) == 0) {
						%> - <%
						} else {
						%> <%=rs.getInt(9)%> <%
 }
 %>
					</td>
					<td><a href="../resume/<%=rs.getString(5)%>" target="_blank"
						><i class="bx bxs-show  " style='font-size:1rem'></i></a></td>

					<td><a href="view-users-profile.jsp?userid=<%=rs.getInt(3)%>"
						target="_blank" ><i class="bx bxs-show  " style='font-size:1rem'></i></a></td>

					<td><%=rs.getString(12)%></td>
					
					<td>
						<%
						if (rs.getString(8)==null) {
						%>  
						<a
						href="applied-candidates.jsp?resume-status=Yes&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>"
						 class="btn "><i class="bi bi-check-circle"
							style="color: green"></i> </a>
						
						 <%
 }else if(rs.getString(8).equals("No")&&rs.getString(10).equals("No")&&rs.getString(11).equals("No")){
	 %>
	 <i class="bi bi-question-circle" style="color: red"></i>
	 <%
	 
 }
						else {
 %> <i class="bi bi-check-circle-fill" style="color: green"></i><%
 }
 %>
					</td>
					
					
					<td>
						<%
						if (rs.getString(10)==null) {
						%> 
						<a
						href="applied-candidates.jsp?apti-status=Yes&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>"
						class="btn "><i class="bi bi-check-circle"
							style="color: green"></i> </a>
						
						<%
 } else if(rs.getString(8).equals("No")&&rs.getString(10).equals("No")&&rs.getString(11).equals("No")){
	 %>
	 <i class="bi bi-question-circle" style="color: red"></i>
	 <% 
 }
						else {
 %>  
 <i class="bi bi-check-circle-fill" style="color: green"></i>
  <%
 }
 %> 
</td>

 
 
					<td>
					
					<%
						if (rs.getString(11)==null ) {
						%> 
						 <a
						href="applied-candidates.jsp?interview-status=Yes&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>"
						 class="btn "><i class="bi bi-check-circle"
							style="color: green"></i> </a> 
						
						<%
 } else if(rs.getString(8).equals("No")&&rs.getString(10).equals("No")&&rs.getString(11).equals("No")){
	 %>
	<i class="bi bi-question-circle" style="color: red"></i>
	 <% 
 }
						else {
 %> <i class="bi bi-check-circle-fill" style="color: green"></i> <%
 
 }
 %> 
					</td>
					
					<td>
					
					<%
						if (rs.getString(11)==null) {
						%> <%-- <a
						href="applied-candidates.jsp?reject=No&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>"
						 class="btn"><i class="bi bi-question-circle"
							style="color: red"></i></a>  --%>
							<button data-bs-toggle="modal" data-bs-target="#largeModal"><i class="bi bi-question-circle"
							style="color: red"></i></button>
							<%
 } else if(rs.getString(8).equals("Yes")&&rs.getString(10).equals("Yes")&&rs.getString(11).equals("Yes")){
	 %>
	 <i class="bi bi-check-circle" style="color: green">Selected</i>
	 <% 
 }
						else {
 %> <i class="bi bi-question-circle" style="color: red">Rejected</i> <%
 
 }
 %> 
					</td>
					
					<div class="modal fade" id="largeModal"  tabindex="-1">
						<div class="modal-dialog modal-dialog-centered modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Rejected Reason</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Close"></button>
								</div>
								<div class="modal-body">

									<form class="row g-3 needs-validation"
												action="applied-candidates.jsp?reject=No&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>" method="post"
												novalidate>
												<div class="col-md-8">
													<label for="inputPassword5" class="form-label"><b>Specify reason to reject candidate</b></label>
													<textarea type="text" name="reason"
														class="form-control" id="inputPassword5"></textarea>
												</div>
												<button type="submit" class="btn btn-primary m-3"
										data-bs-dismiss="modal">Submit</button>
												</form>
												
								</div>
								<div class="modal-footer">
								
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</div>
					</div>
					<%-- <script>
 function fun(){
	 
	 
	 
	Swal.fire({
		    title: "Reject Reason",
		    text: "Please specify why you are rejecting candidate",
		    input: 'text',
		    showCancelButton: true        
		}).then((result) => {
			if (result.value) {
		     window.location.href="applied-candidates.jsp?reject=No&id=<%=rs.getInt(3)%>&appid=<%=rs.getInt(1) %>&flag=<%=rs.getInt(14)%>&reason=result.value";
			}
		}); 
 }
 </script> --%>
				</tr>
				<%
				i++;
				}
				}
				}catch(Exception e){
					
				}
				%>


			</tbody>
			<tfoot>
				<tr>
					<th>SrNo</th>
					<th>Application Id</th>
					<th>CandidateName</th>
					<th>JFS</th>
					<th>JobTitle</th>
					
					<th>Subjective Answers</th>
					<th>Aptitude Marks</th>
					<th>Resume</th>
					<th>WorkConnectProfile</th>

					<th>Submitted Date</th>
					<th>Resume Shorlist</th>
					<th>Aptitude Shorlist</th>
					<th>Interview Shorlist</th>
					<th>Reject</th>
				</tr>
			</tfoot>
		</table>

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

	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>



</body>

</html>