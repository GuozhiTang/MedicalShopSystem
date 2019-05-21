<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.ssh.entity.*,java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager Medicine</title>
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
<script>
	

	function deleteOp(obj) {
		var getObj = $(obj).parent().parent();
		var mn = $(getObj).find('td').eq(1).text();
		var un=$("#un").val();
		window.location.href = "deleteMedicine.action?mn=" + mn+"&username="+un;

	}
</script>
</head>
<body>
	<%
	boolean first = true;

		Pojo pojo = (Pojo) request.getAttribute("pojo");
		ArrayList<Medicine> list = null;
		User u = null;
		if (pojo == null) {
			list = new ArrayList<Medicine>();
			u = new User();
			u.setUsername(request.getParameter("username1"));
		} else {
			list = pojo.getMedicines();
			u = pojo.getUser();
			first=false;
		}
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
		<h1>Manager Medicine</h1>
		<br> <br> <br>
		<form class="form-search" method="post" action="search2.action">
		<%
				if (first) {
			%>
			<input type="hidden" value=<%=request.getParameter("username1")%>
				name="username2">
			<%
				} else {
			%>
			<input type="hidden" value=<%=u.getUsername()%> name="username2">

			<%
				}	
			%>
			<input class="input-medium search-query" type="text" name="keyword"
				id="kWord" />
			<button type="submit" class="btn">Search By Name</button>
		</form>
		<br>
		<button type="button" class="btn btn-info" data-toggle="modal"
			data-target="#myModal">Add Medicine+</button>
			<%
				Object obj = request.getAttribute("fail");
				if (obj != null) {
			%>
			<font color="red">User name has already exist</font>
			<%
				}
			%>
		<br> <br>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Medicine Name</th>
					<th>Price</th>
					<th>Stock</th>
					<th>Description</th>
					<th>Option</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (int i = 0; i < list.size(); i++) {
				%>
				<tr>
					<td style='display: none'><%=list.get(i).getId()%></td>
					<td><%=list.get(i).getMedicinename()%></td>
					<td><%=list.get(i).getPrice()%></td>
					<td><%=list.get(i).getStock()%></td>
					<td><%=list.get(i).getDes()%></td>
					<td><button type="button" class="btn btn-danger"
							onclick="deleteOp(this)">Delete</button></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<form method="post" action="addMedicine.action">
			<input type="hidden" value=<%=u.getUsername() %> id="un" name="username">
		
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Add medicine</h4>
						</div>

						<div class="modal-body">
							<table class="table table-striped">
								<tr>
									<td>Medicine Name:</td>
									<td><input type="text" name="medicinename" /></td>
								</tr>
								<tr>
									<td>Price:</td>
									<td><input type="text" name="price" /></td>
								</tr>
								<tr>
									<td>Stock:</td>
									<td><input type="text" name="stock" /></td>
								</tr>


								<tr>
									<td>Description:</td>
									<td><textarea rows="3" cols="20" name="des"></textarea></td>
								</tr>
							</table>

							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-primary">Finish</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal -->
				</div>

			</div>
		</form>
</body>
</html>