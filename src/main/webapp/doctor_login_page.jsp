<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor-Login-Page</title>

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
						<p class="fs-4 text-center">Doctor Login</p>
						<%-- 						<c:if test="${not empty successMsg}">
							<p class="text-center text-success fs-3"> ${successMsg} </p>
							<c:remove var="successMsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty errorMsg}">
							<p class="text-center text-success fs-3"> ${errorMsg} </p>
							<c:remove var="errorMsg" scope="session"/>
						 </c:if> --%>

						<form action="doctorLogin" method="post">
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


					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>