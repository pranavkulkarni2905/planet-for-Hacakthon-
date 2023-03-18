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
  
  <style>
  .quiz-container{
  background-color: #fff;
  border-radius: 10px;
  /* box-shadow: 0 0 10px 2px rgba(100, 100, 100, 0.1); */
  width: 500px;
  height: 300px;
  overflow: hidden;
}
.quiz-header{
  padding: 1rem;
}
h2{
  font-size: 18px;
  
  text-align: center;
  margin: 0;
}
ul{
  list-style-type: none;
  padding: 0;
}
ul li{
  font-size: 16px;
  margin: 1rem 0;
}
ul li label{
  cursor: pointer;
}
button{
  background-color: #03cae4;
  
  color: #fff;
  border: none;
  display: block;
  width: 50%;
  cursor: pointer;
  font-size: 1rem;
  font-family: inherit;
  padding: 1rem;
}
button:hover{
  background-color: #04adc4;
}
button:focus{
  outline: none;
  background-color: #44b927;
}
  
  </style>
  
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
          <li class="breadcrumb-item">Skill Assessment</li>
          <li class="breadcrumb-item active">Assessment</li>
          
          
        </ol>
      </nav>
    </div><!-- End Page Title -->

    <section class="section dashboard">
    	
    
    <div class="card col-md-7">
    	<div class="card-body">
    		<h5 class="card-title"> Java Assessment</h5>
    		
   	<div class="quiz-container" id="quiz">
    <div class="quiz-header">
      <h2 id="question">Question Text</h2>
      <ul>
        <li>
          <input type="radio" name="answer" id="a" class="answer">
          <label for="a" id="a_text">Answer</label>
        </li>
        <li>
          <input type="radio" name="answer" id="b" class="answer">
          <label for="b" id="b_text">Answer</label>
        </li>
        <li>
          <input type="radio" name="answer" id="c" class="answer">
          <label for="c" id="c_text">Answer</label>
        </li>
        <li>
          <input type="radio" name="answer" id="d" class="answer">
          <label for="d" id="d_text">Answer</label>
        </li>
      </ul>
    </div>
    <button id="submit">Submit</button>
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
  
  <script>
  const quizData = [
	    {
	        question: "When an array is passed to a method, what does the method receive?",
	        a: "The reference of array",
	        b: "A copy of array",
	        c: "Legth of array",
	        d: "Copy of first element",
	        correct: "a",
	    },
	    {
	        question: "Which of the following option leads to the portability and security of Java?",
	        a: "Bytecode is executed by JVM",
	        b: "The applet makes the Java code secure and portable",
	        c: "Use of exception handling",
	        d: "Dynamic binding between objects",
	        correct: "a",
	    },
	    {
	        question: "_____ is used to find and fix bugs in the Java programs.",
	        a: "JVM",
	        b: "JRE",
	        c: "JDK",
	        d: "JDB",
	        correct: "a",
	    },
	    {
	        question: "Evaluate the following Java expression, if x=3, y=5, and z=10:    ++z + y - y + z + x++",
	        a: "24",
	        b: "23",
	        c: "20",
	        d: "25",
	        correct: "d",
	    },
	    {
	        question: "Which of the following is true about the anonymous inner class?",
	        a: "It has only methods",
	        b: "Objects can't be created",
	        c: "It has a fixed class name",
	        d: "It has no class name",
	        correct: "d",
	    },
	    {
	        question: " Which package contains the Random class?",
	        a: "java.util package",
	        b: "java.lang package",
	        c: "java.awt package",
	        d: "java.io package",
	        correct: "a",
	    },
	    
	];
	const quiz= document.getElementById('quiz')
	const answerEls = document.querySelectorAll('.answer')
	const questionEl = document.getElementById('question')
	const a_text = document.getElementById('a_text')
	const b_text = document.getElementById('b_text')
	const c_text = document.getElementById('c_text')
	const d_text = document.getElementById('d_text')
	const submitBtn = document.getElementById('submit')
	let currentQuiz = 0
	let score = 0
	loadQuiz()
	function loadQuiz() {
	    deselectAnswers()
	    const currentQuizData = quizData[currentQuiz]
	    questionEl.innerText = currentQuizData.question
	    a_text.innerText = currentQuizData.a
	    b_text.innerText = currentQuizData.b
	    c_text.innerText = currentQuizData.c
	    d_text.innerText = currentQuizData.d
	}
	function deselectAnswers() {
	    answerEls.forEach(answerEl => answerEl.checked = false)
	}
	function getSelected() {
	    let answer
	    answerEls.forEach(answerEl => {
	        if(answerEl.checked) {
	            answer = answerEl.id
	        }
	    })
	    return answer
	}
	submitBtn.addEventListener('click', () => {
	    const answer = getSelected()
	    if(answer) {
	       if(answer === quizData[currentQuiz].correct) {
	           score++
	       }
	       currentQuiz++
	       if(currentQuiz < quizData.length) {
	           loadQuiz()
	       } else {
	           quiz.innerHTML ="<h2 style='margin:130px;'>Your Score is : "+ score + "/"+quizData.length+"</h2>"
	          
	       }
	    }
	})
  
  
  </script>
  
  
  
  <script src="../assets/js/main.js"></script>
  
  <script src="../assets/css/saber-toast.js"></script>
<script src='./assets/css/script.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 -->
</body>

</html>