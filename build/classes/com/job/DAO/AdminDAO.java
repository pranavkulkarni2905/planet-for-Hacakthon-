package com.job.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import com.job.model.question;

public class AdminDAO {

	
	Connection con = null;
	PreparedStatement ps = null;
	
	public int addNonITJob(String title, String type,String category, String location, String salary,
			String deadline, String desc, String vacancy, String skills) {
		int i = 0;
		Timestamp date = new Timestamp(new Date().getTime());
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("insert into non_it_job_post(job_title,job_type,job_category,job_location,job_vaccancy,salary,deadline,job_desc,skill_qualification,posted_date) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, title);
			ps.setString(2, type);
			ps.setString(3, category);
			ps.setString(4, location);
			ps.setString(5, vacancy);
			ps.setString(6, salary);
			ps.setString(7, deadline);
			ps.setString(8, desc);
			ps.setString(9, skills);
			ps.setTimestamp(10, date);
			
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public question getQuestionId(int id) {

		ResultSet rs = null;
		question q=null;
		con = DBConnection.getConnection();
		try {
			ps = con.prepareStatement("select * from aptitude_question where question_id=?");
			ps.setInt(1, id);
			rs = ps.executeQuery();
			if(rs.next()) {
				q=new question(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return q;
	}
	public question[] getQueByCid()
	{
		con = DBConnection.getConnection();
		
		ResultSet rs = null;
		question que[] = null;
		//int course_code = ed.getCourseId(exam_code);
		try {
			
			que = new question[10]; 
			ps = con.prepareStatement("select * from aptitude_question ");
			//ps.setInt(1,course_code);
			rs = ps.executeQuery();
			int i = 0;
			while(rs.next())
			{
				//System.out.println("i : "+i);
				que[i] = new question(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5), rs.getString(6), rs.getString(7));
				i++;
				//System.out.println("Question added...");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return que;
	}

	
}