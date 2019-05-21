<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.ssh.entity.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>Main Form</title>
    <link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
    <link rel="stylesheet" href="css/LoginRegister.css">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script>
	function showDetails(obj) {
		var value = $(obj).val();
		window.location.href = "ShowDetailsServlet?type=" + value;
	}
</script>
</head>

<body>
	<%
		User user = (User) request.getAttribute("us");
	%>
	<div class="wrapper">
		<form class="form-signin">
			<h2 class="form-signin-heading">Choose options</h2>

			<table class="table table-striped">
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						href="search.jsp?username1=<%=user.getUsername()%>">Medicine
							Search</a></td>

				</tr>
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						href="myOrders.action?username1=<%=user.getUsername()%>">My
							Orders</a></td>

				</tr>
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						href="query.action?username1=<%=user.getUsername()%>">Query
							and comment</a></td>

				</tr>
				<%
					if (user.get_type().equals("Admin")) {
				%>
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						href="managerMedicine.jsp?username1=<%=user.getUsername()%>">Manager Medicine</a></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						data-toggle="modal" data-target="#myModal">Personal
							information</a></td>

				</tr>
				<tr>
					<td><a class="btn btn-lg btn-primary btn-block"
						href="login.jsp">Logout</a></td>

				</tr>
			</table>


		</form>
	</div>


	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Personal information</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped">
						<tr>
							<td>User name:</td>
							<td><input type="text" value=<%=user.getUsername()%>
								readonly /></td>
						</tr>
						<tr>
							<td>Phone:</td>
							<td><input type="text" value=<%=user.getPhone()%> readonly /></td>
						</tr>

						<tr>
							<td>Address:</td>
							<td><input type="text" value=<%=user.getAddress()%> readonly /></td>
						</tr>
						<tr>
							<td>Type:</td>
							<td><input type="text" value=<%=user.get_type()%> readonly /></td>
						</tr>
					</table>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</div>
</body>

</html>
