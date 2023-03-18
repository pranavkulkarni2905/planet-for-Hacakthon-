package com.job.controller.user;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.UserDAO;

/**
 * Servlet implementation class UserRegistrationController
 */
@WebServlet("/UserRegistrationController")
public class UserRegistrationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegistrationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String username=request.getParameter("username");
		String phone=request.getParameter("phone");
		String password=request.getParameter("password");
		
		//com.job.email.SendMail sm=new com.job.email.SendMail();
		
		HttpSession session=request.getSession();
		
		UserDAO ud=new UserDAO();
		ResultSet rs1=ud.getAllUsers();
		boolean h=true;
		try {
			while (rs1.next()) {
				if ((rs1.getString(10).contentEquals(email)) || (rs1.getString(8).contentEquals(phone))) {
					session = request.getSession();
					h = false;
					
					//response.sendRedirect("user/user-register.jsp");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
		if(h) {
			int i=ud.registerUser(username, email,password,phone);
			
			int id=0;
			
			ResultSet rs=ud.getUserIdForVerify(password, email);
			try {
				if(rs.next()) {
					id=rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			i=ud.addIdInUserResume(id);
			com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
			String sub = " Verify Your Email | WorkConnect";
			String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
					+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
					+ "   <img src=\"https://images.unsplash.com/photo-1635350736475-c8cef4b21906?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGpvYnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
					+ "   </header>\r\n" + "     \r\n"
					+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
					+ "      <p style=\"margin-left: 25%;\"><br>Hello, "+username
					+"<br> Thank You For Registering WorkConnect Job Portal<br><br>Before we get started please verify your email address.Please click on the Button below to verify your email.</p>\r\n"
					+ "\r\n"
					+ "     <p style=\"margin-left: 25%;\"><a href=\"http://localhost:8085/Job_Searching_Platform/user/verify-email.jsp?user-id="+id+"\"><button type=\"button\" class=\"button\" style=\"text-align: center; width:270px; height:50px;border: none;outline: 0;display: inline-block;padding: 5px;color:white;background-color:green;text-align: center;cursor: pointer;width: 35%;\">Click Here to Verify Your Email</button></p></a><br>\r\n"
					+ "         <p style=\"margin-left: 25%;\"> OR <br>copy and paste the following link in your browser:<br><br><a href=\"http://localhost:8085/Job_Searching_Platform/user/verify-email.jsp?user-id="+id+"\">http://localhost:8085/JOB_PORTAL/user/verify-email.jsp?user-id="+id+"\"</a><br><br></p>\r\n"
					+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
					+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.Please Verify your email and Login to your account.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
					+ "\r\n" + "          Thanks,<br>\r\n"
					+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
					+ "      </div>\r\n" + "    </div>";
	
			sm.sendMail(email, sub, msg);
			
			
			if(i>0)
			{
				session.setAttribute("resgiter-user-success",true);
				response.sendRedirect("user/user-login.jsp");
			}
			else {
				
				session.setAttribute("register-user-fail", false);
				response.sendRedirect("user/user-register.jsp");
			}
			
		
		}else {
			session.setAttribute("user-email-fail",false);
			response.sendRedirect("user/user-register.jsp");
		}
		}catch(Exception e) {
			
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
