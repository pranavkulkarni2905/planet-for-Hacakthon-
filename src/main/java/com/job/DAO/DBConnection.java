package com.job.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	public static Connection getConnection() {
		Connection con = null;
		try {
			// load drivers
			Class.forName("oracle.jdbc.OracleDriver");
			// connection to data Base

			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "pranav2905");

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
