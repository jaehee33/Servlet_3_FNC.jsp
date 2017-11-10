
<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
           <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	QnaDTO qnaDTO=new QnaDTO();
	qnaDTO.setNum(Integer.parseInt(request.getParameter("num")));
	qnaDTO.setWriter(request.getParameter("writer"));
	qnaDTO.setTitle(request.getParameter("title"));
	qnaDTO.setContents(request.getParameter("contents"));
	
	QnaDAO qnaDAO=new QnaDAO();
	QnaDTO parent= qnaDAO.selectOne(qnaDTO.getNum());
	
	int result=qnaDAO.relpy(qnaDTO, parent);
	
	String s="Fail";
	if(result>0){
		s="Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "qnaList.jsp");
	RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response);

    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>