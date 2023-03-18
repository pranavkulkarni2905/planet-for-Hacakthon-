package com.job.controller.recruiter;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.RecruiterDAO;

/**
 * Servlet implementation class RecruiterRegistrationController
 */
@WebServlet("/RecruiterRegistrationController")
public class RecruiterRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruiterRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String cmpName=request.getParameter("cmpname");
		String name=request.getParameter("name");
		String password=request.getParameter("password");
		
		HttpSession session=request.getSession();

        // Extract the domain name from the email address
        String[] parts = email.split("@");
        String domainName = parts[1];
        System.out.println(domainName);
        
        if (domainName.equals("gmail.com")||domainName.equals("yahoo.com")||domainName.equals("outlook.com")){
            session.setAttribute("invalid-email", false);
            response.sendRedirect("recruiter/recruiter-register.jsp");
            
        } else {
            //System.out.println("Email is not a company email");
        	RecruiterDAO rd=new RecruiterDAO();
        	int i=rd.registerRecruiter(name, email, password, phone, cmpName);
        	if(i>0) {
        		 session.setAttribute("recrutier-register-success", true);
                 response.sendRedirect("recruiter/recruiter-login.jsp");
        	}else {
        		 session.setAttribute("recrutier-register-fail", false);
                 response.sendRedirect("recruiter/recruiter-register.jsp");
        	}
        	System.out.println("Email is a company email");
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
