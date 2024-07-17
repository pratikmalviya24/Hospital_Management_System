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
import com.entity.User;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();
			
			User_DSQuery user_DSQuery = new User_DSQuery(DataBaseConnection.getConnection());
			User user = user_DSQuery.login(email,password);

			if (user!=null) {
				session.setAttribute("userObject",user);
				resp.sendRedirect("index.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid email & password");
				resp.sendRedirect("user_login.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
