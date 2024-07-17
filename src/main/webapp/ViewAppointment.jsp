<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DataBaseConnection"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isErrorPage="false"%> --%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AppointMent Page</title>

<%@include file="component/CSS_JS_FontTemplate.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<%-- <c:if test="${empty userObject }">
		<c:redirect url="user_login_page.jsp"/>
	</c:if> --%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">AppointmentList</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>

								<%
								User user = (User)session.getAttribute("userObject");
								int userId = user.getId();
								AppointmentDao dao = new AppointmentDao(DataBaseConnection.getConnection());
								List<Appointment> list = dao.getAllAppointment(userId);
								DoctorDao dao2 = new DoctorDao(DataBaseConnection.getConnection());
								for (Appointment a : list) {
									Doctor doctor = dao2.getDoctorbyDoctorsID(a.getDoctorId());
								%>
								<tr>
									<th><%=a.getFullName()%></th>
									<td><%=a.getAge()%></td>
									<td><%=a.getAppointmenDate()%></td>
									<td><%=a.getDiseases()%></td>
									<td><%=doctor.getFullName()%></td>
									<td><%=a.getStatus()%></td>
									<td>
										<% if("Pending".equals(a.getStatus())){%>
											
											<a href="#" class="btn btn-sm btn-warning">Pending...</a>
										<%}
										else{%>
											<a href="#" class="btn btn-sm btn-success">Done</a>
											
										<%}
										%>
									</td>
								</tr>
								<%
								}
								
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-3 p-3">
				<img
					src="https://png.pngtree.com/png-clipart/20230918/ourmid/pngtree-photo-men-doctor-physician-chest-smiling-png-image_10132895.png"
					alt="">
			</div>
		</div>
	</div>

</body>
</html>