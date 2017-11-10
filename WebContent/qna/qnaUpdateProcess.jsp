<%@page import="oracle.net.aso.q"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@page import="com.iu.qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	QnaDTO qnaDTO=new QnaDTO();
	qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setWriter(request.getParameter("writer"));
	qnaDTO.setContents(request.getParameter("contents"));
	
	QnaDAO qnaDAO=new QnaDAO();
	int result=qnaDAO.update(qnaDTO);
	
	String s="Fail";
	if(result>0){
		s="Success";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert('<%=s%>');
	location.href="./qnaList.jsp";
	</script>
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
</head>
<body>

</body>
</html>