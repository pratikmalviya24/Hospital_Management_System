
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/CSS_JS_FontTemplate.jsp"%>
</head>

<style>
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


<body>

	<!-- NavBar-Section Start Here -->

	<%@include file="component/NavBar.jsp"%>
	<!-- NavBar-Section Ends Here Here -->

	<!-- Hero-Section Starts Here -->
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img
					src="https://revere-health.hqdemo.app/wp-content/uploads/AdobeStock_203833844-e1566838549214.jpeg"
					class="d-block w-100">
			</div>
		</div>
	</div>

	<!-- Hero-Section Ends Here -->

	<!-- Key-Feature-Section Starts Here -->
	<div class="container p-3">
		<p class="text-center fs-2">Key Features Of our Hospital</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">100% Safety</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Unde exercitationem voluptate nihil? Porro, expedita? Quae
									dicta odit error cum quisquam impedit tempore iste fugiat, hic
									maxime qui deserunt quod quia.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Clean Envirnoment</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Unde exercitationem voluptate nihil? Porro, expedita? Quae
									dicta odit error cum quisquam impedit tempore iste fugiat, hic
									maxime qui deserunt quod quia.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Friendly Doctor</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Unde exercitationem voluptate nihil? Porro, expedita? Quae
									dicta odit error cum quisquam impedit tempore iste fugiat, hic
									maxime qui deserunt quod quia.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<p class="fs-5">Medical Research</p>
								<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
									Unde exercitationem voluptate nihil? Porro, expedita? Quae
									dicta odit error cum quisquam impedit tempore iste fugiat, hic
									maxime qui deserunt quod quia.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div
				class="col-md-4 p-5 d-flex align-items-center justify-content-center">
				<img src="Images/download.jpeg" alt="" class="img-fluid">
			</div>
		</div>
	</div>
	<hr>

	<!-- Key-Feature-Section Ends Here -->


	<!--Team-Section Starts Here  -->
	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row">

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img
							src="https://cdn.create.vista.com/api/media/small/14779771/stock-photo-portrait-of-confident-young-doctor-on-white-background"
							alt="" width="250px" height="300px">
						<p class="fw-bold fs-5">Samuani Simi</p>
						<p class="fs-7">(CEO & Chairman)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img
							src="https://t3.ftcdn.net/jpg/02/95/51/80/360_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg"
							alt="" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Siva Kumar</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img
							src="https://img.freepik.com/premium-photo/medical-concept-indian-beautiful-female-doctor-white-coat-with-stethoscope-waist-up-medical-student-woman-hospital-worker-looking-camera-smiling-studio-blue-background_185696-621.jpg"
							alt="" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Niuise Paule</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>

			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img
							src="https://t4.ftcdn.net/jpg/03/20/52/31/360_F_320523164_tx7Rdd7I2XDTvvKfz2oRuRpKOPE5z0ni.jpg"
							alt="" width="250px" height="300px">
						<p class="fw-bold fs-5">Dr. Mathue Samuel</p>
						<p class="fs-7">(Chief Doctor)</p>
					</div>
				</div>
			</div>


		</div>
	</div>


	<!--Team-Section Ends Here  -->


	<!--Footer Section Starts Here  -->

	<%@include file="component/Footer.jsp"%>

	<!--Footer Section Ends Here  -->
</body>
</html>