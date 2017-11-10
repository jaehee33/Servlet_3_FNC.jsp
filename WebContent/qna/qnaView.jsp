<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	int num = Integer.parseInt(request.getParameter("num"));
	QnaDAO qnaDAO = new QnaDAO();
	int result=qnaDAO.hitUpdate(num);
	QnaDTO qnaDTO= qnaDAO.selectOne(num);
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


#list {
	width: 75%;
	margin: 0 auto;
	margin-top: 20px;

}

.btn {
	float: right;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<article id="list">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Hit</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><%=qnaDTO.getTitle()%></td>
					<td><%=qnaDTO.getWriter()%></td>
					<td><%=qnaDTO.getReg_date()%></td>
					<td><%=qnaDTO.getHit()%></td>
				</tr>
				<tr>
					<td colspan="4"><%=qnaDTO.getContents()%></td>
				</tr>
			</tbody>
		</table>
		<%if(memberDTO !=null && memberDTO.getId().equals(qnaDTO.getWriter())) {%>
		<a  class="btn btn-info" href="./qnaDelete.jsp?num=<%=qnaDTO.getNum()%>">Delete</a>
		<%} %>
		<%if(memberDTO !=null && memberDTO.getId().equals(qnaDTO.getWriter())) {%>
		<a  class="btn btn-info" href="./qnaUpdateForm.jsp?num=<%=qnaDTO.getNum()%>">Update</a>
		<%} %>
		<a  class="btn btn-info" href="./qnaList.jsp">List</a>
		</article>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>