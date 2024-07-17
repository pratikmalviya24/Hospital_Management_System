package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DataBaseConnection;
import com.entity.Appointment;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int userId = Integer.parseInt(req.getParameter("userId"));
		int dcotorId = Integer.parseInt(req.getParameter("doctor"));
		String fullName = req.getParameter("fullName");
		String age = req.getParameter("Age");
		String email = req.getParameter("email");
		String mobileNumber = req.getParameter("mobileNumber");
		String diseases = req.getParameter("diseases");
		String address = req.getParameter("address");
		String dateString = req.getParameter("appoint_date");
		Appointment appointment = new Appointment();
		appointment.setAge(age);
		appointment.setAddress(address);
		appointment.setDiseases(diseases);
		appointment.setAppointmenDate(dateString);
		appointment.setUserId(userId);
		appointment.setDoctorId(dcotorId);
		appointment.setEmail(email);
		appointment.setMobileNumber(mobileNumber);
		appointment.setFullName(fullName);
		appointment.setStatus("Pending...");
	
		AppointmentDao dao =new AppointmentDao(DataBaseConnection.getConnection());

		
		HttpSession session = req.getSession();
		if(dao.addAppointment(appointment)) {
			session.setAttribute("succMsg", "Appointment Added Successfully");
			resp.sendRedirect("user_appointment.jsp");
		
		}
		else {
			session.setAttribute("errorMsg", "Failed....");
			resp.sendRedirect("user_appointment.jsp");
		}
		
		
	}

}
