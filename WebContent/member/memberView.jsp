<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    MemberDTO memberDTO=new MemberDTO();
    memberDTO.setId(request.getParameter("id"));
    memberDTO.setPassword(request.getParameter("password"));
    memberDTO.setName(request.getParameter("name"));
    memberDTO.setEmail(request.getParameter("email"));
    memberDTO.setPhone(request.getParameter("phone"));
    memberDTO.setAge(Integer.parseInt(request.getParameter("age")));
    memberDTO.setJob(request.getParameter("job"));
    
    MemberDAO memberDAO = new MemberDAO();
    memberDTO=memberDAO.selectOne(memberDTO);

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
	<section id="main">
		<h1>Member List</h1>
		<article id="list">

			<a class="btn btn-danger" href="./memberJoinForm.jsp">Join</a>
			<table class="table table-striped">
			<thead>
				<tr>
					<td>ID</td>
					<td>NAME</td>
					<td>EMAIL</td>
					<td>PHONE</td>
					<td>AGE</td>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td><%=memberDTO.getId()%></td>
					<td><%=memberDTO.getName()%></td>
					<td><%=memberDTO.getEmail()%></td>
					<td><%=memberDTO.getPhone()%></td>
					<td><%=memberDTO.getAge()%></td>
				</tr>
				</tbody>
			</table>
	
		</article>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>