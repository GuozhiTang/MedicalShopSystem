<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.ssh.entity.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>My Orders</title>
	<link rel='stylesheet prefetch' href='css/bootstrap.min.css'>
	<link rel="stylesheet" href="css/style.css">
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
<style type="text/css">
</style>
</head>
<body>
	<%
		Pojo pojo = (Pojo) request.getAttribute("pojo");
		ArrayList<OrdersInfo> list = pojo.getOrders();
		User u = pojo.getUser();
	%>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="back.action?username=<%=u.getUsername()%>">Main page</a></li>
					<li><a href="login.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
	</div>
	<div align="center">

		<h1><%=u.getUsername()%>'s Orders Information
		</h1>
		<br> <br> <br>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Order number:</th>
					<th>Medicine Name:</th>
					<th>Purchase quantity:</th>
					<th>Total price:</th>
					<th>Purchase Time:</th>
					<th>Status:</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getmName()%></td>
					<td><%=list.get(i).getNum()%></td>
					<td><%=list.get(i).getTotalPrice()%></td>
					<td><%=list.get(i).getOrderTime()%></td>
					<td><%=list.get(i).getStatus()%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>



	</div>
</body>
</html>