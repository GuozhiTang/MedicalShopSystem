<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="com.ssh.entity.*,java.util.*"%>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<style type="text/css">
body {
	background: #FFFAFA
}

.hero-unit {
	background: #FFFAF0
}

#menu {
	font: 12px verdana, arial, sans-serif;
}

#menu, #menu li {
	list-style: none;
	padding: 0;
	margin: 0;
}

#menu li {
	float: left;
}

#menu li a {
	display: block;
	padding: 8px 50px;
	background: #3A4953;
	color: #fff;
	text-decoration: none;
	border-right: 1px solid #000;
}

#menu li a:hover {
	background: #146C9C;
	color: #fff;
	text-decoration: none;
	border-right: 1px solid #000;
}

#menu li a.last {
	border-right: 0; /* 去掉左侧边框 */
}
</style>
</head>
<body style="min-height: 660px; cursor: auto;" class="edit">
	<%
		Pojo pojo = (Pojo) request.getAttribute("pojo");
		ArrayList<Comments> list = pojo.getComments();
		User u = pojo.getUser();
		Queries query = pojo.getOneQuery();
	%>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">
				<ul class="nav nav-tabs">
					<li class="active"><a
						href="back.action?username=<%=u.getUsername()%>">Main page</a></li>
					<li><a href="query.action?username1=<%=u.getUsername()%>">Query
							list</a></li>
					<li><a href="login.jsp">Logout</a></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">


				<font size="6" style="font-weight: bold">
					<font size="6">Query: <%=query.getContent()%></font><br> <font
					size="4">Query user name: <%=query.getUsername()%></font><br>

					<font size="4">Query time: <%=query.getqTime()%></font>
					<br><br>
					<font size="4" color="gray"> Comments list: </font><br><br>
					 <%
 	for (int i = 0; i < list.size(); i++) {
 %>

					<div class="hero-unit">
						<p><%=list.get(i).getContent()%><br> <font color="gray"
								size="4"><%=list.get(i).getUsername()%></font>
						</p>
						<h5><%=list.get(i).getCtime()%></h5>


					</div> <%
 	}
 %>
			</div>
		</div>
	</div>
</body>
</html>
