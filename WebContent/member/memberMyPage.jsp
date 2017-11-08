<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> ar = memberDAO.selectList();
	
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- bootstrap 시작-->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- bootstrap 끝-->
<link href="../css/header.css" rel="stylesheet">
<style type="text/css">
h1{
width: 30%;
margin: 0 auto;
text-align: center;
}
#list{
width: 75%;
margin: 0 auto;
margin-top: 20px;
text-align: center;
}
.btn{
float: right;
}
.button{
height: 25px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>MyPage</h1>
		<article id="list">
			<a class="btn btn-danger" href="./memberJoinForm.jsp">Join</a>
			<table class="table table-striped">
				<tr>
					<td>ID</td>
					<td>PASSWORD</td>
					<td>NAME</td>
					<td>EMAIL</td>
					<td>PHONE</td>
					<td>AGE</td>
					<td>JOB</td>
				</tr>
				<%for (MemberDTO memberDTO2 : ar) {%>
				<tr>
					<td><%=memberDTO.getId()%></td>
					<td><a href="memberMyPage.jsp?id=<%=memberDTO.getId()%>"><%=memberDTO.getName()%></a></td>
					<td><%=memberDTO.getEmail()%></td>
					<td><%=memberDTO.getPhone()%></td>
					<td><%=memberDTO.getAge()%></td>
				</tr>
				<%}%>
			</table>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>