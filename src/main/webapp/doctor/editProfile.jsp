<%@page import="com.entity.SpecialList"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecialListDao"%>
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
<title>Edit Profile Page</title>
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

	<%@include file="navbar.jsp"%>



	<div class="container p-4">
		<div class="row">
			<div class="col-md-4">
				<div class="card paint-card">
					<p class="text-center fs-3">Change Password</p>
					<div class="card-body">
						<form action="changePassword" method="post">
							<%--  <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-danger">${errorMsg}</p>
                        <c:remove var="errorMsg" scope="session">
                    </c:if>
                    <c:if test="${not empty errorMsg}">
                        <p class="fs-4 text-center text-success">${succMsg}</p>
                        <c:remove var="succMsg" scope="session">
                    </c:if> --%>
							<div class="mb-3">
								<label>Enter New Password : </label> <input type="text"
									name="newPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>Enter Old Password : </label> <input type="text"
									name="oldPassword" class="form-control" required>
							</div>
							<input type="hidden" value="${userObject.id }" name="userID">
							<button class="btn btn-success col-md-12">Change
								Password</button>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
				<p class="text-center fs-3 ">Edit Profile</p>
					<div class="card-body">
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name : </label> <input
									type="text" required name="fullname" class="form-control" value="${doctorObject.fullName}"/>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB : </label> <input type="date"
									required name="dob" class="form-control" value="${doctorObject.dob}"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualification : </label> <input
									type="text" required name="qualification" class="form-control" value="${doctorObject.qualification }"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist : </label> <select required
									name="spec" class="form-control" value="${doctorObject.specialist }">
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
									required name="email" class="form-control" value="${doctorObject.email}"/>
							</div>
							<div class="mb-3">
								<label class="form-label">Mobile No : </label> <input
									type="text" required name="mobileNumber" class="form-control" value="${doctorObject.mobileNumber}"/>
							</div>
							<button type="submit" class="btn btn-primary col-md-12">Submit</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>