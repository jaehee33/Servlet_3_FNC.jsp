<%@page import="com.iu.notice.NoticeDAO"%>
<%@page import="com.iu.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	NoticeDTO noticeDTO=new NoticeDTO();
	noticeDTO.setWriter(request.getParameter("writer"));
	noticeDTO.setTitle(request.getParameter("title"));
	noticeDTO.setContents(request.getParameter("contents"));
	NoticeDAO noticeDAO=new NoticeDAO();
	int result=noticeDAO.insert(noticeDTO);
	String s="Fail";
	if(result>0){
		s="Success";
	}
	request.setAttribute("message", s);
	request.setAttribute("path", "../index_notice.jsp");
	// 1. forward 방식
	/* RequestDispatcher view = request.getRequestDispatcher("../common/result.jsp");
	view.forward(request, response); */
	
	//2. redirect 방식
	response.sendRedirect("../common/result.jsp");
	
	
	
	
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