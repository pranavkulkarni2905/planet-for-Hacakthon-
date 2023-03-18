package com.job.controller.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.job.DAO.UserDAO;

/**
 * Servlet implementation class JobApplyController
 */
@MultipartConfig
@WebServlet("/JobApplyController")
public class JobApplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JobApplyController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Part file = request.getPart("resume");

		String fileName = "wc" + file.getSubmittedFileName();
		// System.out.println("Selected image file: "+fileName);
		System.out.println();
		String uploadPath = "C:/Users/NCS/eclipse-workspace/Job Searching Platform/src/main/webapp/resume/" + fileName;
		System.out.println(uploadPath);
		String ques1 = request.getParameter("ques1");
		String ques2 = request.getParameter("ques2");
		int jobid = Integer.parseInt(request.getParameter("jobid"));
		int recid = Integer.parseInt(request.getParameter("recid"));
		int userid = Integer.parseInt(request.getParameter("userid"));
		try {

			FileOutputStream fos = new FileOutputStream(uploadPath);
			InputStream is = file.getInputStream();

			byte[] data = new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();

		UserDAO u = new UserDAO();

		ResultSet rs = u.checkJobApplied(jobid, userid);

		int i = u.jobApply(fileName, ques1, ques2, jobid, recid, userid);

		if (i > 0) {
			session.setAttribute("app-success", true);
			response.sendRedirect("user/user-profile.jsp");
		} else {

			session.setAttribute("app-fail", false);
			response.sendRedirect("user/user-profile.jsp");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
