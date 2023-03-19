package com.job.controller.user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.job.DAO.UserDAO;
import com.job.model.User;
import com.job.model.UserResume;

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

		
		
		String requirements = "";
		boolean b = false;

		UserDAO ud = new UserDAO();

		String skills = "";
		int cnt = 0;
		float per = 0;

		UserResume ur = ud.getUserResumeDataById(userid);

		skills = ur.getSkills();
		String edu1 = ur.getEdu1();
		String edu2 = ur.getEdu2();
		String edu3 = ur.getEdu3();
		String exp = ur.getExp();

		ResultSet resreq = ud.getJobDetailsByJobId(jobid);
		String education = "";
		try {
			if (resreq.next()) {
				requirements = resreq.getString(11);
				education = resreq.getString(13);

				// System.out.print(requirements);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		String[] keywords = skills.split(" ");
		String[] words = requirements.split(" ");
		String[] edu = education.split(" ");

		for (int k = 0; k < edu.length; k++) {

			System.out.println(edu[k]);
		}
		int rlen = words.length;

		for (int k = 0; k < words.length; k++) {
			System.out.println(words[k]);

			for (int j = 0; j < keywords.length; j++) {

				System.out.println(keywords[j]);
				if (words[k].equals(keywords[j])) {
					cnt++;
					System.out.println("hello");

				} else {
					continue;
				}

			}
		}
		System.out.print("count " + cnt);
		System.out.print("rlen " + rlen);
		if (cnt == rlen) {
			per += 38;
			b = true;
		} else if (cnt >= rlen / 2) {
			per += 19;
			b = true;
		} else {
			b = false;
		}

		for (int k = 0; k < edu.length; k++) {

			if (edu[k].equals(edu1)) {
				per += 11;
				System.out.println(per);
				System.out.println(cnt);
			}
			if (edu[k].equals(edu2)) {
				per += 11;
			}
			if (edu[k].equals(edu3)) {
				per += 11;
			}
		}
		int x = Integer.parseInt(exp);
		if (x == 1) {
			per += 7;
		} else if (x >= 2 && x < 5) {
			per += 17;
		} else if (x >= 5) {
			per += 25;
		} else {

		}

		UserDAO u = new UserDAO();

		ResultSet rs = u.checkJobApplied(jobid, userid);

		String jfs=Float.toString(per);
		int i = u.jobApply(fileName, ques1, ques2, jobid, recid, userid,jfs);

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
