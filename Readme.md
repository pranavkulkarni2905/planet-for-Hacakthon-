# WorkConnect

A project to tackle unemployment. Built under 24 hours in The-Blue-BIT Hackathon '23. By Team Voltus 2.0.


Workconnect is a Web based application or online platform that aims to address the issue of unemployment by providing resources and tools for job seekers to find employment opportunities, as well as connecting them with potential employers. It also provides additional resources such as resume building, and personalized job alerts. The goal of the project is to make it easier for job seekers to find employment and to help address the issue of unemployment in the community.

## 🟡PowerPoint Link
[Canva](https://www.canva.com/design/DAFbjHdF9bA/xNVc6JQqqGxKA_nvmlRBYw/view?utm_content=DAFbjHdF9bA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton)

## 🚀 Team
- [Arya Janjire](https://github.com/aryajanjire)
- [Pranav Kulkarni](https://github.com/pranavkulkarni2905)
- [Saurabh Asnare](https://github.com/saurabhasnare)
- [Vinayak Shete](https://github.com/vinayak182002)

## 🟡Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### ➡️Prerequisites
You will need to have Eclipse IDE, Oracle 10g Express Edition, Apache Tomcat v8.5 and Git Bash installed on your machine.
You can download them from the official website:

[Eclipse IDE](https://www.eclipse.org/downloads/) <br><br>
[Oracle 10g Express Edition](https://www.oracle.com/in/database/technologies/oracle-database-software-downloads.html) <br><br>
[Apache Tomcat v8.5](https://tomcat.apache.org/download-80.cgi)<br><br>
[Git Bash](https://gitforwindows.org/)

### ➡️Installing

1. Clone the repository to your local machine <br><br>
  `git clone https://github.com/The-Blue-BIT-Hackathon/23_Voltus-2.0.git` <br>
2. Open Eclipse IDE and Import the cloned Git Project <br><br>
 	`File > Import > Git > Git Project > Existing local repository > Add > Browse Project Directory > Click Finish` <br>
3. ADD JRE Library for imported project <br><br>
	`Right click on project name > Properties > Java Build Path > Libraries > Add Library > JRE System library > Workspace default JRE (jre1.8.0_271)`<br>
4. ADD External JARs into your imported project <br><br>
	`Right click on project name > Properties > Java Build Path > Libraries > Add External JARs > Attach Ojdbc14.jar file from the oracleexe folder at C Drive > Click Apply & Close` <br>
5. Change Database username & password in DBConnection.java file at "23_Voltus-2.0\src\main\java\com\job\DAO\DBConnection.java" <br><br>
	`jdbc:oracle:thin:@localhost:1521:xe", "your_username", "your_password`
6. Add Apache Tomcat Server into Eclipse IDE <br><br>
	Extract the zip file downloaded from Tomcat's official website.<br>
	`Go to Eclipse IDE > Windows > Show View > Servers > Create new server > Select Apache and its Tomcat version > Click next > Browse Tomcat installation directory > Select path as C:\Program Files\Apache Software Foundation\bin > Click Finish` <br>
7. ADD Apache Tomcat Server to your project <br><br>
	`Right click on project name > Properties > Server > Select existing Tomcat Server v8.5 > Click Apply & close`
8. Run all the Database queries into Oracle DB <br><br>
	`Go to db.sql file > Create tables in Oracle > Just copy paste those queries > Create sequences > trigger the tables`<br>
9. Open index.jsp from \src\main\webapp\index.jsp <br><br>
	`Right click on index.jsp > Run as > 1 Run on Server > Select Existing Server > Tomcat v8.5 Server > Click Finish` <br>
	After finishing server startup, our webpage will get loaded into default web browser and then you can start evaluating our project. <br>
## 🟡Built with

1. Frontend:  HTML, CSS, JavaScript, Bootstrap and JQuery. 

2. Backend: Java Server Pages (JSP),Web Servlets

3. Database: Oracle 10g Express Edition

4. Code editor: Eclipse IDE 2022-12 EE , Tomcat Server

5. Designing tool: Figma

## 🟡Modules

➡️`1. User Module`: WorkConnect provides every individual a dashboard with many functionalities included. The person can search for a a job, apply for one, create customized resume and many more. <br><br>
➡️`2. Admin Module`: WorkConnect provides an admin  dashboard which helps an admin to manage  the main two bodies that is users and recruiters and also it provides a space to post a non IT jobs.<br><br>
➡️`3. Recruiter Module`: WorkConnect provides every recruiter a dashboard with rich features like posting a job, checking the applications, shortlisting the candidates and other. <br>

## 🟡Features
#️⃣`1. Job Listing`: The platform will offer a comprehensive list of job openings in various industries and
locations. Users will be able to search and filter job listings based on their preferred job title,
location, and salary range. Both IT and Non IT jobs are listed based on the skills and preference of user. <br><br>
#️⃣`2. Application Tracking`: Users will be able to see which jobs they have applied for, the status of each application, and
receive reminders on follow-up tasks. <br><br>
#️⃣`3. Interview Preparation`: The platform will offer personalized career development resources and tools, including interview coaching, sample aptitude tests with quick result and YouTube videos recommendation for particular job interviews.<br><br>
#️⃣`4. Job Fit Score`: User will be given with a Job Fit Score for every job he/she applies. Requirter can find the best applicant easily using the score.<br><br>
#️⃣`5. Realtime Job Alerts based on skills`: user will be given with realtime job alerts when candidate posts any job and the skills required for the job matches with candidate skills.<br><br>
#️⃣`6. Expert Advice or Guidance`: Users will be able to interact with the experts verified by workconnect. Different purchase plans are also available for users. User can get in touch with the expert via chat or meeting call. <br><br>

## 🟡Main Features
- Responsive Web Design
- Professional Resume Builder
- Application Tracking
- Interview Preparation
- Filters Jobs by location , salary , job type,skills
- Job Post Alert/Notification Through Email
- Email Verification
- Mock Aptitude Tests
- Screening Exam With Audio and video AI proctoring <br><br>
