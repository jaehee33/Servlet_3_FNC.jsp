<%@page import="com.iu.member.MemberDTO"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
.form-horizontal {
	width: 30%;
	margin: 0 auto;
	padding: 0;
	margin-top: 20px;
}

h1 {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}

.job {
	margin: 0 auto;
	float: left;
}

</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>Member Update Form</h1>
		<form name="frm" class="form-horizontal"
			action="memberUpdateProcess.jsp" method="post">
			
<!-- pw start==================================== -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">PassWord</label>
				<div class="col-sm-10">
					<input type="password" class="form-control n" id="password1"
						name="password" placeholder="Enter password" value="<%=memberDTO.getPassword()%>">
						<span id="pwcheck1"></span>
				</div>
			</div>
<!-- pw end==================================== -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control n" id="name"
						placeholder="Enter name" name="name" value="<%=memberDTO.getName()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">E-Mail</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Enter email" class="n" value="<%=memberDTO.getEmail()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Phone</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone" name="phone"
						placeholder="Enter phone" class="n"
						value="<%=memberDTO.getPhone()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="age">Age</label>
				<div class="col-sm-10">
					<input type="number" min="0" class="form-control n" id="age"
						name="age" placeholder="Enter age" value="<%=memberDTO.getAge()%>">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="modify" id="check" class="btn btn-danger">
				</div>
			</div>
			
		</form>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>