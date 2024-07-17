package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataBaseConnection {

	private static Connection connection;

	private static final String URL = "jdbc:mysql://localhost:3306/HospitalManagementSystem";
	private static final String USERNAME = "root";
	private static final String PASSWORD = "Pratik@007";

	static public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		return connection;
	}
}
