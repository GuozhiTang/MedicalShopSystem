<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.ssh.entity.*,java.util.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
<link rel="stylesheet" href="css/LoginRegister.css">
<script>
	function register() {
		window.location.href = "register.jsp";
	}
</script>
</head>

<body>
    <div class="text-info"; align="center">
        <h1>Welcome to Your Personal Medical System</h1>
    </div>
	<div class="wrapper">
		<form class="form-signin" method="post" action="login.action">
			<h2 class="form-signin-heading">Sign in</h2>
			<input type="text" class="form-control" name="username"
				placeholder="Username" required="" autofocus="" /> <input
				type="password" class="form-control" name="password"
				placeholder="Password" required="" />

			<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
			<button class="btn btn-lg btn-primary btn-block" type="button"
				onclick="register()">Register</button>
			<%
				Object obj = request.getAttribute("fail");
				if (obj != null) {
			%>
			<font color="red">User name or password is wrong</font>
			<%
				}
			%>
		</form>
	</div>



</body>

</html>




