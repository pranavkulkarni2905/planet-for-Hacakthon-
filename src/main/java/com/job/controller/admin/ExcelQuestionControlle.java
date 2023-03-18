package com.job.controller.admin;

import java.io.File;


import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class ExcelQuestionControlle
 */
@MultipartConfig
@WebServlet("/ExcelQuestionControlle")
public class ExcelQuestionControlle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExcelQuestionControlle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		//String course=(String)session.getAttribute("courseTable");
		
		//System.out.println(course);
//		session.setAttribute("excel_success", true);
//		response.sendRedirect("set-aptitude.jsp");
//		String course="aptitude";
//		String fileName=null;
//		ServletContext sc=request.getServletContext();
//		String path=sc.getRealPath("/"+"files");
//		
//		System.out.println("demo path :" +path);
//		boolean isMultipartContent=ServletFileUpload.isMultipartContent(request);
//		if(!isMultipartContent)
//		{
//			System.out.println("terminate");
//			return;
//		}
//		System.out.println("test1");
//		FileItemFactory factory=new DiskFileItemFactory();
//		System.out.println("hello");
//		ServletFileUpload upload=new ServletFileUpload(factory);
//		System.out.println("hello2");
//		try {
//			java.util.List<FileItem> fields=upload.parseRequest(request);
//			System.out.println("hello3");
//			Iterator<FileItem> it=fields.iterator();
//			System.out.println("hello4");
//			if(it.hasNext())
//			{
//				System.out.println("test2");
//				FileItem fileItem=it.next();
//				boolean isformField=fileItem.isFormField();
//				System.out.println(isformField);
//				if(isformField)
//				{
//					if(fileName==null)
//					{
//						System.out.println("xecel");
//						if(fileItem.getFieldName().equals("fileName"))
//						{
//							System.out.println("test3");
//							fileName=fileItem.getString();
//						}
//					}
//				}
//				else
//				{
//					if(fileItem.getSize()>0)
//					{
//						fileItem.write(new File(path+File.separator+fileItem.getName()));
//						System.out.println("final path : "+path+File.separator+fileItem.getName());
//						excel ex=new excel();
//						int k=ex.record(path+File.separator+fileItem.getName(),course);
//						if(k>0)
						//{
							//String excel_msg="Excel Sheet Uploaded Sucessfully";
							session.setAttribute("excel_success", true);
							response.sendRedirect("admin/set-aptitude.jsp");
//						}
//						//excel ex=new excel();
//						//ex.record(path+File.separator+fileItem.getName());
//					}
//				}
//			}
//		} catch (FileUploadException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
