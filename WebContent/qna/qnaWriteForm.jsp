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
<script src="https://cdn.ckeditor.com/4.7.3/full/ckeditor.js"></script>
<script type="text/javascript">
window.onload=function(){
	CKEDITOR.replace('contents');
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
h1 {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}

#list {
	width: 75%;
	margin: 0 auto;
	margin-top: 20px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
	<h1>Q&A Write Form</h1>
		<form id="list" name="frm" class="form-horizontal" action="qnaWriteProcess.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="writer">작성자</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="writer"
						placeholder="Enter writer" name="writer" class="n"
						readonly="readonly" value="<%=memberDTO.getId()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="title" name="title" 
						placeholder="Enter Title" class="n">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="contents">내용</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="5" id="contents" 
					name="contents" class="n"></textarea> 
				</div>
			</div>
			<!--  첨부파일 -->
			<div class="form-group">
				<label class="control-label col-sm-2" for="contents">File</label>
				<div class="col-sm-10">
					<input type="file" name="file" class="form-control">
					<input type="file" name="file2" class="form-control">
				</div>
			</div>


			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button class="btn btn-danger">올리기</button>
				</div>
			</div>
		</form>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>