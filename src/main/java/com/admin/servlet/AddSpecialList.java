package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecialListDao;
import com.db.DataBaseConnection;
import com.entity.User;

@WebServlet("/addSpecialist")
public class AddSpecialList extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");

		SpecialListDao spec = new SpecialListDao(DataBaseConnection.getConnection());
		boolean isAdded = spec.addSpecialList(specName);
		HttpSession session = req.getSession();
		
		
		if (isAdded) {
			session.setAttribute("succMsg", "Added Succesfully!");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Registration Failed!");
			resp.sendRedirect("admin/index.jsp");
		}
	}

}
