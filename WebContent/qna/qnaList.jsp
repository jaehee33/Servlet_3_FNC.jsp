<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String kind = request.getParameter("kind");
	String search= request.getParameter("search");
	if(kind==null){
		kind="title";
	}if(search==null){
		search="";
	}
	//1. 데이터정리
	int curPage=1;
	try{
	curPage = Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
	}
	int perPage=10;
	int perBlock=5;
	
	//2. db조회
	int startRow = (curPage-1) * perPage+1;
	int lastRow = perPage * curPage;
	//3. 전체 글의 갯수
	QnaDAO qnaDAO = new QnaDAO();
    ArrayList<QnaDTO> ar = qnaDAO.selectList(startRow, lastRow, kind, search);
	int totalCount = qnaDAO.getTotalCount(kind, search);

	// 4. 전체페이지수 구하기
	int totalPage=0;
	if(totalCount % perPage == 0){
		totalPage=totalCount/perPage;
	}else{
		totalPage=totalCount/perPage+1;
	}
	// 5. 전체 블럭 수 구하기
	int totalBlock=0;
	if(totalPage%perBlock==0){
		totalBlock=totalPage/perBlock;
	}else{
		totalBlock=totalPage/perBlock+1;
	}
	// 6. 현재 블럭 구하기
	int curBlock=0;
	if(curPage%perBlock==0){
		curBlock=curPage/perBlock;
	}else{
		curBlock=curPage/perBlock+1;
	}
	// 7. startNum, lastNum 구하기
	int startNum=(curBlock-1) * perBlock+1;
	int lastNum=curBlock * perBlock;
	
	if(curBlock==totalBlock){
		lastNum=totalPage;
	}
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
h1 {
	width: 30%;
	margin: 0 auto;
	text-align: center;
}

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
<%@ include file="../temp/header.jsp" %>
<section id="main">
<h1>Q&A List</h1>
<article id="list">
<table class="table table-hover">
<tr>
<td>번호</td>
<td>제목</td>
<td>글내용</td>
<td>작성자</td>
<td>조회수</td>
<td>날짜</td>
</tr>

<% for(QnaDTO qnaDTO : ar) {%>
<tr>
<td><%=qnaDTO.getNum()%></td>
<%if(memberDTO !=null) {%>
<td><a href="./qnaView.jsp?num=<%=qnaDTO.getNum()%>"><%for(int j=0; j<qnaDTO.getDepth();j++){%>--<%} %><%=qnaDTO.getTitle()%></a></td>
<%}else{ %>
<td><%for(int j=0; j<qnaDTO.getDepth();j++){%>--<%} %><%=qnaDTO.getTitle() %></td>
<%} %>
<td><%=qnaDTO.getContents()%></td>
<td><%=qnaDTO.getWriter()%></td>
<td><%=qnaDTO.getHit()%></td>
<td><%=qnaDTO.getReg_date()%></td>
</tr>
<%} %>
</table>
<%if(memberDTO !=null) {%>
<a class="btn btn-danger" href="./qnaWriteForm.jsp">글쓰기</a>
<%} %>

<!-- pageing -->
<div class="container">
<ul class="pagination">
<%if(curBlock>1) {%>
<li><a href="qnaList.jsp?num=<%=startNum-1%>&kind=<%=kind%>&search=<%=search %>">[이전]</a></li>
<%} %>
<% for(int i=startNum; i<=lastNum; i++) {%>
<li><a href="qnaList.jsp?curPage=<%=i %>&kind=<%=kind%>&search=<%=search %>"><%=i %></a></li>
<%} %>
<li><a href="qnaList.jsp?curPage=<%=lastNum+1 %>&kind=<%=kind %>&search<%=search %>">[다음]</a></li>
</ul>
</div>

<!-- 제목, 작성자, 내용 서치 -->
<form action="qnaList.jsp">
<input type="hidden" value="curPage">
<select name="kind">
<option value="title">제목</option>
<option value="contents">내용</option>
<option value="writer">작성자</option>
</select>
<input type="text" name="search">
<input type="submit" value="search">
</form>
</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>