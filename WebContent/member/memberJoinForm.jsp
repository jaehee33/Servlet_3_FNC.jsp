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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("overlap");
	btn.addEventListener("click", function() {
		var id=document.frm.id.value;
		window.open("memberIdCheck.jsp?id="+id, "", "top=200, left=300, width=400, height=300");
	});
	var result=true;
	var result2=true;
	var check=document.getElementById("check");
	check.addEventListener("click", function() {
		var n=document.getElementsByClassName("n");
		for(var i=0; i<n.length; i++){
			if(n[i].value==""){
				result=false;
			}
		}
		if(n[0].value !==n[1].value){
			result2=false;
		}
		if(result && result2){
			document.frm.submit();
		}else{
			alert("모두 입력 하세요");
		}
		
	});
	
	var password1=document.getElementById("password1");
	var password2=document.getElementById("password2");
	var pwResult=false;
	password2.addEventListener("blur", function() {
		var pwcheck2=document.getElementById("pwcheck2");
		if(password1.value==password2.value){
			pwcheck2.innerHTML="OK"
			pwcheck2.style.color="green";
			pwReasult=true;
		}else{
			pwcheck2.innerHTML="일치하지 않습니다."
				pwcheck2.style.color="red";
			pwReasult=false;
		}
	});
	
	
}
</script>
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
.form-horizontal {
	width: 30%;
	margin: 0 auto;
	padding: 0;
	text-align: center;
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

#id {
	display: inline-block;
}

#overlap {
	float: right;
}
</style>
</head>
<body>
	<% // 회원가입폼 id,pw,name,email, phone, age,job %>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>Member Join Form</h1>
		<form name="frm" class="form-horizontal"
			action="memberJoinProcess.jsp" method="post">

			<div class="form-group">
				<label class="control-label col-sm-2" for="id">ID</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="id"
						placeholder="Enter id"> <input
						type="button" value="중복확인" class="btn btn-default" id="overlap">
				</div>
			</div>
<!-- pw start
==================================== -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">PassWord</label>
				<div class="col-sm-10">
					<input type="password" class="form-control n" id="password1"
						name="password" placeholder="Enter password">
						<span id="pwcheck1"></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="password">PassWord</label>
				<div class="col-sm-10">
					<input type="password" class="form-control n" id="password2"
						placeholder="Enter password">
						<span id="pwcheck2"></span>
				</div>
			</div>
<!-- pw end==================================== -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="name">Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control n" id="name"
						placeholder="Enter name" name="name">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">E-Mail</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="email" name="email"
						placeholder="Enter email" class="n">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="phone">Phone</label>
				<div class="col-sm-10">
					<input type="text" class="form-control n" id="phone" name="phone"
						placeholder="Enter phone">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="age">Age</label>
				<div class="col-sm-10">
					<input type="number" min="0" class="form-control n" id="age"
						name="age" placeholder="Enter age">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="job">Job</label>
				<div class="col-sm-10">
					Student <input type="radio" class="radio-inline" name="job"
						value="S" checked="checked"> Teacher<input
						type="radio" class="radio-inline" name="job" value="T">
				</div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" value="save" id="check" class="btn btn-danger">
				</div>
			</div>
			
		</form>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>