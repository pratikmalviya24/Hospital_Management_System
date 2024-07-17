<nav class="navbar navbar-expand-lg navbar-dark bg-success fixed-top">
	<div class="container-fluid">

		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-house-chimney-medical"></i> Medi-Home</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="admin_login_page.jsp"><i
						class="fa-solid fa-right-to-bracket"></i>Admin</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="doctor_login_page.jsp">Doctor</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_appointment.jsp">Appointment</a></li>
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="user_login.jsp">User</a></li>



				<!-- User NavBar -->
				
				
				<%-- 				<c:if text="${empty userObject}">

					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login_page.jsp"><i
							class="fa-solid fa-right-to-bracket"></i>Admin</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login_page.jsp">Doctor</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">Appointment</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">User</a></li>
				</c:if> --%>


				<%-- 				<c:if text="${ not empty userObject}">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">Appointment</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ViewAppointment.jsp">View Appointment</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa-solid fa-circle-user"></i>	${ userObject.name} </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="ChangePassword.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
						</ul></li>
				</c:if> --%>



			</ul>
		</div>
	</div>
</nav>