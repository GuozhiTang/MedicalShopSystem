<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Register Form</title>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<link rel="stylesheet" href="css/LoginRegister.css">
<script>
	function login() {
		window.location.href = "login.jsp";
	}
</script>
</head>

<body>

	<div class="wrapper">
		<form class="form-signin" method="post" action="register.action">
			<h2 class="form-signin-heading">Please register</h2>
			<input type="text" class="form-control" name="username"
				placeholder="Username" required="" autofocus="" /> <input
				type="password" class="form-control" name="password"
				placeholder="Password" required="" /> <input type="text"
				class="form-control" name="phone" placeholder="Phone" required=""
				autofocus="" /> <input type="text" class="form-control"
				name="address" placeholder="Address" required="" autofocus="" />
			<button class="btn btn-lg btn-primary btn-block" type="submit">Register</button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="login()">Login</button>
			<%
				Object obj = request.getAttribute("fail");
				if (obj != null) {
			%>
			<font color="red">User name has already exist</font>
			<%
				}
			%>
		</form>
	</div>



</body>

</html>
