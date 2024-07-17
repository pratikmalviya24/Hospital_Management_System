<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DataBaseConnection"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor | Patient</title>
</head>
<%@include file="../component/CSS_JS_FontTemplate.jsp"%>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<body>
	<%@include file="navbar.jsp"%>

	<div class="col-md-12">
		<div class="card paint-card">
			<div class="card-body">
				<div class="fs-3 text-center">Patient Details</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Full Name</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment</th>
							<th scope="col">Email</th>
							<th scope="col">Mobile Number</th>
							<th scope="col">Diseases</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Address</th>
							<th scope="col">Status</th>
						</tr>
					</thead>
					<tbody>
						<%
						AppointmentDao app = new AppointmentDao(DataBaseConnection.getConnection());
						DoctorDao dao = new DoctorDao(DataBaseConnection.getConnection());
						List<Appointment> doctor = app.getAllAppointment();

						for (Appointment a : doctor) {
							Doctor d = dao.getDoctorbyDoctorsID(a.getDoctorId());
						%>
						<tr>
							<th><%=a.getFullName()%></th>
							<td><%=a.getAge()%></td>
							<td><%=a.getAppointmenDate()%></td>
							<td><%=a.getEmail()%></td>
							<td><%=a.getMobileNumber()%></td>
							<td><%=a.getDiseases()%></td>
							<td><%=d.getFullName()%></td>
							<td><%=a.getAddress()%></td>
							<td><%=a.getStatus()%></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
			</div>
		</div>
	</div>




</body>
</html>