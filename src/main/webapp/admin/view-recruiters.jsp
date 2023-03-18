<%@page import="com.job.DAO.RecruiterDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="404.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap.min.js"></script>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>WorkConnect Recruiters</title>
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
<link href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap.min.css" rel="stylesheet">


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
			<h1>Verified Recruiters</h1>
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="">Home</a></li>
					<li class="breadcrumb-item">Admin</li>
					<li class="breadcrumb-item active">View Recruiters</li>
				</ol>
			</nav>
		</div>
		<!-- End Page Title -->

		<table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
            <tr>
            	<th>SrNo</th>
            	<th>RecruiterID</th>
                <th>HRName</th>
                <th>HRPhoneNo</th>
                <th>HREmail</th>
                <th>CompanyName</th>
                <th>CompanyWebsite</th>
                <th>CompanyCity</th>
                <th>CompanyState</th>
                <th>CompanyCountry</th>
                <th>RegistrationNo</th>
                <th>RegisteredDate</th>
                <th>Verified</th>
            </tr>
        </thead>
        <tbody>
        <%
        RecruiterDAO ud=new RecruiterDAO();
        ResultSet rs=ud.getAllRecruiters();
        int i=1;
        while(rs.next()){
        	%>
        	<tr>
                <td><%=i %></td>
                <td><%=rs.getInt(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                 <td><%=rs.getString(5) %></td>
                  <td><%=rs.getString(8) %></td>
                   <td><%=rs.getString(15) %></td>
                    <td><%=rs.getString(16) %></td>
                     <td><%=rs.getString(17) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
                 <td>
                 <%
                 if(rs.getString(21).equals("Yes")){
                	 %>
                	 <i class="bi bi-check-circle-fill" style="color: green"></i>
                	 <% 
                 }else{
                	 %>
                	 <i class="bi bi-question-circle" style="color: red"></i>
                	 <% 
                 }
                 %>
                 </td>
            </tr>
        	<% 
        	i++;
        }
        %>
            
            
        </tbody>
        <tfoot>
            <tr>
               <th>SrNo</th>
            	<th>RecruiterID</th>
                <th>HRName</th>
                <th>HRPhoneNo</th>
                <th>HREmail</th>
                <th>CompanyName</th>
                <th>CompanyWebsite</th>
                <th>CompanyCity</th>
                <th>CompanyState</th>
                <th>CompanyCountry</th>
                <th>RegistrationNo</th>
                <th>RegisteredDate</th>
                <th>Verified</th>
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
	$(document).ready(function () {
	    $('#example').DataTable();
	});
	</script>



</body>

</html>