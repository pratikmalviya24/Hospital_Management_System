<%@ page import="java.util.List" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.db.DataBaseConnection" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor | Appointment</title>
<%@include file="../component/CSS_JS_FontTemplate.jsp"%>
<style type="text/css">
.paint-card {
    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body>
    <%@include file="navbar.jsp"%>
    <br><br><br>
    <div class="container p-3">
        <div class="row">
            <div class="col-md-12">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-3 text-center">Patient Details</p>
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">Age</th>
                                    <th scope="col">Appointment Date</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Mobile Number</th>
                                    <th scope="col">Diseases</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                Doctor doctor = (Doctor) session.getAttribute("doctorObject");
                                if (doctor != null) {
                                    try {
                                        AppointmentDao dao = new AppointmentDao(DataBaseConnection.getConnection());
                                        List<Appointment> list = dao.getAllAppointmentByDoctor(doctor.getId());
                                        for (Appointment app : list) {
                                %>
                                <tr>
                                    <td><%= app.getFullName() %></td>
                                    <td><%= app.getAge() %></td>
                                    <td><%= app.getAppointmenDate() %></td>
                                    <td><%= app.getEmail() %></td>
                                    <td><%= app.getMobileNumber() %></td>
                                    <td><%= app.getDiseases() %></td>
                                    <td><%= app.getStatus() %></td>
                                    <td>
                                    
                                    <% 
                                    	if("Pending".equals(app.getStatus())){%>
                                    		<a href="comment.jsp?id=<%= app.getId()%>" class="btn btn-success btn-sm">Comment</a>
                                    	<%}
                                    	else{%>
                                    		<a href="#" class="btn btn-success btn-sm disabled">Comment</a>
                                    	<%}
                                    
                                    %>
                                    
                                    
                                    
                                    </td>
                                </tr>
                                <%
                                        }
                                    } catch (Exception e) {
                                        // Handle exceptions
                                        out.println("<tr><td colspan='8'>Error fetching appointments</td></tr>");
                                        e.printStackTrace();
                                    } 
                                } else {
                                    // Handle case where doctor is not found in session
                                    out.println("<tr><td colspan='8'>Doctor not found</td></tr>");
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
