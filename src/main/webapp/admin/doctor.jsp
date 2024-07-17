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
		
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Registration</p>

						<%-- <c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<p class="fs-3 text-center text-success" role="alert">${succMsg}</p>
							<c:remove var="succMsg" scope="session" />
						</c:if> --%>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name : </label> <input
									type="text" required name="fullname" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">DOB : </label> <input type="date"
									required name="dob" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification : </label> <input
									type="text" required name="qualification" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist : </label> <select required
									name="spec" class="form-control">
									<option>--select--</option>




									<%
									SpecialListDao dao = new SpecialListDao(DataBaseConnection.getConnection());
									List<SpecialList> name = dao.getAllSpecialList();

									for (SpecialList s : name) {
									%>

									<option><%=s.getSpecialistName()%></option>

									<%
									}
									%>

									<option>Demo</option>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email : </label> <input type="text"
									required name="email" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No : </label> <input
									type="text" required name="mobileNumber" class="form-control" />
							</div>
							<div class="mb-3">
								<label class="form-label">Password : </label> <input
									type="password" required name="password" class="form-control" />
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>