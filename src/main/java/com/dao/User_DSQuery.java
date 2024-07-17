package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class User_DSQuery {
	private Connection connection;

	public User_DSQuery(Connection connection) {
		super();
		this.connection = connection;
	}
	
	public boolean userRegister(User user) {
		boolean flag  = false;
		
		try {
			String query ="insert into User(Name,email,password) values(?,?,?)"; 
			
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, user.getFullName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			
			int status = statement.executeUpdate();
			
			if(status>0) {
				flag = true;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public User login(String email,String password) {
		User user = null;
		try {
			String sql = "select * from User where email=? and password=?";
			PreparedStatement statement = connection.prepareStatement(sql);
			
			statement.setString(1,email);
			statement.setString(1, password);
			
			ResultSet set = statement.executeQuery();
			if(set.next()) {
				System.out.println("Successfully");
				user.setId(set.getInt(1));
				user.setFullName(set.getString(2));
				user.setEmail(set.getString(3));
				user.setPassword(set.getString(4));
			}
			else {
				System.out.println("user does not exist");
			}
 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean checkOldPassword(int userId,String oldPassword) {
		boolean flag  = false;
		
		try {
			String sqlString = "select * from User where id=? and password=?";
			PreparedStatement statement = connection.prepareStatement(sqlString);
			statement.setInt(1, userId);
			statement.setString(2, oldPassword);

			ResultSet rs = statement.executeQuery();
			
			if(rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return flag;
	}
	public boolean updateUserPassword(int userId,String newPassword) {
		boolean flag  = false;
		
		try {
			String sqlString = "update User set password=? where id=?";
			PreparedStatement statement = connection.prepareStatement(sqlString);
			statement.setString(1, newPassword);
			statement.setInt(2, userId);

			int i = statement.executeUpdate();
			
			if(i>0) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
}
