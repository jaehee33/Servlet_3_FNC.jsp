<%@page import="com.iu.member.MemberDAO"%>
<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
        
    MemberDTO memberDTO = new MemberDTO();
    memberDTO.setId(request.getParameter("id"));
    memberDTO.setPassword(request.getParameter("password"));
    memberDTO.setJob(request.getParameter("job"));
    
String save = request.getParameter("save");
	
	if(save != null){
		Cookie c = new Cookie("id", memberDTO.getId());
		c.setMaxAge(60*10);
		response.addCookie(c);
	}else {
		Cookie c = new Cookie("id", "");
		c.setMaxAge(0);
		response.addCookie(c);
	}
   
    MemberDAO memberDAO= new MemberDAO();
    memberDTO = memberDAO.selectOne(memberDTO);
    
    
    
    String path="./memberLoginForm.jsp";
    if(memberDTO != null){
    	session.setAttribute("member", memberDTO);
    	path="../index_notice.jsp";
    	
    }
    response.sendRedirect(path);
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