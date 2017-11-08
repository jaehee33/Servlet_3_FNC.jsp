<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   Cookie [] ar= request.getCookies();
    String cId="";
    for(int i=0; i<ar.length; i++){
    	if(ar[i].getName().equals("id")){
    		cId=ar[i].getValue();
    		break;
    	}
    }
    %>
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
<h1>Login Form</h1>
		<form name="frm" class="form-horizontal"
			action="memberLoginProcess.jsp" method="post">
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" value="<%=cId %>" id="id"
						placeholder="Enter id" name="id">
				</div>
			</div>
			
			<!-- checkBox -->
	<div class="form-group">
				<label class="control-label col-sm-2" for="Job">ID저장</label>
				<div class="col-sm-10">
					<input type="checkbox" value="save" class="checkbox-inline" name="save">
				</div>
			</div>
			<!-- checkBox -->
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">PassWord</label>
				<div class="col-sm-10">
					<input type="password" class="form-control n" id="password1"
						name="password" placeholder="Enter password">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="job">Job</label>
				<div class="col-sm-10">
					Student <input type="radio" class="radio-inline" name="job"
						value="S" checked="checked"> Teacher<input type="radio"
						class="radio-inline" name="job" value="T">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" value="Login" id="check" class="btn btn-danger">
				</div>
			</div>
		</form>

	</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>