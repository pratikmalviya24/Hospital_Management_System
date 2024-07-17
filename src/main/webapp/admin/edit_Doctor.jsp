<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DataBaseConnection"%>
<%@page import="com.dao.SpecialListDao"%>
<%@page import="com.entity.SpecialList"%>
<%@page import="com.entity.Doctor"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Details</title>

<%@include file="../component/CSS_JS_FontTemplate.jsp"%>

</head>

<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

<body>

	<!-- NavBar-Section Start Here -->
	<%@include file="navbar.jsp"%>
	<!-- NavBar-Section Ends Here Here -->

	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Doctor Details</p>

						<%-- <c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 text-center text-success" role="alert">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if> --%>


						<%
						int id = Integer.parseInt(request.getParameter("id"));
						DoctorDao dao1 = new DoctorDao(DataBaseConnection.getConnection());
						Doctor doctor = dao1.getDoctorbyDoctorsID(id);
						%>

						<form action="../updateDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name : </label> <input
									type="text" required name="fullname" class="form-control"
									value="<%=doctor.getFullName()%>" />
							</div>
							<div class="mb-3">
								<label class="form-label">DOB : </label> <input type="date"
									required name="dob" class="form-control"
									value="<%=doctor.getDob()%>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification : </label> <input
									type="text" required name="qualification" class="form-control"
									value="<%=doctor.getQualification()%>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist : </label> <select required
									name="spec" class="form-control">
									<option>--select--</option>
									<%
									SpecialListDao dao = new SpecialListDao(DataBaseConnection.getConnection());
									List<SpecialList> specializations = dao.getAllSpecialList();

									for (SpecialList s : specializations) {
										String selected = "";
										if (s.getSpecialistName().equals(doctor.getSpecialist())) {
											selected = "selected";
										}
									%>
									<option <%=selected%>><%=s.getSpecialistName()%></option>
									<%
									}
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email : </label> <input type="text"
									required name="email" class="form-control"
									value="<%=doctor.getEmail()%>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No : </label> <input
									type="text" required name="mobileNumber" class="form-control"
									value="<%=doctor.getMobileNumber()%>" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password : </label> <input
									type="password" required name="password" class="form-control"
									value="<%=doctor.getPassword()%>" />
							</div>
							
							
							<!-- ??????????? -->
							<input type="hidden" name="id" value="<%= doctor.getId()%>">
							
							
							<button type="submit" class="btn btn-primary col-md-12">Save</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>