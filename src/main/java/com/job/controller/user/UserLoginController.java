package com.job.controller.user;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.UserDAO;
import com.job.model.User;



/**
 * Servlet implementation class UserLoginController
 */
@WebServlet("/UserLoginController")
public class UserLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ServletContext sc = request.getServletContext();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		UserDAO ud=new UserDAO();
		User u = ud.checkUser(username, password);
		
		if(u==null)
		{
			sc.setAttribute("user-login-fail-context", u);
			session.setAttribute("user-login-fail", false);
			response.sendRedirect("user/user-login.jsp");
		}
		else if(u.getVerified().equals("No")) {
			session.setAttribute("verified-fail", false);
			response.sendRedirect("user/user-login.jsp");
		}
		else {
			if(u!=null) {
				sc.setAttribute("user-id", u.getUser_id());
				session.setAttribute("user-uname", u.getUsername());
				sc.setAttribute("user-login-success-context", u);
				session.setAttribute("user-login-success", true);
				response.sendRedirect("user/user-index.jsp");
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
