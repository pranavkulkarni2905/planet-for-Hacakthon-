<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demo Quiz</title>
    <script src="sweetalert2.all.min.js"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="sweetalert2.all.min.js"></script>

<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">
</head>
<style>
.content {
  margin-top: 54px;
}
.header {
  padding: 15px;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 9999;
}
.left-title {
  width: 80px;
  color: #fff;
  font-size: 15px;
  float: left;
}
.right-title {
  width: 150px;
  text-align: right;
  float: right;
  color: #fff;
}
.quiz-body {
  margin-top: 15px;
  padding-bottom: 50px;
}
.option-block-container {
  margin-top: 25px;
  max-width: 600px;
}
.option-block {
  padding: 10px;
  background: aliceblue;
  border: 1px solid #84c5fe;
  margin-bottom: 10px;
  cursor: pointer;
}
.result-question {
  font-weight: bold;
}
.c-wrong {
  margin-left: 20px;
  color: #ff0000;
}
.c-correct {
  margin-left: 20px;
  color: green;
}
.last-row {
  border-bottom: 1px solid #ccc;
  padding-bottom: 25px;
  margin-bottom: 25px;
}
.res-header {
  border-bottom: 1px solid #ccc;
  margin-bottom: 15px;
  padding-bottom: 15px;
}
#videoElement {
	width: 300px;
  margin-top: 25px;
  margin-left: 550px;
	height: 200px;
  border-radius: 10%;
  border:2px solid black;
	background-color: #666;
}
.Instructions{
  background: aliceblue;
  margin-left: 750px;
  margin-top: 20px;
  
  border: 1px solid #4ea7f5;
  padding-right: 50px;
 
}
.Instructions .h4{
  
  margin-top:20px;  
}
</style>
<body>
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
    <header class="header bg-primary">
        <div class="left-title">Aptitude Test</div>
        <div class="right-title">Total Questions: <span id="tque"></span></div><br>
        <div class="right-title"><span id="iTimeShow">Time Limit </span><span id="timer"></span></div>

        <div class="clearfix"></div>
    </header><br>
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-5">
                    <div id="result" class="quiz-body">
                        <form name="quizForm" onSubmit="">
                            <fieldset class="form-group">
                                <h4><span id="qid">1.</span> <span id="question"></span></h4>
                                <div class="option-block-container" id="question-options"> </div>
                                <!-- End of option block -->
                            </fieldset> <button name="previous" id="previous" class="btn btn-primary">Previous</button>
                            &nbsp; <button name="next" id="next" class="btn btn-primary">Next</button>
                        </form>
                    </div>
                </div> <!-- End of col-sm-12 -->
                <br>
                <video autoplay="true" id="videoElement">
	
                </video>
               
                </div>
        </div> <!-- ENd of container fluid -->

    </div> <!-- End of content -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
    <script src="app.js"></script>
    <script>
    /* Created and coded by Abhilash Narayan */
    /* Quiz source: w3schools.com */

    var quiz = { "JS" : [
    	{
    		"id" : 1,
    		"question" : "The difference between a two-digit number and the number obtained by interchanging the positions of its digits is 36. What is the difference between the two digits of that number?",
    		"options" : [
    			{"a": "3", 
    			 "b":"4", 
    			 "c":"9", 
    			 "d":"Cannot be determined"}
    			],
    		"answer":"4",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 2,
    		"question" : "When it was feared that the serfs might go too far and gain their freedom from serfdom, the protestant leaders joined the princes at crushing them.",
    		"options" : [
    			{
    			"a":"into crushing",
    			"b":"in crushing",
    			"c":"without crushing",
    			"d":"No improvement"}
    			],
    		"answer":"in crushing",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 3,
    		"question" : "If you're a fitness walker, there is no need for a commute to a health club. Your neighborhood can be your health club. You don't need a lot of fancy equipment to get a good workout either. All you need is a well-designed pair of athletic shoes. This paragraph best supports the statement that",
    		"options" : [
    			{"a": "fitness walking is a better form of exercise than weight lifting.", 
    			 "b":"a membership in a health club is a poor investment.", 
    			 "c":"walking outdoors provides a better workout than walking indoors.",
    			"d":"fitness walking is a convenient and valuable form of exercise."}
    			],
    		"answer":"fitness walking is a convenient and valuable form of exercise.",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 4,
    		"question" : "If the legislature decides to fund the agricultural subsidy program, national radio, and the small business loan program, what two other programs could they fund?",
    		"options" : [
    			{"a": "harbor improvements and international airport", 
    			 "b":"harbor improvements and school music program",
    			 "c":"hurricane preparedness and school music program",
    			 "d":" hurricane preparedness and international airport",
    			}
    			],
    		"answer":"harbor improvements and school music program",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 5,
    		"question" : "How do you write &quot;Hello World&quot; in an alert box?",
    		"options" : [
    			{"a": "alertBox(&quot;Hello World&quot;);", 
    			 "b":"msg(&quot;Hello World&quot;);",
    			 "c":"alert(&quot;Hello World&quot;);",
    			 "d":"msgBox(&quot;Hello World&quot;);",
    			}
    			],
    		"answer":"alert(&quot;Hello World&quot;);",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 6,
    		"question" : "A milk vendor has 2 cans of milk. The first contains 25% water and the rest milk. The second contains 50% water. How much milk should he mix from each of the containers so as to get 12 litres of milk such that the ratio of water to milk is 3 : 5?",
    		"options" : [
    			{"a": "4 litres, 8 litres", 
    			 "b":"6 litres, 6 litres",
    			 "c":"5 litres, 7 litres",
    			 "d":"7 litres, 5 litres ",
    			}
    			],
    		"answer":"6 litres, 6 litres",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 7,
    		"question" : "A man buys Rs. 20 shares paying 9% dividend. The man wants to have an interest of 12% on his money. The market value of each share is:",
    		"options" : [
    			{"a": "Rs. 12", 
    			 "b":"Rs. 15",
    			 "c":"Rs. 18",
    			 "d":"Rs. 21"
    			}
    			],
    		"answer":"myFunction()",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 8,
    		"question" : "How to write an IF statement in JavaScript?",
    		"options" : [
    			{"a": "if i = 5 then", 
    			 "b":"if i == 5 then",
    			 "c":"if (i == 5)",
    			 "d":" if i = 5",
    			}
    			],
    		"answer":"if (i == 5)",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 9,
    		"question" : "Running at the same constant rate, 6 identical machines can produce a total of 270 bottles per minute. At this rate, how many bottles could 10 such machines produce in 4 minutes?",
    		"options" : [
    			{"a": "648", 
    			 "b":"1800",
    			 "c":"2700",
    			 "d":"10800"
    			}
    			],
    		"answer":"1800",
    		"score":0,
    		"status": ""
    	},
    	{
    		"id" : 10,
    		"question" : "	In how many different ways can the letters of the word 'CORPORATION' be arranged so that the vowels always come together?",
    		"options" : [
    			{"a": "810", 
    			 "b":"1440",
    			 "c":"2880",
    			 "d":"50400",
    			}
    			],
    		"answer":"50400",
    		"score":0,
    		"status": ""
    	},
    	
    	
    	]
    }



    var quizApp = function() {

    	this.score = 0;		
    	this.qno = 1;
    	this.currentque = 0;
    	var totalque = quiz.JS.length;

    	
    	this.displayQuiz = function(cque) {
    		this.currentque = cque;
    		if(this.currentque <  totalque) {
    			$("#tque").html(totalque);
    			$("#previous").attr("disabled", false);
    			$("#next").attr("disabled", false);
    			$("#qid").html(quiz.JS[this.currentque].id + '.');
    	
    			
    			$("#question").html(quiz.JS[this.currentque].question);	
    			 $("#question-options").html("");
    			for (var key in quiz.JS[this.currentque].options[0]) {
    			  if (quiz.JS[this.currentque].options[0].hasOwnProperty(key)) {
    		
    				$("#question-options").append(
    					"<div class='form-check option-block'>" +
    					"<label class='form-check-label'>" +
    							  "<input type='radio' class='form-check-input' name='option'   id='q"+key+"' value='" + quiz.JS[this.currentque].options[0][key] + "'><span id='optionval'>" +
    								  quiz.JS[this.currentque].options[0][key] +
    							 "</span></label>"
    				);
    			  }
    			}
    		}
    		if(this.currentque <= 0) {
    			$("#previous").attr("disabled", true);	
    		}
    		if(this.currentque >= totalque) {
    				$('#next').attr('disabled', true);
    				for(var i = 0; i < totalque; i++) {
    					this.score = this.score + quiz.JS[i].score;
    				}
    			return this.showResult(this.score);	
    		}
    	}
    	
    	this.showResult = function(scr) {
    		$("#result").addClass('result');
    		$("#result").html("<h1 class='res-header'>Total Score: &nbsp;" + scr  + '/' + totalque + "</h1>");
    		for(var j = 0; j < totalque; j++) {
    			var res;
    			if(quiz.JS[j].score == 0) {
    					res = '<span class="wrong">' + quiz.JS[j].score + '</span><i class="fa fa-remove c-wrong"></i>';
    			} else {
    				res = '<span class="correct">' + quiz.JS[j].score + '</span><i class="fa fa-check c-correct"></i>';
    			}
    			$("#result").append(
    			'<div class="result-question"><span>Q ' + quiz.JS[j].id + '</span> &nbsp;' + quiz.JS[j].question + '</div>' +
    			'<div><b>Correct answer:</b> &nbsp;' + quiz.JS[j].answer + '</div>' +
    			'<div class="last-row"><b>Score:</b> &nbsp;' + res +
    			
    			'</div>' 
    			
    			);
    			
    		}
    	}
    	
    	this.checkAnswer = function(option) {
    		var answer = quiz.JS[this.currentque].answer;
    		option = option.replace(/\</g,"&lt;")   //for <
    		option = option.replace(/\>/g,"&gt;")   //for >
    		option = option.replace(/"/g, "&quot;")

    		if(option ==  quiz.JS[this.currentque].answer) {
    			if(quiz.JS[this.currentque].score == "") {
    				quiz.JS[this.currentque].score = 1;
    				quiz.JS[this.currentque].status = "correct";
    		}
    		} else {
    			quiz.JS[this.currentque].status = "wrong";
    		}
    		
    	}	
    	 
    	this.changeQuestion = function(cque) {
    			this.currentque = this.currentque + cque;
    			this.displayQuiz(this.currentque);	
    			
    	}
    	
    }


    var jsq = new quizApp();

    var selectedopt;
    	$(document).ready(function() {
    			jsq.displayQuiz(0);		
    		
    	$('#question-options').on('change', 'input[type=radio][name=option]', function(e) {

    			//var radio = $(this).find('input:radio');
    			$(this).prop("checked", true);
    				selectedopt = $(this).val();
    		});
    		
    			
    			 
    	});

    	
    	
    	
    	$('#next').click(function(e) {
    			e.preventDefault();
    			if(selectedopt) {
    				jsq.checkAnswer(selectedopt);
    			}
    			jsq.changeQuestion(1);
    	});	
    	
    	$('#previous').click(function(e) {
    		e.preventDefault();
    		if(selectedopt) {
    			jsq.checkAnswer(selectedopt);
    		}
    			jsq.changeQuestion(-1);
    	});	


    	// var sec = 60;
    	// var time = setInterval(myTimer, 1000);
    	var video = document.querySelector("#videoElement");

    	if (navigator.mediaDevices.getUserMedia) {
    	navigator.mediaDevices.getUserMedia({ video: true })
    		.then(function (stream) {
    		video.srcObject = stream;
    		})
    		.catch(function (err0r) {
    		console.log("Something went wrong!");
    		});
    	} 
    	
    	/* let video=document.getElementById("video")
        let model;

        const setupCamera = () => {
            navigator.mediaDevices.getUserMedia({
                video:{width:600 , height:400},
            })
            .then((stream) => {
                video.srcObject=stream;
            });
        }; */
    	
    	
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
//    	         console.log('inside function')
//    	         model=await blazeface.load();
//    	         setInterval(detectFaces(),1000)
    	    // });

    	    video.addEventListener("loadeddata",setInterval(async () => {
    	        //console.log('inside function')
    	        model=await blazeface.load();
    	        detectFaces()
    	    }),1000);

    		
    		var countDownDate = new Date("Mar 12, 2023 12:00:00").getTime();

    		var x = setInterval(function() {

    		var now = new Date().getTime();

    	
    		var distance=countDownDate-now;

    	
    	
    		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    	
    		document.getElementById("timer").innerHTML =   minutes + "m " + seconds + "s ";

    		if (distance < 0) {
    			clearInterval(x);
    			document.getElementById("timer").innerHTML = "EXPIRED";
    		}
    		}, 1000);

    	function stop(e) {
    		var stream = video.srcObject;
    		var tracks = stream.getTracks();
    	  
    		for (var i = 0; i < tracks.length; i++) {
    		  var track = tracks[i];
    		  track.stop();
    		}
    	  
    		video.srcObject = null;
    	  }
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
</body>
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
<script src="https://cdn.jsdelivr.net/npm/@tensorflow/tfjs"></script>
						<script
							src="https://cdn.jsdelivr.net/npm/@tensorflow-models/blazeface"></script>
						<script src="cam.js"></script>

</html>