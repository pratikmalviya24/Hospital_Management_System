package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DoctorDao;
import com.db.DataBaseConnection;
import com.entity.Doctor;

@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String name = req.getParameter("fullname");
			String dob = req.getParameter("dob");
			String qualification = req.getParameter("qualification");
			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobileNumber = req.getParameter("mobileNumber");
			String password = req.getParameter("password");
			int id = Integer.parseInt(req.getParameter("id"));

			Doctor doctor = new Doctor(id,name, dob, qualification, spec, email, mobileNumber, password);
			
			DoctorDao dao = new DoctorDao(DataBaseConnection.getConnection());
			HttpSession session = req.getSession();
			
			if(dao.updateDoctor(doctor)) {
				session.setAttribute("succMsg", "Updated Successfully");
				resp.sendRedirect("admin/view_doctor.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed");
				resp.sendRedirect("admin/view_doctor.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
