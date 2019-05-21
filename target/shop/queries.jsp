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
<script type="text/javascript" src="js/jquery.min.js"></script>
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">body {
	background-image: url('Health.png');
	background-repeat:repeat-y;
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
	border-right: 0;
}
</style>
<script type="text/javascript">
	function passContent(obj) {
		var getObj = $(obj).parent().parent();
		$("#query").val($(getObj).find('p').eq(0).text());
		$("#qid").val($(getObj).find('p').eq(1).find('input').val());
	}
	function add() {
		var qid = $("#qid").val();
		var uname = $("#uName").val();
		var content = $("#content").val();

		alert("Add succeed.");
		window.location.href = "addComment.action?username1=" + uname + "&qid="
				+ qid + "&content=" + content;

	}

	function addQuery() {
		var uname = $("#uName2").val();
		var query = $("#query2").val();

		alert("Add query succeed.");
		window.location.href = "addQuery.action?username1=" + uname + "&query="
				+ query;

	}
</script>
</head>
<body style="min-height: 660px; cursor: auto;" class="edit">
	<%
		Pojo pojo = (Pojo) request.getAttribute("pojo");
		ArrayList<Queries> list = pojo.getQueries();
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
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span12">



				<font size="6" style="font-weight: bold">Query and Comment
					<button type="button" class="btn btn-danger" data-toggle="modal"
						data-target="#myModal2">Create Query?</button> <br> <br>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>

					<div class="hero-unit">
						<p><%=list.get(i).getContent()%><br> <font color="gray"
								size="4"><%=list.get(i).getUsername()%></font>
						</p>
						<h5><%=list.get(i).getqTime()%></h5>
						<p>
							<input type="hidden" value=<%=list.get(i).getId()%>>
						</p>
						<p>
							<a class="btn btn-primary btn-large"
								href="showDetails.action?id=<%=list.get(i).getId()%>&username=<%=u.getUsername()%>">Show
								Comments»</a>&nbsp;
							<button type="button" class="btn btn-info" data-toggle="modal"
								data-target="#myModal" onclick="passContent(this)">Add
								Comments+</button>
						</p>
					</div> <%
 	}
 %>
				
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Add Comments</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped">
						<tr>
							<td>Query id:</td>
							<td><input type="text" id="qid" readonly /></td>
						</tr>
						<tr>
							<td>User Name:</td>
							<td><input type="text" id="uName" value=<%=u.getUsername()%>
								readonly /></td>
						</tr>

						<tr>
							<td>Query:</td>
							<td><textarea rows="3" cols="20" id="query" readonly></textarea></td>
						</tr>
						<tr>
							<td>Enter Comments:</td>
							<td><textarea rows="3" cols="20" id="content"></textarea></td>
						</tr>
					</table>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary" onclick="add()">Finish</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</div>

	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Add Queries</h4>
				</div>
				<div class="modal-body">
					<table class="table table-striped">
						<tr>
							<td>User Name:</td>
							<td><input type="text" id="uName2"
								value=<%=u.getUsername()%> readonly /></td>
						</tr>

						<tr>
							<td>Enter Query:</td>
							<td><textarea rows="3" cols="20" id="query2"></textarea></td>
						</tr>
					</table>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="button" class="btn btn-primary" onclick="addQuery()">Finish</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal -->
		</div>

	</div>
</body>
</html>
