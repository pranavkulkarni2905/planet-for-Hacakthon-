
<%@page import="java.sql.ResultSet"%>
<%@page import="com.job.DAO.UserDAO"%>
<%@page import="com.job.DAO.AdminDAO"%>
<%@page import="com.job.model.question"%>
<%@page import="com.job.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
ServletContext sc1 = request.getServletContext();
User u = (User) sc1.getAttribute("user-login-success-context");
if (u == null) {
	//session.setAttribute("user-login", 404);
	response.sendRedirect("404.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>Start Exam</title>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
if (session.getAttribute("token") == null) {
	//response.sendRedirect(request.getContextPath() + "/LogOut.jsp");

}
%>
<script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="sweetalert2.all.min.js"></script>

<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">

<link rel="stylesheet" href="questionexamui.css">
<link rel="stylesheet" href="css/style.css">
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"
	type="text/javascript">
</script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js">
</script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel=”stylesheet” href=”css/bootstrap.css”>
<link rel=”stylesheet” href=”css/bootstrap-responsive.css”>

<link rel="stylesheet" type="text/css" href="ExamStyle.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
var count=0;

	 $(document).ready(function() {
	        $('body').bind('cut copy paste', function(e) {
	            e.preventDefault();
	        })
	        $('body').on("contextmenu", function(e) {
	            return false;
	        })
	    })
	    document.onselectstart=()=>{
	    	count=count+1;
	    	console.log(count);
	    	event.preventDefault();
	    	Swal.fire({
	    		  title: "Warning / Alert!!!",
	    		  text: "You Appear to get the help from other sources during examination. This may lead to registering copy case against you.",
	    		  icon: 'warning',
	    		  confirmButtonColor: '#d33',
	    		  //confirmButtonClass: "btn-danger",
	    		  confirmButtonText: 'Okay!',
	    		  closeOnConfirm: true
	    		}
	    	)
	    	
	    }
	   
	</script>



<script>
	document.addEventListener('visibilitychange',function(){
		document.title=document.visibilityState;
		var state = document.visibilityState;
		if(state ==='hidden'){
	    	count=count+1;
			console.log(count);
			Swal.fire({
	    		  title: "Warning / Alert!!!",
	    		  text: "You are switching tabs.Please dont do this. This may lead to registering copy case against you.",
	    		  icon: "warning",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay!",
	    		  closeOnConfirm: true
	    		}
	    	)
		}
		if(count>5){
			var x=document.getElementById("audio");
		  	x.play();

			Swal.fire({
	  		  title: "Warning / Alert!!!",
	  		  text: "Your Warning count exceeds the maximum count .This may lead to registering copy case against you.",
	  		  icon: "warning",
	  		  confirmButtonClass: "btn-danger",
	  		  confirmButtonText: "Okay!",
	  		  closeOnConfirm: true
	  		}
	  	)
		}
	});
	</script>
<script>
	
	</script>
<style>
.watermarked::before {
	position: fixed;
	top: -75%;
	left: -75%;
	display: block;
	width: 300%;
	height: 300%;
	transform: rotate(-45deg);
	content: attr(data-watermark);
	font-size: 30px;
	opacity: 0.15;
	line-height: 4em;
	letter-spacing: 2px;
	color: black;
	z-index: -1;
}

.quiz-container {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px 2px rgba(100, 100, 100, 0.1);
	width: 500px;
	height: 300px;
	overflow: hidden;
}

.quiz-header {
	padding: 1rem;
}

h2 {
	font-size: 22px;
	text-align: center;
	margin: 0;
}

ul {
	list-style-type: none;
	padding: 0;
}

ul li {
	font-size: 16px;
	margin: 1rem 0;
}

ul li label {
	cursor: pointer;
}

button {
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

button:hover {
	background-color: #04adc4;
}

button:focus {
	outline: none;
	background-color: #44b927;
}
</style>

</style>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();"
	onunload="">
	<div class="watermarked" data-watermark="<%=u.getEmail_id()%>"></div>

	<script>        
Array.from(document.querySelectorAll('.watermarked')).forEach(function(el) {
        el.dataset.watermark = (el.dataset.watermark + ' ').repeat(10000);
    });
</script>

	<%
	/* ServletContext sc = request.getServletContext();
	Question que[] = (Question[]) sc.getAttribute("que");
	Student stud = (Student) sc.getAttribute("student-obj");
	String exam_code = (String) sc.getAttribute("exam-code");
	String cName = (String) sc.getAttribute("course-name");
	String time = (String) session.getAttribute("exam-time");
	System.out.print(time);
	StartExamDAO exd = new StartExamDAO();
	questionDAO qd = new questionDAO();
	int size = qd.getLength(stud.getStudId(), exam_code);
	int i = exd.getCurr_que(stud.getStudId(), exam_code);

	sc.setAttribute("question", que[i]); */
	int jobid = Integer.parseInt(request.getParameter("jobid"));
	int appid = Integer.parseInt(request.getParameter("appid"));
	int userid = Integer.parseInt(request.getParameter("userid"));
	AdminDAO ad = new AdminDAO();
	UserDAO ud = new UserDAO();
	ResultSet rs1 = ud.getJobDetailsByJobId(jobid);
	question que[] = ad.getQueByCid();
	int i = 0,job=0;
	%>
	<div class="header">
		<div class="header-right">
			<a href="#" style="color: blue; font-size: 20px;">WorkConnect </a> 
			<a
				href="#home" style="color: blue; font-size: 20px;"><b>Student Name :</b> <%=u.getFirst_name() + " " + u.getLast_name()%></a>
			<a href="#contact" style="color: blue; font-size: 20px;"><b>JobTitle : </b> <%
 try {
 	if (rs1.next()) {
 		job=rs1.getInt(1);
 %> <%=rs1.getString(4)%> <%
 }
 } catch (Exception e) {

 }
 %> </a> <a href="#about"><b>Exam Code :</b> Apti101 </a>
		</div>
		
		
		
		<input type="hidden" value="20" id="time">
		<%-- <input
			type="hidden" value="<%=size%>" id="size"> --%>
		<p id="demo"></p>

		<audio id="audio">
			<source src="fire.ogg" type="audio/ogg">
			<source src="fire.mp3" type="audio/mpeg">
		</audio>

		<script>
		
var a=document.getElementById("time").value;
if(localStorage.getItem("count_timer")){
    var count_timer = localStorage.getItem("count_timer");
} else {
    var count_timer = parseInt(a*60);
}
var minutes = parseInt(count_timer/60);
var seconds = parseInt(count_timer%60);
function countDownTimer(){
    if(seconds < 10){
        seconds= "0"+ seconds ;
    }if(minutes < 10){
        minutes= "0"+ minutes ;
    }
    
    document.getElementById("demo").innerHTML = "Time Left : "+minutes+" min "+seconds+" s";
    if(count_timer <= 0){
         localStorage.clear("count_timer");
         
         // alert after time ends
         // var size=parseInt(document.getElementById("size").value);
          Swal.fire({
	    		  title: "Ooops!!!",
	    		  text: "Time Elapsed..",
	    		  icon: "error",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay!",
	    		  closeOnConfirm: true
	    		}
	    	)
          
         window.location.href="applied-jobs.jsp";
           //document.location.href='SaveServlet?size='+size;
          // document.form.submit();
        // document.getElementById('click').dispatchEvent(new MouseEvent("click"));

    } else {
        count_timer = count_timer -1 ;
        minutes = parseInt(count_timer/60);
        seconds = parseInt(count_timer%60);
        localStorage.setItem("count_timer",count_timer);
        setTimeout("countDownTimer()",1000);
    }
    //document.getElementById('myField').value=count_timer;
}
setTimeout("countDownTimer()",1000);

	
</script>


	</div>
	<div class="container">
		<div class="video">		
			<div class="row">
					<div class="card-body">
					<%-- <div class="card-title">
		
			<a href="#" style="color: blue; font: 40px;">WorkConnect </a> <a
				href="#home"><b>Student Name :</b> <%=u.getFirst_name() + " " + u.getLast_name()%></a>
			<a href="#contact"><b>JobTitle : </b> <%
 try {
 	if (rs1.next()) {
 %> <%=rs1.getString(4)%> <%
 }
 } catch (Exception e) {

 }
 %> </a> <a href="#about"><b>Exam Code :</b> Apti101 </a>
		</div> --%>
				<div class="card col-md-5">
						<div class="booth">
							<video id="video" width="80%" height="150%" autoplay>
							</video>
						</div>
					</div>
					
					<div class="col-md-7">
					<div class="quiz-container" id="quiz">
										<div class="quiz-header">
											<h2 id="question"><b>Question Text</b></h2>
											<ul>
												<li><input type="radio" name="answer" id="a"
													class="answer"> <label for="a" id="a_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="b"
													class="answer"> <label for="b" id="b_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="c"
													class="answer"> <label for="c" id="c_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="d"
													class="answer"> <label for="d" id="d_text">Answer</label>
												</li>
											</ul>
										</div>
										<button id="submit">Submit</button>
									</div>
									
									
									
							<div class="container3">
								<div class="border">
									<h3 class="text-center">Total Questions</h3>
									<%
									for (int j = 1; j <= 10; j++) {
									%>
									<a href="PaginationServlet?que=<%=j%>" class="btn btn-info"
										style="background-color: tomato;"> <%=j%></a>
									
									<%
									}
									%>
									<hr>
									<button type="button" style="background-color: red;"
										class="btn btn-info"><%=i%></button>
									<p style="float: right; margin-right: 85px; margin-top: 10px;">
										<b>Current Question</b>
									</p>
									<hr>
									<p></p>
									<hr>

								</div>
							</div>
						
					
					
					
					
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>

</script>
	<script>
    /* var stop = function () {
        var stream = video.srcObject;
        var tracks = stream.getTracks();
        for (var i = 0; i < tracks.length; i++) {
            var track = tracks[i];
            track.stop();
        }
        video.srcObject = null;
    }
    var start = function () {
        var video = document.getElementById('video'),
            vendorUrl = window.URL || window.webkitURL;
        if (navigator.mediaDevices.getUserMedia) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                    video.srcObject = stream;
                }).catch(function (error) {
                    console.log("Something went wrong!");
                });
        }
    }
    $(function () {
        start();
    });   */
    let video=document.getElementById("video")
    let model;

    const setupCamera = () => {
        navigator.mediaDevices.getUserMedia({
            video:{width:600 , height:400},
        })
        .then((stream) => {
            video.srcObject=stream;
        });
    };

    const detectFaces = async() => {
        const prediction=await model.estimateFaces(video,false);
        //console.log('inside detectFaces')
        //console.log(prediction)
        //console.log(prediction.length)
        if(prediction.length>1){
        	Swal.fire({
	    		  title: "Multiple Faces Detected!!!",
	    		  text: "It Seems you are taking help from other . This will lead to registering malpractise case",
	    		  icon: "error",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay!",
	    		  closeOnConfirm: true
	    		}
	    	)
        }
        else if(prediction.length===0){
        	Swal.fire({
	    		  title: "No Faces Detected!!!",
	    		  text: "It Seems you are taking help from other . This will lead to registering malpractise case",
	    		  icon: "error",
	    		  confirmButtonClass: "btn-danger",
	    		  confirmButtonText: "Okay!",
	    		  closeOnConfirm: true
	    		}
	    	)
        }

    }
    setupCamera();
    // video.addEventListener("loadeddata",async () => {
//         console.log('inside function')
//         model=await blazeface.load();
//         setInterval(detectFaces(),1000)
    // });

    video.addEventListener("loadeddata",setInterval(async () => {
        //console.log('inside function')
        model=await blazeface.load();
        detectFaces()
    }),1000);

</script>
	<script>
  //  var message = document.querySelector('#message');

var SpeechRecognition = SpeechRecognition || webkitSpeechRecognition;
var SpeechGrammarList = SpeechGrammarList || webkitSpeechGrammarList;

var grammar = '#JSGF V1.0;'

var recognition = new SpeechRecognition();
var speechRecognitionList = new SpeechGrammarList();
speechRecognitionList.addFromString(grammar, 1);
recognition.grammars = speechRecognitionList;
recognition.lang = 'en-US';
recognition.interimResults = false;

recognition.onresult = function(event) {
    var last = event.results.length - 1;
    var command = event.results[last][0].transcript;
  
    if(command!==null){
    	Swal.fire({
  		  title: "Voice Detected!!!",
  		  text: "It Seems you are Talking . This will lead to registering malpractise case",
  		  icon: "error",
  		  confirmButtonClass: "btn-danger",
  		  confirmButtonText: "Okay!",
  		  closeOnConfirm: true
  		}
  	)
    }
};

recognition.onspeechend = function() {
    recognition.stop();
};

recognition.onerror = function(event) {

}        



document.addEventListener('DOMContentLoaded',setInterval(function(){
    recognition.start();
}),1000)

</script>
	<%
	try {
		String msg = (String) session.getAttribute("answered");
		if (msg != null) {
	%>
	<script type="text/javascript">
			swal("You have already attempted this question.");
			</script>
	<%
	}
	} catch (Exception e) {

	}
	session.removeAttribute("answered");
	%>


	
							<%-- <h3>
									<b><%=que[i].getQuestionText()%></b>
								</h3> --%>
							<!-- <hr>
							<br>
							<div class="card col-md-12">
								<div class="card-body">
									<h5 class="card-title"></h5>

									<div class="quiz-container" id="quiz">
										<div class="quiz-header">
											<h2 id="question">Question Text</h2>
											<ul>
												<li><input type="radio" name="answer" id="a"
													class="answer"> <label for="a" id="a_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="b"
													class="answer"> <label for="b" id="b_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="c"
													class="answer"> <label for="c" id="c_text">Answer</label>
												</li>
												<li><input type="radio" name="answer" id="d"
													class="answer"> <label for="d" id="d_text">Answer</label>
												</li>
											</ul>
										</div>
										<button id="submit">Submit</button>
									</div>
 -->
									<%-- 	<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt1()%>" id="opt1"> <span><%=que[i].getOpt1()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt2()%>" id="opt1"> <span><%=que[i].getOpt2()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt3()%>" id="opt3"> <span><%=que[i].getOpt3()%></span>
									</label>
								</div>
								<hr>
								<div class="ans ml-2">
									<label class="radio"> <input type="radio" name="ans"
										value="<%=que[i].getOpt4()%>" id="opt4"> <span><%=que[i].getOpt4()%></span>
									</label>
								</div> --%>

								
						<%-- <input type="hidden" name="curr" value="<%=i+1%>">
					<button type="submit"
						style="margin-left: 350px; margin-top: 40px; background-color: blue;"
						formaction="PrevServlet" class="btn btn-info">Previous</button>

					<%
					if (i == 10 - 1) {
					%>
					<button type="submit" id="click" formaction="SaveServlet"
						style="margin-left: 5px; margin-top: 40px; background-color: red;"
						class="btn btn-success" class="next">End Exam</button>
 --%>
						<!-- <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Confirmation !!!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="color: red">
       Are You Sure to End Exam ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-warning" >End Exam</button>
      </div>
    </div>
  </div>
</div> -->
						<%-- <%
					} else {
					%>
					<button type="submit" formaction="SaveServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: green;"
						class="btn btn-success" class="next">Save</button>
					<button type="submit" formaction="NextServlet"
						style="margin-left: 50px; margin-top: 40px; background-color: blue;"
						class="btn btn-success" class="next">Next</button>
					<%
					}
					%>
					<h5 style="color: red; margin-left: 300px; margin-top: 40px;">
						<b>End Exam button will be available on Last Question</b>
					</h5>
				</div> --%>

						<%-- <div class="col-lg-6 text-center">
							<div class="container3">
								<div class="border">
									<h3 class="text-center">Total Questions</h3>
									<%
									for (int j = 1; j <= 10; j++) {
									%>
									<a href="PaginationServlet?que=<%=j%>" class="btn btn-info"
										style="background-color: tomato;"> <%=j%></a>
									<%
									}
									%>

									<hr>
									<button type="button" style="background-color: red;"
										class="btn btn-info"><%=i + 1%></button>
									<p style="float: right; margin-right: 85px; margin-top: 10px;">
										<b>Current Question</b>
									</p>
									<hr>
									<p></p>
									<hr>

								</div>
							</div>
						</div> --%>


						<script>
  const quizData = [
	    {
	        question: "<%=que[0].getQuestionText()%>",
	        a: "<%=que[0].getOpt1()%>",
	        b: "<%=que[0].getOpt2()%>",
	        c: "<%=que[0].getOpt3()%>",
	        d: "<%=que[0].getOpt4()%>",
	        correct: "c",
	    },
	    {
	    	question: "<%=que[1].getQuestionText()%>",
	        a: "<%=que[1].getOpt1()%>",
	        b: "<%=que[1].getOpt2()%>",
	        c: "<%=que[1].getOpt3()%>",
	        d: "<%=que[1].getOpt4()%>",
	        correct: "b",
	    },
	    {
	    	question: "<%=que[2].getQuestionText()%>",
	        a: "<%=que[2].getOpt1()%>",
	        b: "<%=que[2].getOpt2()%>",
	        c: "<%=que[2].getOpt3()%>",
	        d: "<%=que[2].getOpt4()%>",
	        correct: "c",
	    },
	    {
	    	question: "<%=que[3].getQuestionText()%>",
	        a: "<%=que[3].getOpt1()%>",
	        b: "<%=que[3].getOpt2()%>",
	        c: "<%=que[3].getOpt3()%>",
	        d: "<%=que[3].getOpt4()%>",
	        correct: "c",
	    },
	    {
	    	question: "<%=que[4].getQuestionText()%>",
	        a: "<%=que[4].getOpt1()%>",
	        b: "<%=que[4].getOpt2()%>",
	        c: "<%=que[4].getOpt3()%>",
	        d: "<%=que[4].getOpt4()%>",
	        correct: "d",
	    },
	    {
	    	question: "<%=que[5].getQuestionText()%>",
	        a: "<%=que[5].getOpt1()%>",
	        b: "<%=que[5].getOpt2()%>",
	        c: "<%=que[5].getOpt3()%>",
	        d: "<%=que[5].getOpt4()%>",
	        correct: "d",
	    },
	    {
	    	question: "<%=que[6].getQuestionText()%>",
	        a: "<%=que[6].getOpt1()%>",
	        b: "<%=que[6].getOpt2()%>",
	        c: "<%=que[6].getOpt3()%>",
	        d: "<%=que[6].getOpt4()%>",
	        correct: "c",
	    },
	    {
	    	question: "<%=que[7].getQuestionText()%>",
	        a: "<%=que[7].getOpt1()%>",
	        b: "<%=que[7].getOpt2()%>",
	        c: "<%=que[7].getOpt3()%>",
	        d: "<%=que[7].getOpt4()%>",
	        correct: "b",
	    },
	    {
	    	question: "<%=que[8].getQuestionText()%>",
	        a: "<%=que[8].getOpt1()%>",
	        b: "<%=que[8].getOpt2()%>",
	        c: "<%=que[8].getOpt3()%>",
	        d: "<%=que[8].getOpt4()%>",
	        correct: "a",
	    },
	    {
	    	question: "<%=que[9].getQuestionText()%>",
	        a: "<%=que[9].getOpt1()%>",
	        b: "<%=que[9].getOpt2()%>",
	        c: "<%=que[9].getOpt3()%>",
	        d: "<%=que[9].getOpt4()%>",
	        correct: "b",
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
	    	   alert('Exam Submitted successfully');
	    	   window.location.replace("../UpdateScoreController?score="+score+"&userid="+<%=u.getUser_id()%>+"&jobid="+<%=job%>);
	           //quiz.innerHTML ="<h2 style='margin:130px;'>Your Score is : "+ score + "/"+quizData.length+"</h2>"
	          
	       }
	    }
	})
  
  
  </script>

						<script
							src="http://sibeeshpassion.com/content/scripts/jquery-1.11.1.min.js"></script>
						<script>  
document.onkeypress = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
document.onmousedown = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
document.onkeydown = function (event) {  
event = (event || window.event);  
if (event.keyCode == 123) {  
return false;  
}  
}  
</script>
						<script>
document.addEventListener("keydown", function(e){
  // USE THIS TO DISABLE CONTROL AND ALL FUNCTION KEYS
  // if (e.ctrlKey || (e.keyCode>=112 && e.keyCode<=123)) {
  // THIS WILL ONLY DISABLE CONTROL AND F12
  if (e.ctrlKey || e.keyCode==123) {
    e.stopPropagation();
    e.preventDefault();
  }
});
</script>
						<script type="text/javascript">
       // window.addEventListener('beforeunload', function (e) {
          //  e.preventDefault();
            //e.returnValue = '';
        //});
    </script>
						<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
						<script
							src="https://cdn.jsdelivr.net/npm/@tensorflow-models/blazeface"></script>
						<script src="cam.js"></script>
</body>
</html>