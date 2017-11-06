<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
</style>
<link href="./css/main.css" rel="stylesheet">
</head>
<body>
<%@ include file="./temp/header.jsp" %>

	<!--  main 시작 -->
	<section id="main">
		<div id="maincontents">
			<article id="mimg">
				<img src="./img/main/sf9.jpg">
			</article>
			<section id="mainboard">
				<article class="mainpost">
					<img src="./img/main/mpost1.PNG">
				</article>
				<article class="mainpost">
					<img src="./img/main/mpost2.PNG">
				</article>
				<article class="mainpost">
					<div>
						<img src="./img/main/mpost3.PNG">
					</div>
					<div>
						<img src="./img/main/mpost4.PNG">
					</div>
				</article>
			</section>
		</div>
	</section>
	<!--  main 끝 -->
	
<%@ include file="./temp/footer.jsp" %>
</body>
</html>