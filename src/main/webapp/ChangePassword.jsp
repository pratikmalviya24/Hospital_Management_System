<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isErrorPage="false"%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>

<%@include file="component/CSS_JS_FontTemplate.jsp"%>

<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>
	<%@include file="component/NavBar.jsp"%>
	<br><br><br><br><br>
	
	<%-- <c:if test="${empty userObject }">
		<c:redirect url="user_login_page.jsp"/>
	</c:if> --%>
	

	<div class="container p-4">
    <div class="row">
        <div class="col-md-4 offset-md-4">
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
                            <label>Enter New Password : </label>
                            <input type="text" name="newPassword" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Enter Old Password : </label>
                            <input type="text" name="oldPassword" class="form-control" required>
                        </div>
                        <input type="hidden" value="${userObject.id }" name="userID">
                        <button class="btn btn-success col-md-12"> Change Password</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>