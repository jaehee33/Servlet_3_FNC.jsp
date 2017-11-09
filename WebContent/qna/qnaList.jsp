<%@page import="com.iu.qna.QnaDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.iu.qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	//1. 데이터정리
	int curPage=1;
	try{
	curPage = Integer.parseInt(request.getParameter("curPage"));
	}catch(Exception e){
	}
	int perPage=10;
	int perBlock=5;
	
	//2. db조회
	int startRow= (curPage-1) * perPage+1;
	int lastRow= perPage * curPage;
	//3. 전체 글의 갯수
	QnaDAO qnaDAO = new QnaDAO();
	int totalCount=qnaDAO.getTotalCount(kind, search);
	// 4. 전체페이지수 구하기
	int totalPage=0;
	if(totalCount%perPage==0){
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
	int lastNum=perBlock * curBlock;
	
	if(totalBlock==curBlock){
		lastNum=totalPage;
	}

    ArrayList<QnaDTO> ar = new ArrayList<>();
    
    
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
	text-align: center;
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
<td><a href="./qnaView.jsp?num=<%=qnaDTO.getNum()%>"><%=qnaDTO.getTitle()%></a></td>
<td><%=qnaDTO.getContents()%></td>
<td><%=qnaDTO.getWriter()%></td>
<td><%=qnaDTO.getHit()%></td>
<td><%=qnaDTO.getReg_date()%></td>
</tr>
<%} %>
</table>
<%if(memberDTO !=null && memberDTO.getId().equals(memberDTO.getId())) {%>
<a class="btn btn-danger" href="./qnaWriteForm.jsp">글쓰기</a>
<%} %>

<!-- pageing -->

</article>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>