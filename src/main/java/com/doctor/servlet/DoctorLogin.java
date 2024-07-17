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
import com.entity.Doctor;
import com.entity.User;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			HttpSession session = req.getSession();

			DoctorDao doa = new DoctorDao(DataBaseConnection.getConnection());
			Doctor doctor = doa.doctorLogin(email, password);

			if (doctor != null) {
				session.setAttribute("doctorObject", doctor);
				resp.sendRedirect("doctor/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Invalid email & password");
				resp.sendRedirect("doctor_login_page.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
