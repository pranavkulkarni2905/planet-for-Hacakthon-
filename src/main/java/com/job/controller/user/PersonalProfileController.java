package com.job.controller.user;

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

import com.job.DAO.UserDAO;

/**
 * Servlet implementation class PersonalProfileController
 */
@MultipartConfig
@WebServlet("/PersonalProfileController")
public class PersonalProfileController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PersonalProfileController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		String fName=request.getParameter("fname");
		String mName=request.getParameter("mname");
		String lName=request.getParameter("lname");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		//String photo=request.getParameter("photo");
		String about=request.getParameter("about");
		String linkedin=request.getParameter("linkedin");
		String github=request.getParameter("github");
		String portfolio=request.getParameter("portfolio");
		int id=Integer.parseInt(request.getParameter("id"));
		
		HttpSession session=request.getSession();
		
		Part file=request.getPart("photo");
		
		String imageFileName=file.getSubmittedFileName();  // get selected image file name
		imageFileName=fName+lName+"_"+imageFileName;
		System.out.println("Selected Image File Name : "+imageFileName);
	
		String uploadPath="C:/Users/NCS/eclipse-workspace/Job Searching Platform/src/main/webapp/user-images/"+imageFileName;  // upload path where we have to upload our actual image
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
		
		UserDAO ud=new UserDAO();
		int i=ud.editUserProfile(fName,mName,lName,dob,gender,imageFileName,about,linkedin,github,portfolio,id);
		
		if(i>0)
		{
			session.setAttribute("edit-profile-success",true);
			response.sendRedirect("user/user-profile.jsp");
		}
		else {
			
			session.setAttribute("edit-profile-fail", false);
			response.sendRedirect("user/user-profile.jsp");
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
