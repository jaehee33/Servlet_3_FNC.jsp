<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("btn");
	btn.addEventListener("click", function() {
		var n=document.getElementsByClassName("n");
		var check=true;
		for(var i=0; i<n.length; i++){
			if(n[i].value==""){
				alert("필수항목 입니다.")
				check=false;
				break;
			}
		}
		if(check){
			document.frm.submit();
			}
	});
	
}
</script>
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
.form-horizontal{
width: 50%;
margin: 0 auto;
padding: 0;
text-align: center;
}

</style>
</head>
<body>
<% // 회원가입폼 id,pw,name,email, phone, age,job %>
<%@ include file="../temp/header.jsp"%>
<section id="main">
		<form name="frm" class="form-horizontal"
			action="memberJoinProcess.jsp" method="post">
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id"
						placeholder="Enter id" name="id" class="n">
				</div>
			</div>
			
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">PassWord</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="password"
						name="password" placeholder="Enter password" class="n">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="name" placeholder="Enter name"
					name="name" class="n">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">E-Mail</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email"
						name="email" placeholder="Enter email" class="n">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Phone</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="phone"
						name="phone" placeholder="Enter phone" class="n">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="age">Age</label>
				<div class="col-sm-10">
					<input type="number" min="0" class="form-control" id="age"
						name="age" placeholder="Enter age" class="n">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-sm-2" for="job">Job</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="job"
						name="job" placeholder="Enter job" class="n">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-danger">Save</button>
				</div>
			</div>
		</form>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>