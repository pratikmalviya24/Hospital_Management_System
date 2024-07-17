<%@ page import="java.util.List"%>
<%@ page import="com.entity.Appointment"%>
<%@ page import="com.db.DataBaseConnection"%>
<%@ page import="com.dao.AppointmentDao"%>
<%@ page import="com.entity.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor | Comment</title>
<%@include file="../component/CSS_JS_FontTemplate.jsp"%>
<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>

	<%-- <c:if test="${empty doctorObject}">
		<c:redirect url="../doctor_login_page.jsp"></c:redirect>
	</c:if> --%>


	<%@include file="navbar.jsp"%>
	<br>
	<br>
	<br>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-4">Patient Comment</p>

						<%
int id = Integer.parseInt(request.getParameter("id"));
AppointmentDao dao = new AppointmentDao(DataBaseConnection.getConnection());

Appointment app = dao.getAppointmentById(id);
%>



						<form action="../updateStatus" class="row" method="post">
							<div class="col-md-6">
								<label>Patient Name: </label> <input type="text" readonly
									value="<%=app.getFullName()%>" class="form-control">
							</div>
							<div class="col-md-6">
								<label>Age : </label> <input type="text"
									value="<%=app.getAge()%>" readonly class="form-control">
							</div>
							<div class="col-md-6">
								<br> <label>Mobile number : </label> <input type="text"
									value="<%=app.getMobileNumber()%>" readonly
									class="form-control" value="">
							</div>
							<div class="col-md-6">
								<label>Diseases : </label> <input type="text" value="" readonly
									class="form-control" value="<%=app.getDiseases()%>">
							</div>
							<div class="col-md-12">
								<label>Comment : </label>
								<textarea name="comment" class="form-control" rows="3" cols=""
									required></textarea>
							</div>
							<input type="hidden" name="id" value="<%=app.getId()%>">
							<input type="hidden" name="doctorId"
								value="<%=app.getDoctorId()%>">

							<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
