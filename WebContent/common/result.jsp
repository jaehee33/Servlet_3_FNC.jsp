<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String s=(String)request.getAttribute("message");
    
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
alert('<%=s%>');
location.href="../index_notice.jsp";
</script>

</head>
<body>

</body>
</html>