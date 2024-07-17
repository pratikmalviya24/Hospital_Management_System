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
			<div class="col-md-12 ">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Doctor Details</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">DOB</th>
									<th scope="col">Qualification</th>
									<th scope="col">Specialist</th>
									<th scope="col">Email</th>
									<th scope="col">Mobile No.</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								DoctorDao dao1 = new DoctorDao(DataBaseConnection.getConnection());
								List<Doctor> doctors = dao1.getDoctorList();
								for (Doctor doctor : doctors) {
								%>
								<tr>
									<td><%=doctor.getFullName()%></td>
									<td><%=doctor.getDob()%></td>
									<td><%=doctor.getQualification()%></td>
									<td><%=doctor.getSpecialist()%></td>
									<td><%=doctor.getEmail()%></td>
									<td><%=doctor.getMobileNumber()%></td>
									<td><a href="edit_Doctor.jsp?id=<%=doctor.getId()%>"
										class="btn btn-sm btn-primary"> Edit</a> <a
										href="deleteDoctor?id=<%=doctor.getId()%>"
										class="btn btn-sm btn-danger"> Delete</a></td>
								</tr>
								<%
								}
								%>


							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
	</div>

</body>
</html>