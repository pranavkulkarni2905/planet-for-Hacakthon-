package com.job.controller.recruiter;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.job.DAO.RecruiterDAO;

/**
 * Servlet implementation class ProfileController
 */
@MultipartConfig
@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("id"));
		String regNo=request.getParameter("regno");
		String regDate=request.getParameter("regdate");
		String size=request.getParameter("size");
		String about=request.getParameter("about");
		
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String twitter=request.getParameter("twitter");
		String linkedin=request.getParameter("linkedin");
		String web=request.getParameter("web");
		
		Part file=request.getPart("photo");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		imageFileName=id+"_"+imageFileName;
		System.out.println("Selected Image File Name : "+imageFileName);
	
		String uploadPath="C:/Users/NCS/eclipse-workspace/Job Searching Platform/src/main/webapp/company-images/"+imageFileName;  // upload path where we have to upload our actual image
		System.out.println("Upload Path : "+uploadPath);
	
		
		
		try
		{
		
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		RecruiterDAO rd=new  RecruiterDAO();
		int i=rd.addProfile(id,regNo,regDate,size,about,city,state,country,email,twitter,linkedin,web,phone,imageFileName);
		HttpSession session=request.getSession();
		if(i>0) {
   		 session.setAttribute("recrutier-profile-success", true);
            response.sendRedirect("recruiter/recruiter-profile.jsp");
		}else {
   		 session.setAttribute("recrutier-profile-fail", false);
            response.sendRedirect("recruiter/recruiter-profile.jsp");
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
