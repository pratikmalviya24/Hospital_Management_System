package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.db.DataBaseConnection;

@WebServlet("/updateStatus")
public class updateStatus extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			int doctor_id = Integer.parseInt(req.getParameter("doctorId"));
			String comment = req.getParameter("comment");
			
			
			AppointmentDao dao = new AppointmentDao(DataBaseConnection.getConnection());
			HttpSession session = req.getSession();
			if(dao.updateCommentStatus(id, doctor_id, comment)) {
				session.setAttribute("succMsg", "Comment Updated");
				resp.sendRedirect("doctor/patient.jsp");
			}
			else {
				session.setAttribute("errorMsg", "Failed");
				resp.sendRedirect("doctor/patient.jsp");
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
}
