<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isErrorPage="false"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User-Login-Page</title>

<%@include file="component/CSS_JS_FontTemplate.jsp"%>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>
<body>
	<%@include file="component/NavBar.jsp"%>

	<hr>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 text-center">User Login</p>


						<form action="userLogin" method="post">
							<div class="mb-3">
								<label class="form-l abel">Email : </label> <input type="email"
									name="email" class="form-control" required />
							</div>
							<div class="mb-3">
								<label class="form-label">Password : </label> <input
									type="password" name="password" class="form-control" required />
							</div>

							<button class="btn bg-success text-white col-md-12" type="submit">Login</button>
						</form>
						<br> Don't have an account? <a href="signup.jsp"
							class="clink"> Create One </a>


					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>