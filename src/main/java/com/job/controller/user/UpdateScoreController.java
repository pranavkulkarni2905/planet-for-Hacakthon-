package com.job.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.job.DAO.UserDAO;

/**
 * Servlet implementation class UpdateScoreController
 */
@WebServlet("/UpdateScoreController")
public class UpdateScoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateScoreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int score=Integer.parseInt(request.getParameter("score"));
		int userid=Integer.parseInt(request.getParameter("userid"));
		int job=Integer.parseInt(request.getParameter("jobid"));
		
		UserDAO ud=new UserDAO();
		int i=ud.updateAptiScore(score,userid,job);
		HttpSession session=request.getSession();
		
		if(i>0)
		{
			session.setAttribute("score-success",true);
			response.sendRedirect("user/take-exam.jsp");
		}
		else {
			
			session.setAttribute("score-fail", false);
			response.sendRedirect("user/take-exam.jsp");
		}
		System.out.println(score+" "+userid+" "+job);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
