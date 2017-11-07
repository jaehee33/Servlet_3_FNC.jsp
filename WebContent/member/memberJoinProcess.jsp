<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
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
    int result=memberDAO.insert(memberDTO);
    String s="Join Fail";
    if(result>0){
    	s="Join Success";
    }
    request.setAttribute("message", s);
    request.setAttribute("path","../index_notice.jsp");
    RequestDispatcher view= request.getRequestDispatcher("../common/result.jsp");
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