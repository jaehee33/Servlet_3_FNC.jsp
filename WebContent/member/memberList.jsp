<%@page import="com.iu.member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	String kind=request.getParameter("kind");
	String search=request.getParameter("search");
	if(kind==null){
		kind="id";
	}if(search==null){
		search="";
	}
	
	int curPage=1;
	try{
	curPage=Integer.parseInt(request.getParameter("curPage"));
	}catch (Exception e){
	}
	
	int perPage = 10;
	int startRow = (curPage - 1) * perPage + 1;
	int lastRow = curPage * perPage;

	MemberDAO memberDAO = new MemberDAO();
	ArrayList<MemberDTO> ar = memberDAO.selectList(startRow, lastRow, kind, search);
	
	//pageing - totalCount
	int totalCount = memberDAO.getTotalCount();
	//totalPage
	int totalPage = 0;
	if(totalCount % perPage == 0){
		totalPage = totalCount / perPage;
	}else{
		totalPage = totalCount / perPage+1;
	}
	//totalBlock
	int perBlock=5;
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else{
		totalBlock=totalPage/perBlock+1;
	}
	//curPage를 이용해서 curBlock 구하기
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock=curPage/perBlock;
	}else{
		curBlock=curPage/perBlock+1;
	}
	//curPage로 startNum, lastNum 구하기
	int startNum=(curBlock-1)*perBlock+1;
	int lastNum=curBlock*perBlock;
	if(curBlock==totalBlock){
		lastNum=totalPage;
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
*{
margin: 0;
padding: 0;
}
h1{
width: 30%;
margin: 0 auto;
text-align: center;
}
#list{
width: 75%;
margin: 0 auto;
margin-top: 20px;
}
.btn{
float: right;

}
</style>
</head>
<body>
<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>Member List</h1>
		<article id="list">

			<a class="btn btn-danger" href="./memberWriteForm.jsp">Writer</a>
			<table class="table table-striped">
				<tr>
					<td>ID</td>
					<td>NAME</td>
					<td>EMAIL</td>
					<td>PHONE</td>
					<td>AGE</td>
				</tr>
				<%for (MemberDTO memberDTO : ar) {%>
				<tr>
					<td><%=memberDTO.getId()%></td>
					<td><a href="memberList.jsp?id=<%=memberDTO.getId()%>"><%=memberDTO.getName()%></a></td>
					<td><%=memberDTO.getEmail()%></td>
					<td><%=memberDTO.getPhone()%></td>
					<td><%=memberDTO.getAge()%></td>
				</tr>
				<%}%>
			</table>
			<!-- pageing -->
			<div class="container">
				<ul class="pagination">
				<% if(curBlock>1) {%>
					<li><a href="memberList.jsp?curPage=<%=startNum-1%>&kind=<%=kind%>&search=<%=search%>">⊂</a></li>
					<%} %>
					<% for(int i=startNum; i<=lastNum; i++){ %>
					<li><a href="memberList.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i %></a></li>
					<%} %>
					<% if(curBlock < totalBlock){ %>
					<li><a href="memberList.jsp?curPage=<%=lastNum+1%>&kind=<%=kind%>&search=<%=search%>">⊃</a></li>
					<%} %>
				</ul>
			</div>

		</article>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>