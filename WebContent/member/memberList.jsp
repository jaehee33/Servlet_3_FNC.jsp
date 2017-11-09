
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	
	
	int curPage=1;
	int perPage=10;
	int perBlock=5;
	
	try{
		curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){}
	MemberDAO memberDAO = new MemberDAO();
	int startRow = (curPage-1)*perPage+1;
	int lastRow=curPage*perPage;
	
	ArrayList<MemberDTO> ar=memberDAO.selectList(startRow, lastRow);
	
	//pageing 처리
	//1. TotalCount
	int totalCount = memberDAO.getTotalCount();
	
	//2. TotalPage
	int totalPage=0;
	if(totalCount%perPage==0){
		totalPage = totalCount/perPage;
	}else {
		totalPage = totalCount/perPage+1;
	}
	//3. TotalBlock
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock = totalPage/perBlock;
	}else {
		totalBlock = totalPage/perBlock+1;
	}
	//4. curPage로 curBlock 
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock= curPage/perBlock;
	}else {
		curBlock= curPage/perBlock+1;
	}
	
	//5. curBlock로 startNum, lastNum
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum = curBlock*perBlock;
	
	if(curBlock==totalBlock){
		lastNum = totalPage;
	}
	
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
				<%for (MemberDTO memberDTO2 : ar) {%>
				<tr>
					<td><%=memberDTO2.getId()%></td>
					<td><a href="memberMyPage.jsp?id=<%=memberDTO2.getId()%>"><%=memberDTO2.getName()%></a></td>
					<td><%=memberDTO2.getEmail()%></td>
					<td><%=memberDTO2.getPhone()%></td>
					<td><%=memberDTO2.getAge()%></td>
				</tr>
				<%}%>
				</tbody>
			</table>
			
			<!-- pageing -->
			<div class="container">
				<ul class="pagination">
				<% if(curBlock>1) {%>
					<li><a href="memberList.jsp?curPage=<%=startNum-1%>">⊂</a></li>
					<%} %>
					<% for(int i=startNum; i<=lastNum; i++){ %>
					<li><a href="memberList.jsp?curPage=<%=i%>"><%=i %></a></li>
					<%} %>
					<% if(curBlock < totalBlock){ %>
					<li><a href="memberList.jsp?curPage=<%=lastNum+1%>">⊃</a></li>
					<%} %>
				</ul>
			</div>
		
		</article>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>