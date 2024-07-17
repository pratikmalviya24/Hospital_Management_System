<%@page import="com.entity.Doctor"%>
<%@page import="com.db.DataBaseConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page isErrorPage="false" %> 
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor|Home Page</title>
<%@include file="../component/CSS_JS_FontTemplate.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
	<%-- <c:if test="${empty doctorObject }">
		<c:redirect url="../doctor_login_page.jsp"></c:redirect>
	</c:if> --%>
 <%
	Doctor doctor = (Doctor)(session.getAttribute("doctorObject"));
	DoctorDao dao = new DoctorDao(DataBaseConnection.getConnection());
	int appointment = dao.getTotalAppointmentByDoctorId(doctor.getId());
	%>

	<%@include file="navbar.jsp"%>
	<br>
	<br>
	<br>
	<p class="text-center fs-3">Doctor Dashboard</p>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-2">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br />
						<p class="fs-4 text-center">
							Doctor <br> <%=dao.getTotalDoctors()%>
						</p>
					</div>
				</div>
			</div>


			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="far fa-calendar-check fa-3x"></i><br />
						<p class="fs-4 text-center">
							Total Appointment<br /><%=appointment%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>