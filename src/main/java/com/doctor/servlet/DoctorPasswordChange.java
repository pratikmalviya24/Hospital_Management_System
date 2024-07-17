package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.dao.User_DSQuery;
import com.db.DataBaseConnection;

@WebServlet("/changeDoctorPassword")
public class DoctorPasswordChange extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userID"));
		String oldPasswordString = req.getParameter("oldPassword");
		String newPasswordString = req.getParameter("newPassword");
		
		DoctorDao daoDsQuery = new DoctorDao(DataBaseConnection.getConnection());
		HttpSession session = req.getSession();
		
		if(daoDsQuery.checkOldPassword(userId, oldPasswordString)) {
			if(daoDsQuery.updateUserPassword(userId, newPasswordString)) {
				session.setAttribute("succMsg", "Password Updated."); 
				resp.sendRedirect("doctor/editProfile.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Old Password is Incorrect"); 
				resp.sendRedirect("doctor/editProfile.jsp"); 
			}
		}
		else {
			session.setAttribute("errorMsg", "Old Password is Incorrect"); 
			resp.sendRedirect("doctor/editProfile.jsp");
		}
	}
	
}
