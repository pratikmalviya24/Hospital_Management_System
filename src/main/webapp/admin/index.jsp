<%@page import="com.db.DataBaseConnection"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="../component/CSS_JS_FontTemplate.jsp"%>
</head>

<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<body>
	<%@include file="navbar.jsp"%>
	<div class="container p-5">
		<p class="text-center fs-3">Admin DashBoard</p>

		<%--   <c:if test="${not empty errorMsg}">
    <p class="fs-3 text-center text-danger">${errorMsg}</p>
    <c:remove var="errorMsg" scope="session"/>
  </c:if>
  <c:if test="${not empty succMsg}">
    <p class="fs-3 text-center text-danger">${succMsg}</p>
    <c:remove var="succMsg" scope="session"/>
  </c:if> --%>

		<% DoctorDao dao = new DoctorDao(DataBaseConnection.getConnection());
			int doctors = dao.getTotalDoctors();
			int users = dao.getTotalUser();
			int appointment = dao.getTotalAppointment();
			int specialist = dao.getTotalSpecialList();
		%>

		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Doctor <br> <%=doctors%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-user-circle fa-3x"></i><br>
						<p class="fs-4 text-center">
							User <br> <%=users%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Total Appointment <br> <%=appointment%>
						</p>
					</div>
				</div>
			</div>
			<div class="col-md-4 mt-2" data-bs-toggle="modal"
				data-bs-target="#exampleModal">
				<div class="card paint-card">
					<div class="card-body text-center text-success">
						<i class="fas fa-calendar-check fa-3x"></i><br>
						<p class="fs-4 text-center">
							Specialist <br> <%=specialist%>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>




	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="addSpecialist" method="post">
						<div class="form-group">
							<label> Enter Specialist Name : </label> <input type="text"
								name="specName" class="form-control">
						</div>
						<div class="text-center mt-3">
						<button type="submit" class="btn btn-primary">Save
							Changes</button>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>



</body>
</html>