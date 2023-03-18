package com.job.controller.recruiter;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.RecruiterDAO;

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
