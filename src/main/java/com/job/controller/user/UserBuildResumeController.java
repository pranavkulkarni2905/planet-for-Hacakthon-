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

/**
 * Servlet implementation class UserBuildResumeController
 */
@WebServlet("/UserBuildResumeController")
public class UserBuildResumeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserBuildResumeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		ServletContext sc2 = request.getServletContext();
		int id = (Integer) sc2.getAttribute("user-id");
		System.out.println("ID : " + id);
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String country = request.getParameter("country");
		String pincode = request.getParameter("pincode");
		String eduactionTitle1 = request.getParameter("education_title1");
		String educationFromYear1 = request.getParameter("education_from_date1");
		String educationToYear1 = request.getParameter("education_to_date1");
		String educationDescription1 = request.getParameter("education_description1");
		String eduactionTitle2 = request.getParameter("education_title2");
		String educationFromYear2 = request.getParameter("education_from_date2");
		String educationToYear2 = request.getParameter("education_to_date2");
		String educationDescription2 = request.getParameter("education_description2");
		String eduactionTitle3 = request.getParameter("education_title3");
		String educationFromYear3 = request.getParameter("education_from_date3");
		String educationToYear3 = request.getParameter("education_to_date3");
		String educationDescription3 = request.getParameter("education_description3");
		String jobTitle = request.getParameter("job_title");
		String jobLocation = request.getParameter("job_location");

		String jobFromYear = request.getParameter("job_from_date");
		String jobToYear = request.getParameter("job_to_date");
		String jobDescription = request.getParameter("job_description");
		String projectTitle1 = request.getParameter("project_title1");
		String projectFromYear1 = request.getParameter("project_from_date1");
		String projectToYear1 = request.getParameter("project_to_date1");
		String projectDescription1 = request.getParameter("project_description1");
		String projectUrl1 = request.getParameter("project_url1");

		String projectTitle2 = request.getParameter("project_title2");
		String projectFromYear2 = request.getParameter("project_from_date2");
		String projectToYear2 = request.getParameter("project_to_date2");
		String projectDescription2 = request.getParameter("project_description2");
		String projectUrl2 = request.getParameter("project_url2");

		String skills = request.getParameter("skills");
		String languages = request.getParameter("languages");

		UserDAO ud = new UserDAO();
		HttpSession session = request.getSession();
		int i = ud.updateInUserResume(address, city, state, country, pincode, eduactionTitle1, educationFromYear1,
				educationToYear1, educationDescription1, eduactionTitle2, educationFromYear2, educationToYear2,
				educationDescription2, eduactionTitle3, educationFromYear3, educationToYear3, educationDescription3,
				jobTitle, jobLocation, jobFromYear, jobToYear, jobDescription, skills, languages, projectTitle1,
				projectFromYear1, projectToYear1, projectDescription1, projectUrl1, projectTitle2, projectFromYear2,
				projectToYear2, projectDescription2, projectUrl2, id);

		if (i > 0) {
			session.setAttribute("build-resume-success", true);
			response.sendRedirect("user/build-resume.jsp");
		} else {

			session.setAttribute("build-resume-failed", false);
			response.sendRedirect("user/build-resume.jsp");
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
