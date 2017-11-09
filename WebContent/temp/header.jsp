<%@page import="com.iu.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  Header 시작 -->
	<header>
		<div id="hdtop">
			<div id="logo">
				<a href="/Servlet_3_FNC.jsp/index_notice.jsp"> 
				<img src="<%= request.getContextPath() %>/img/common/logo.png"></a>
				
			</div>
			<nav>
				<ul>
					<li><a href="<%= request.getContextPath() %>/notice/noticeList.jsp">NOTICE</a></li>
					<li><a href="<%= request.getContextPath() %>/qna/qnaList.jsp">Q&A</a></li>
					<li><a href="#">PR Center</a></li>
					<li><a href="#">Audition</a></li>
				</ul>
			</nav>
			<div class="hdsub">
			<ul>
				<%MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");%>
				<%if (memberDTO != null) {%>
				<li><a href="<%=request.getContextPath()%>/member/memberLogout.jsp">Logout</a></li>
				<li><a href="<%=request.getContextPath()%>/member/memberMyPage.jsp">MyPage</a></li>
				<%} else {%>
				<li><a href="<%=request.getContextPath()%>/member/memberLoginForm.jsp">Login</a></li>
				<li><a href="<%=request.getContextPath()%>/member/memberJoinForm.jsp">Join</a></li>
				<%} %>
				<li><a href="#">KO</a></li>
				<li><a href="#">EN</a></li>
				<li><a href="#">JP</a></li>
				<li><a href="#">CN</a></li>
			</ul>
		</div>
		</div>
	</header>
	<!--  Header 끝 -->