package com.user.servlet;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.User_DSQuery;
import com.db.DataBaseConnection;
import com.entity.User;


@WebServlet("/user")
public class UserRegister extends HttpServlet{
	
	Connection connection;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			

			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User user = new User(name, email, password);
			
			User_DSQuery dbDsQuery = new User_DSQuery(DataBaseConnection.getConnection());
			
			HttpSession session = req.getSession();
			
			boolean flag = dbDsQuery.userRegister(user);
			
			if(flag) {
				session.setAttribute("successMsg", "Register Successfully");
				resp.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Something Went Wrong on Server! Please Try later");
				resp.sendRedirect("signup.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
