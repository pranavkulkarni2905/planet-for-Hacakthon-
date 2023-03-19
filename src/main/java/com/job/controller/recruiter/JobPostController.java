package com.job.controller.recruiter;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.RecruiterDAO;
import com.job.DAO.UserDAO;
import com.job.model.UserResume;

/**
 * Servlet implementation class JobPostController
 */
@WebServlet("/JobPostController")
public class JobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title=request.getParameter("title");
		String type=request.getParameter("type");
		String location=request.getParameter("location");
		String salary=request.getParameter("salary");
		String deadline=request.getParameter("deadline");
		String desc=request.getParameter("desc");
		String vacancy=request.getParameter("vacancy");
		String skills=request.getParameter("skills");
		String elg=request.getParameter("elg");
		String res=request.getParameter("res");
		
		int recruiterId=Integer.parseInt(request.getParameter("id"));
		String cmpName=request.getParameter("name");
		
		//**************************************
		//Email sending pending
		//alerts to job sekkers pending
		
		//*******************************
		
		try {
		
			UserDAO ud=new UserDAO();
			
			ResultSet rs=ud.getAllUsers();
			ResultSet rs2=null;
			UserResume ur=null;
			String email=null;
			int cnt=0;
			String words[]=skills.split(" ");
			
			com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
			String sub = "  Exciting New Job Opportunity Perfectly Aligned with Your Skills.! | WorkConnect";
			String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
					+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
					+ "   <img src=\"https://images.unsplash.com/photo-1635350736475-c8cef4b21906?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGpvYnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
					+ "   </header>\r\n" + "     \r\n"
					+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
					+ "      <p style=\"margin-left: 25%;\"><br>Hello,Applicant "
					+"<br> We are thrilled to inform you of a new job opportunity that we believe is perfectly aligned with your skills and experience.<br><br>The position we have found is for"+ title+" at [Company Name]. The job requires expertise in "+ skills+", which we know are areas where you excel. <br><br> We are confident that this role would be an excellent fit for you, and we strongly encourage<br>you to apply. Attached, please find the full job description and instructions on how to apply.  </p>\r\n"
					+ "\r\n"
					+ "     <p style=\"margin-left: 25%;\"><br>\r\n"
					+ "         \r\n"
					+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
					+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.Please Verify your email and Login to your account.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
					+ "\r\n" + "          Thanks,<br>\r\n"
					+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
					+ "      </div>\r\n" + "    </div>";
	
			
			
			
		while(rs.next()) {
			
			ur=ud.getUserResumeDataById(rs.getInt(1));
			email=rs.getString(10);
			String sk=ur.getSkills();
			
			String keywords[]=sk.split(" ");
			
			for(int k=0;k<words.length;k++){
				System.out.println(words[k]);

				for(int j=0;j<keywords.length;j++){

					System.out.println(keywords[j]);
					if(words[k].equals(keywords[j])){
					cnt++;
					System.out.println("hello");
					

					}
					else{
					continue;
					}

				}
			}
			System.out.print("count "+cnt);
			System.out.print("rlen "+words.length);
			if(cnt==words.length){
				sm.sendMail(email, sub, msg);
			}
			
			
			
			
			
		}
		
		}catch(Exception e) {
			
		}
		
		HttpSession session=request.getSession();

		
		RecruiterDAO rd=new RecruiterDAO();
		int i=rd.addJob(recruiterId,cmpName,title,type,location,salary,deadline,desc,vacancy,skills,elg,res);
		
		if(i>0) {
   		 session.setAttribute("job-post-success", true);
            response.sendRedirect("recruiter/job-post.jsp");
		}else {
   		 session.setAttribute("job-post-fail", false);
            response.sendRedirect("recruiter/job-post.jsp");
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
