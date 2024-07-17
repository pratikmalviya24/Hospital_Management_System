package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.User_DSQuery;
import com.db.DataBaseConnection;


@WebServlet("/changePassword")
public class ChangePasswordServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userID"));
		String oldPasswordString = req.getParameter("oldPassword");
		String newPasswordString = req.getParameter("newPassword");
		
		User_DSQuery daoDsQuery = new User_DSQuery(DataBaseConnection.getConnection());
		HttpSession session = req.getSession();
		
		if(daoDsQuery.checkOldPassword(userId, oldPasswordString)) {
			if(daoDsQuery.updateUserPassword(userId, newPasswordString)) {
				session.setAttribute("succMsg", "Password Updated."); 
				resp.sendRedirect("ChangePassword.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Old Password is Incorrect"); 
				resp.sendRedirect("ChangePassword.jsp"); 
			}
		}
		else {
			session.setAttribute("errorMsg", "Old Password is Incorrect"); 
			resp.sendRedirect("ChangePassword.jsp");
		}
	}
	
}
