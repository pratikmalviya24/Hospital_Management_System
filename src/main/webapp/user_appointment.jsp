<%@page import="java.util.List"%>
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
<title>User Appointment</title>
<%@include file="component/CSS_JS_FontTemplate.jsp"%>
</head>
<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
<body>
	<%@include file="component/NavBar.jsp"%>
	<br />
	<br />
	<br />

	<div class="container p-3">
		<div class="row">
			<div class="col-md-5 p-5">
				<img
					src="https://png.pngtree.com/png-clipart/20230918/ourmid/pngtree-photo-men-doctor-physician-chest-smiling-png-image_10132895.png"
					alt="">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<%--  <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session">
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session">
                    </c:if> --%>
						<form action="addAppointment" method="post" class="row g-3">
							<input type="hidden" name="userId" value="${userObject.id}">
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Full Name :
								</label> <input required type="text" class="form-control"
									name="fullname">
							</div>

							<div class="col-md-6">
								<label>Gender : </label> <select name="gender" required
									class="form-control">
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>

							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Age : </label> <input
									type="number" class="form-control" name="age" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Appointment
									: </label> <input type="date" class="form-control" name="appoint_date"
									required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Email : </label> <input
									type="email" class="form-control" name="email" required>
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Mobile
									Number : </label> <input type=" " class="form-control"
									name="mobileNumber" required maxlength="10">
							</div>
							<div class="col-md-6">
								<label for="inputEmail4" class="form-label">Diseases : </label>
								<input type="text" class="form-control" name="diseases"required">
							</div>
							<div class="col-md-6">
								<label for="inputPassword4" class="form-label">Doctor</label> <select
									name="doctor" required class="form-control">
									<option value="">--select--</option>

									<%
									DoctorDao doctor = new DoctorDao(DataBaseConnection.getConnection());
									List<Doctor> list = doctor.getDoctorList();
									for (Doctor d : list) {
									%>

									<option value="<%=d.getId()%>"><%=d.getFullName()%>(<%=d.getSpecialist()%>)
									</option>
									<%
									}
									%>
								</select>
							</div>
							<div class="col-md-12">
								<label>Full Address</label>
								<textarea name="address" class="form-control" rows="3" cols=""
									required></textarea>
							</div>

							<%--   <c:if test="${empty userObject}">
                            <a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
                        </c:if>
                        <c:if test="${not empty userObject}">
                            <button  class="col-md-6 offset-md-3 btn btn-success">Submit</button>
                        </c:if> --%>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>