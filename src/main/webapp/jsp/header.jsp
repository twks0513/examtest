<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	header {font-size:20pt; background-color: blue; color: white; text-align: center; padding: 20px 0;}
	nav {background-color: gray; color: white; margin: auto;}
	nav li{ padding: 0 40px; display: inline;}
	nav ul {list-style: none; position: relative; margin: 0; padding: 0;}
	li a{text-decoration: none; color:white; }
	a:visited {color: white; }
</style>
</head>
<body>
	<header>쇼핑몰 회원관리 ver 1.0</header>
<div>
	<nav>
		<ul>
			<li><a href="register.jsp">회원등록</a></li>
			<li><a href="showuser.jsp">회원목록조회/수정</a></li>
			<li><a href="sell.jsp">회원매출조회</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
</div>

</body>
</html>