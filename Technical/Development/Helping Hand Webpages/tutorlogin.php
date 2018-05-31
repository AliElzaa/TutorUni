<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Helping Hand</title>

	<link rel="icon" type="image/png" href="logo.png">

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

	<!-- Owl Carousel -->
	<link type="text/css" rel="stylesheet" href="css/owl.carousel.css" />
	<link type="text/css" rel="stylesheet" href="css/owl.theme.default.css" />

	<!-- Font Awesome Icon -->
	<link rel="stylesheet" href="css/font-awesome.min.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />


</head>

<body>

<?php
require('config.php');
session_start();
//If form submitted, insert values into the database.
if (isset($_POST['username'])){
	//removes backslashes
	$username = stripslashes($_REQUEST['username']);
	//escapes special characters in a string
	$username = mysqli_real_escape_string($con,$username);
	$password = stripslashes($_REQUEST['password']);
	$password = mysqli_real_escape_string($con,%password);
	//Checking is user existing in the database or not
		$query = "SELECT * FROM 'users' WHERE username='$username and
		password='".md5($password)."'";
	$result = msqli_query($con,$query) or die(mysql_error());
	$rows = mysqli_num_rows($result);
		if($rows==1){
			$_SESSION['username'] = $username;
				//Redirect user to index.php
				header("Loction: index.php");
			} else {
				echo "div class='form'>
				<h3>Username/password is incorrect.</h3>
				<br/>Click here to <a href='tutorlogin.php'>Login</a></div>";
			}
		}else {
			}


 ?>

	<!-- Header -->
	<header id="home">
		<!-- Background Image -->
		<div class="bg-img" style="background-image: url('./img/background1.jpg');">
			<div class="overlay"></div>
		</div>
		<!-- /Background Image -->

		<!-- Nav -->
		<nav id="nav" class="navbar nav-transparent">
			<div class="container">

				<div class="navbar-header">
					<!-- Logo -->
					<div class="navbar-brand">
						<a href="index.html">
							<img class="logo" src="img/logo.png" alt="logo">
							<img class="logo-alt" src="img/logo.png" alt="logo">
						</a>
					</div>
					<!-- /Logo -->

					<!-- Collapse nav button -->
					<div class="nav-collapse">
						<span></span>
					</div>
					<!-- /Collapse nav button -->
				</div>

				<!--  Main navigation  -->
				<ul class="main-nav nav navbar-nav navbar-right">
					<li><a href="#home">Home</a></li>
					<li><a href="#about">About</a></li>
					<li><a href="#service">Services</a></li>
					<li><a href="#contact">Contact</a></li>
					<li><a href="#signup">Sign-Up/Login</a></li>
					</ul>
				<!-- /Main navigation -->

			</div>
		</nav>
		<!-- /Nav -->

		<!-- home wrapper -->
		<div class="home-wrapper">
			<div class="container">
				<div class="row">

							<div class="row">



								<div class="white-text">
								 <label color="#000000">Tutor Login</label>
								</br>
									<div class="row black-text">

										</br>
											<input  type="text" placeholder="Enter Username"" color="#000000" name="username" required></br></br>

											<input type="password" placeholder="Enter Password"" name="pword" required>

									</div></br>

									<div class="row">

										<button class="main-btn">Login</button>
									</div>
								</div>
							</div>

					<!-- /home content -->

				</div>
			</div>
		</div>
		<!-- /home wrapper -->

	</header>
	<!-- /Header -->

	<!-- jQuery Plugins -->
	<script type="text/javascript" src="js/jquery.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="js/main.js"></script>

</body>

</html>
