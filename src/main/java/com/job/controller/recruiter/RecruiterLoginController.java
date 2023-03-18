package com.job.controller.recruiter;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.RecruiterDAO;
import com.job.DAO.UserDAO;
import com.job.model.Recruiter;
import com.job.model.User;

/**
 * Servlet implementation class RecruiterLoginController
 */
@WebServlet("/RecruiterLoginController")
public class RecruiterLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruiterLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ServletContext sc = request.getServletContext();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		RecruiterDAO rd = new RecruiterDAO();
		Recruiter r = rd.checkRecruiter(email,password);
		
		if(r==null)
		{
			sc.setAttribute("recruiter-login-fail-context", r);
			session.setAttribute("recruiter-login-fail", false);
			response.sendRedirect("recruiter/recruiter-login.jsp");
		}
		
		else {
			if(r!=null) {
				sc.setAttribute("recruiter-id", r.getRecruiterId());
				session.setAttribute("hr-name", r.getHrName());
				sc.setAttribute("recruiter-login-success-context", r);
				session.setAttribute("recruiter-login-success", true);
				response.sendRedirect("recruiter/recruiter-index.jsp");
			}
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
