package com.job.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.AdminDAO;

/**
 * Servlet implementation class NonITJobPostController
 */
@WebServlet("/NonITJobPostController")
public class NonITJobPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NonITJobPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String title=request.getParameter("title");
		String type=request.getParameter("type");
		String category=request.getParameter("category");
		String location=request.getParameter("location");
		String salary=request.getParameter("salary");
		String deadline=request.getParameter("deadline");
		String desc=request.getParameter("desc");
		String vacancy=request.getParameter("vacancy");
		String skills=request.getParameter("skills");
		
		//**************
				//Email sending pending
				//alerts to job sekkers pending
				
				//***********
				
				HttpSession session=request.getSession();

				
				AdminDAO ad=new AdminDAO();
				int i= ad.addNonITJob(title, type,category, location, salary, deadline, desc, vacancy, skills);
				
				if(i>0) {
		   		 session.setAttribute("job-post-success", true);
		            response.sendRedirect("admin/nonit-job-post.jsp");
				}else {
		   		 session.setAttribute("job-post-fail", false);
		            response.sendRedirect("admin/nonit-job-post.jsp");
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