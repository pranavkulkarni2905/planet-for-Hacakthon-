package com.job.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.job.model.User;
import com.job.model.UserResume;

public class UserDAO {

	Connection con = null;
	PreparedStatement ps = null,ps1=null,ps2=null;

	public int registerUser(String username, String email, String password, String phone) {
		int i = 0;
		Timestamp date = new Timestamp(new Date().getTime());
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"insert into job_user(username,email_id,password,phon_no,registered_time,verified) values(?,?,?,?,?,?)");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			ps.setString(4, phone);
			ps.setTimestamp(5, date);
			ps.setString(6, "No");

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public ResultSet getUserIdForVerify(String password, String email) {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from job_user where password=? and email_id=?");
			ps.setString(1, password);
			ps.setString(2, email);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getUserVerifiedStatusById(int id) {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from job_user where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getNotificationByUserId(int id) {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from notification where userid=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int updateUserVerifiedStatus(int id) {
		con = DBConnection.getConnection();
		int i = 0;
		try {
			ps = con.prepareStatement("update job_user set verified=? where user_id=?");
			ps.setString(1, "Yes");
			ps.setInt(2, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public User checkUser(String username, String password) {
		User u = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_user where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next())
				u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getInt(15),
						rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	public ResultSet getAllUsers() {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from job_user");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public int editUserProfile(String fName, String mName, String lName, String dob, String gender, String photo,
			String about, String linkedin, String github, String portfolio, int id) {
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"update job_user set first_name=?,middle_name=?,last_name=?,dob=?,gender=?,profile_photo=?,about=?,linkedin_url=?,github_url=?,portfolio_url=? where user_id=?");

			ps.setString(1, fName);
			ps.setString(2, mName);
			ps.setString(3, lName);
			ps.setString(4, dob);
			ps.setString(5, gender);
			ps.setString(6, photo);
			ps.setString(7, about);
			ps.setString(8, linkedin);
			ps.setString(9, github);
			ps.setString(10, portfolio);
			ps.setInt(11, id);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public User getUserDataById(int id) {
		User f1 = null;
		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_user where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				f1 = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getInt(15),
						rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f1;
	}

	public int addIdInUserResume(int id) {
		System.out.println("inside add in resume");
		System.out.println();
		int i = 0;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("insert into user_resume(user_id) values(?)");
			ps.setInt(1, id);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
		}
		return i;
	}

//	public int updateInUserResume(String address, String city, String state, String country, String pincode,
//			String eduactionTitle1, String educationFromYear1, String educationToYear1, String educationDescription1,
//			String eduactionTitle2, String educationFromYear2, String educationToYear2, String educationDescription2,
//			String eduactionTitle3, String educationFromYear3, String educationToYear3, String educationDescription3,
//			String jobTitle, String jobFromYear, String jobToYear, String jobDescription, String skills,
//			String languages, String projectTitle1, String projectFromYear1, String projectToYear1,
//			String projectDescription1, String projectUrl1, String projectTitle2, String projectFromYear2,
//			String projectToYear2, String projectDescription2, String projectUrl2, String jobLocation, int id) {
//
//	con = DBConnection.getConnection();
//	int i = 0;
//	try {
//		System.out.println();
//		ps = con.prepareStatement(
//				"update user_resume set location=?,city=?,state=?,country=?,pincode=?,edu_title1=?,edu_from1=?,edu_to1=?,edu_desc1=?,edu_title2=?,edu_from2=?,edu_to2=?,edu_desc2=?,edu_title3=?,edu_from3=?,edu_to3=?,edu_desc3=?,job_title=?,job_from=?,job_to=?,job_desc=?,proj_title1=?,proj_from1=?,proj_to1=?,proj_desc1=?,proj_url1=?,proj_title2=?,proj_from2=?,proj_to2=?,proj_desc2=?,proj_url2=?,skills=?,languages=?,job_location=? where user_id=?");
//
//		ps.setString(1, address);
//		ps.setString(2, city);
//		ps.setString(3, state);
//		ps.setString(4, country);
//		ps.setString(5, pincode);
//		ps.setString(6, eduactionTitle1);
//		ps.setString(7, educationFromYear1);
//		ps.setString(8, educationToYear1);
//		ps.setString(9, educationDescription1);
//		ps.setString(10, eduactionTitle2);
//		ps.setString(11, educationFromYear2);
//
//		ps.setString(12, educationToYear2);
//		ps.setString(13, educationDescription2);
//		ps.setString(14, eduactionTitle3);
//		ps.setString(15, educationFromYear3);
//		ps.setString(16, educationToYear3);
//		ps.setString(17, educationDescription3);
//
//		ps.setString(18, jobTitle);
//
//		ps.setString(19, jobFromYear);
//		ps.setString(20, jobToYear);
//		ps.setString(21, jobDescription);
//
//		ps.setString(22, projectTitle1);
//		ps.setString(23, projectFromYear1);
//		ps.setString(24, projectToYear1);
//		ps.setString(25, projectDescription1);
//		ps.setString(26, projectUrl1);
//
//		ps.setString(27, projectTitle2);
//		ps.setString(28, projectFromYear2);
//		ps.setString(29, projectToYear2);
//		ps.setString(30, projectDescription2);
//		ps.setString(31, projectUrl2);
//		ps.setString(32, skills);
//		ps.setString(33, languages);
//		ps.setString(34, jobLocation);
//		ps.setInt(35, id);
//
//		i = ps.executeUpdate();
//	} catch (SQLException e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
//	return i;
//
//	}

	public UserResume getUserResumeDataById(int id) {
		UserResume f1 = null;
		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from user_resume where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				f1 = new UserResume(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14), rs.getString(15),
						rs.getString(16), rs.getString(17), rs.getString(18), rs.getString(19), rs.getString(20),
						rs.getString(21), rs.getString(22), rs.getString(23), rs.getString(24), rs.getString(25),
						rs.getString(26), rs.getString(27), rs.getString(28), rs.getString(29), rs.getString(30),
						rs.getString(31), rs.getString(32), rs.getString(33), rs.getString(34), rs.getString(35),
						rs.getString(36),rs.getString(37),rs.getString(38),rs.getString(39),rs.getString(40));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return f1;
	}

	public int updateInUserResume(String address, String city, String state, String country, String pincode,
			String eduactionTitle1, String educationFromYear1, String educationToYear1, String educationDescription1,
			String eduactionTitle2, String educationFromYear2, String educationToYear2, String educationDescription2,
			String eduactionTitle3, String educationFromYear3, String educationToYear3, String educationDescription3,
			String jobTitle, String jobLocation, String jobFromYear, String jobToYear, String jobDescription,
			String skills, String languages, String projectTitle1, String projectFromYear1, String projectToYear1,
			String projectDescription1, String projectUrl1, String projectTitle2, String projectFromYear2,
			String projectToYear2, String projectDescription2, String projectUrl2, int id,String exp,String edu1,String edu2,String edu3) {

		con = DBConnection.getConnection();
		int i = 0;
		try {
			System.out.println();
			ps = con.prepareStatement(
					"update user_resume set location=?,city=?,state=?,country=?,pincode=?,edu_title1=?,edu_from1=?,edu_to1=?,edu_desc1=?,edu_title2=?,edu_from2=?,edu_to2=?,edu_desc2=?,edu_title3=?,edu_from3=?,edu_to3=?,edu_desc3=?,job_title=?,job_from=?,job_to=?,job_desc=?,proj_title1=?,proj_from1=?,proj_to1=?,proj_desc1=?,proj_url1=?,proj_title2=?,proj_from2=?,proj_to2=?,proj_desc2=?,proj_url2=?,skills=?,languages=?,job_location=?,exp=?,edu1=?,edu2=?,edu3=? where user_id=?");

			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setString(4, country);
			ps.setString(5, pincode);
			ps.setString(6, eduactionTitle1);
			ps.setString(7, educationFromYear1);
			ps.setString(8, educationToYear1);
			ps.setString(9, educationDescription1);
			ps.setString(10, eduactionTitle2);
			ps.setString(11, educationFromYear2);

			ps.setString(12, educationToYear2);
			ps.setString(13, educationDescription2);
			ps.setString(14, eduactionTitle3);
			ps.setString(15, educationFromYear3);
			ps.setString(16, educationToYear3);
			ps.setString(17, educationDescription3);

			ps.setString(18, jobTitle);

			ps.setString(19, jobFromYear);
			ps.setString(20, jobToYear);
			ps.setString(21, jobDescription);

			ps.setString(22, projectTitle1);
			ps.setString(23, projectFromYear1);
			ps.setString(24, projectToYear1);
			ps.setString(25, projectDescription1);
			ps.setString(26, projectUrl1);

			ps.setString(27, projectTitle2);
			ps.setString(28, projectFromYear2);
			ps.setString(29, projectToYear2);
			ps.setString(30, projectDescription2);
			ps.setString(31, projectUrl2);
			ps.setString(32, skills);
			ps.setString(33, languages);
			ps.setString(34, jobLocation);
			ps.setString(35, exp);
			ps.setString(36, edu1);
			ps.setString(37, edu2);
			ps.setString(38, edu3);
			ps.setInt(39, id);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public ResultSet getAllJobs() {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from job_post");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getAllNonItJobs() {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from non_it_job_post");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getCompanyNameById(int id) {
		con = DBConnection.getConnection();
		ResultSet rs = null;
		try {
			ps = con.prepareStatement("select * from recrutier_profile where recruiter_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getJobDetailsByJobId(int id) {

		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_post where job_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getJobDetailsByJobIdandUser(int id, int user) {

		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_post where job_id=? and user_id=?");
			ps.setInt(1, id);
			ps.setInt(2, user);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

	public ResultSet getCompanyDetails(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from recrutier_profile where recruiter_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public int jobApply(String fileName, String ques1, String ques2, int jobid, int recid, int userid,String jfs) {
		int i = 0;
		Timestamp date = new Timestamp(new Date().getTime());
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"insert into job_apply(recrutier_id ,user_id ,job_id ,resume_pdf,ques1,ques2,submitted_date,jfs) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, recid);
			ps.setInt(2, userid);
			ps.setInt(3, jobid);
			ps.setString(4, fileName);
			ps.setString(5, ques1);
			ps.setString(6, ques2);
			ps.setTimestamp(7, date);
			ps.setString(8, jfs);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return i;
	}

	public ResultSet checkJobApplied(int jobid, int userid) {
		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_apply where user_id=? and job_id=?");
			ps.setInt(1, userid);
			ps.setInt(2, jobid);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public ResultSet filterByTypeAndLocation(String type, String location, String company) {

		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_post where jo_type=? and job_location=? and company_name=?");
			ps.setString(1, type);
			ps.setString(2, location);
			ps.setString(3, company);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet filterBySalary(String s, String d) {

		ResultSet rs = null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_post where salary between ? and ?");
			ps.setString(1, s);
			ps.setString(2, d);

			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return rs;
	}

	public ResultSet getAllCandidatesById(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("SELECT * FROM job_apply where recrutier_id=? ORDER BY CAST(jfs AS number) ");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public ResultSet getCandidatesByJobId(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("SELECT * FROM job_apply  where job_id=? ORDER BY CAST(jfs AS number)");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public ResultSet getJobIdByRecIdAndUserId(int userid, int recid) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_apply where recrutier_id=? and user_id=?");
			ps.setInt(1, recid);
			ps.setInt(2, userid);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public ResultSet getAllCandidatesByUserId(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_apply where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}

	public int updateShortlistResumeStatus(int userid, int jobid) {
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update job_apply set resume_status='Yes',flag=1 where user_id=? and app_id=?");
			ps1 = con.prepareStatement("select * from job_user where user_id=?");
			ps.setInt(1, userid);
			ps.setInt(2, jobid);
			
			ps1.setInt(1, userid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				String email=rs.getString(10);
				String uname=rs.getString(2);
				
				com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
				String sub = " Congratulations ! Your Application is one step ahead. ";
				String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
						+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
						+ "   <img src=\"https://media.istockphoto.com/id/1345741261/photo/trophy-cup-with-a-star-on-blue-background.jpg?b=1&s=170667a&w=0&k=20&c=kAi4FpbSuzWQE_TGRn4L4rVpfV40gKZyp2Zgg9vjVCk=\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
						+ "   </header>\r\n" + "     \r\n"
						+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
						+ "      <p style=\"margin-left: 25%;\"><br>Hello, "+uname
						+"<br> Greeting from WorkConnect Job Portal<br><br>Glad to inform you that your application is shortlisted for resume.Now you can go ahead for Screening Exam.</p>\r\n"
						+ "\r\n"
						+ "     <p style=\"margin-left: 25%;\">All The Best !!</p></a><br>\r\n"
						
						+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
						+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
						+ "\r\n" + "          Thanks,<br>\r\n"
						+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
						+ "      </div>\r\n" + "    </div>";
		
				sm.sendMail(email, sub, msg);
			}
			ps2 = con.prepareStatement("insert into notification(msg,userid) values (?,?)");
			ps2.setString(1, "Application Status: Resume Shortlisted");
			ps2.setInt(2, userid);
			int i1=ps2.executeUpdate();
			i = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return i;

	}

	public int updateShortlistAptiStatus(int userid, int appid) {
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update job_apply set apti_status='Yes',flag=2 where user_id=? and app_id=?");
			ps1 = con.prepareStatement("select * from job_user where user_id=?");
			ps.setInt(1, userid);
			ps.setInt(2, appid);
			
			ps1.setInt(1, userid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				String email=rs.getString(10);
				String uname=rs.getString(2);
				
				com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
				String sub = " Congratulations ! Your Application is one step ahead. ";
				String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
						+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
						+ "   <img src=\"https://media.istockphoto.com/id/1345741261/photo/trophy-cup-with-a-star-on-blue-background.jpg?b=1&s=170667a&w=0&k=20&c=kAi4FpbSuzWQE_TGRn4L4rVpfV40gKZyp2Zgg9vjVCk=\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
						+ "   </header>\r\n" + "     \r\n"
						+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
						+ "      <p style=\"margin-left: 25%;\"><br>Hello, "+uname
						+"<br> Greeting from WorkConnect Job Portal<br><br>Glad to inform you that your application is shortlisted for Aptitude Test.Now you can go ahead for Interview Call.</p>\r\n"
						+ "\r\n"
						+ "     <p style=\"margin-left: 25%;\">All The Best !!</p></a><br>\r\n"
						
						+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
						+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
						+ "\r\n" + "          Thanks,<br>\r\n"
						+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
						+ "      </div>\r\n" + "    </div>";
		
				sm.sendMail(email, sub, msg);
			}
			ps2 = con.prepareStatement("insert into notification(msg,userid) values (?,?)");
			ps2.setString(1, "Application Status: Aptitude Passed");
			ps2.setInt(2, userid);
			int i1=ps2.executeUpdate();
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public int updateShortlistInterviewStatus(int userid, int appid) {
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update job_apply set interview_status='Yes',flag=3 where user_id=? and app_id=?");
			ps1 = con.prepareStatement("select * from job_user where user_id=?");
			ps.setInt(1, userid);
			ps.setInt(2, appid);
ps1.setInt(1, userid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				String email=rs.getString(10);
				String uname=rs.getString(2);
				
				com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
				String sub = " Congratulations ! Your Application is one step ahead. ";
				String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
						+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
						+ "   <img src=\"https://media.istockphoto.com/id/1345741261/photo/trophy-cup-with-a-star-on-blue-background.jpg?b=1&s=170667a&w=0&k=20&c=kAi4FpbSuzWQE_TGRn4L4rVpfV40gKZyp2Zgg9vjVCk=\" height=\"200px\" width=\"50%\" style=\"margin-top: 15px; margin-left: 25%; color: black;align:center;\">\r\n"
						+ "   </header>\r\n" + "     \r\n"
						+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
						+ "      <p style=\"margin-left: 25%;\"><br>Hello, "+uname
						+"<br> Greeting from WorkConnect Job Portal<br><br>Glad to inform you that You have cracked the interview successfully. Recruiter will contact you soon for further process.Get in touch.</p>\r\n"
						+ "\r\n"
						+ "     <p style=\"margin-left: 25%;\">All The Best !!</p></a><br>\r\n"
						
						+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
						+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
						+ "\r\n" + "          Thanks,<br>\r\n"
						+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
						+ "      </div>\r\n" + "    </div>";
		
				sm.sendMail(email, sub, msg);
			}
			ps2 = con.prepareStatement("insert into notification(msg,userid) values (?,?)");
			ps2.setString(1, "Application Status: Interview Call");
			int i1=ps2.executeUpdate();
			ps2.setInt(2, userid);
			
			i = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public int updateShortlistRejectStatus(int userid, int appid,String reason) {
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement(
					"update job_apply set resume_status='No', apti_status='No',interview_status='No',flag=4,reject_reason=? where user_id=? and app_id=?");
			ps1 = con.prepareStatement("select * from job_user where user_id=?");
			ps.setString(1, reason);
			ps.setInt(2, userid);
			ps.setInt(3, appid);
ps1.setInt(1, userid);
			
			ResultSet rs=ps1.executeQuery();
			if(rs.next()) {
				String email=rs.getString(10);
				String uname=rs.getString(2);
				
				com.job.email.sendHtmlMail sm = new com.job.email.sendHtmlMail();
				String sub = " Thanks for Applying ! ";
				String msg = "<div class=\"card\" style =\"width:100%; height:100%; margin-top: 50px;margin-left:10px; background-color: black;\">\r\n"
						+ "    <header class=\"header\" style=\"background-color: black;\">\r\n"
						+ "   \r\n"
						+ "   </header>\r\n" + "     \r\n"
						+ "      <div class=\"cotainer\" style=\"height: 620px;background-color:black;color:white;\">\r\n"
						+ "      <p style=\"margin-left: 25%;\"><br>Hello, "+uname
						+"<br> Thanks for applying to WorkConnect! There are a ton of great companies out there, so we appreciate your interest in joining our team.\r\n"
						+ "\r\n"
						+ "While we’re not able to reach out to every applicant, our recruiting team will contact you if your skills and experience are a strong match for the role. In the meantime, join the conversation about job opportunities and life at WorkConnect on our LinkedIn page.\r\n"
						+ "\r\n"
						+ "We appreciate your interest in joining us.</p>\r\n<b>Rejected Reason : "+reason+"</b><br>"
						+ "\r\n"
						+ "     <p style=\"margin-left: 25%;\">All The Best !!</p></a><br>\r\n"
						
						+ "         <p style=\"margin-left: 25%;\"> If you have any concerns ,please contact us at<br><br>\r\n"
						+ "          workconnect@gmail.com<br><br></p><p style=\"margin-left: 25%;\">Thank you for Registering on WorkConnect Portal.<br>If you beleive you've received this messsage in error,<br>we apologize-feel free to ignore it.<br><br>\r\n"
						+ "\r\n" + "          Thanks,<br>\r\n"
						+ "          Team WorkConnect Portal</p>\r\n" + "      </p>\r\n"
						+ "      </div>\r\n" + "    </div>";
		
				sm.sendMail(email, sub, msg);
			}
			ps2 = con.prepareStatement("insert into notification(msg,userid) values (?,?)");
			ps2.setString(1, "Application Status: Rejected");
			ps2.setInt(2, userid);
			int i1=ps2.executeUpdate();
			
			i = ps.executeUpdate();
			

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public int updateAptiScore(int score, int userid, int job) {
		// TODO Auto-generated method stub
		int i = 0;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("update job_apply set apti_score=? where user_id=? and job_id=?");
			ps.setInt(1, score);
			ps.setInt(2, userid);
			ps.setInt(3, job);

			i = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;

	}

	public ResultSet getSkillByUserId(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select skills from user_resume where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}
	

	public ResultSet getStatusById(int id,int userid) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from job_apply where user_id=? and app_id=?");
			ps.setInt(1, userid);
			ps.setInt(2, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}
	public ResultSet getNotifyCountById(int userid) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select COUNT(msg) from notification where user_id=?");
			ps.setInt(1, userid);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;

	}
	public ResultSet getResumeFileNameByUserId(int id) {

		ResultSet rs = null;

		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select resume_pdf from job_apply where user_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}

}
