<%@page import="membertest.MembertestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../CSS/section.css" rel="stylesheet">
</head>
<body>
<%@ include file="header.jsp" %>
<section>
	<jsp:useBean id="dao" class="membertest.MembertestDAO"></jsp:useBean>
	<c:set var="dto" value="${dao.getUser(param.num)}"/>
	<c:set var="m" value="${dao.modify(dto.custname,dto.phone,dto.address,dto.joindate,dto.grade,dto.city,dto.custno) }"/>

	<div align="center">
		<h2>홈쇼핑 회원 정보 수정</h2>
		<form action="modifychk.jsp">
			<table border="1">
				<tr>
					<th>회원번호</th><th><input type="text" name="custno" value="${dto.custno }"></th>
				</tr>
				<tr>
					<th>회원성명</th><th><input type="text" name="custname" value="${dto.custname }"></th>
				</tr>
				<tr>
					<th>회원전화</th><th><input type="text" name="phone" value="${dto.phone }"></th>
				</tr>
				<tr>
					<th>회원주소</th><th><input type="text" name="address" value="${dto.address }"></th>
				</tr>
				<tr>
					<th>가입일자</th><th><input type="text" name="joindate" value="${dto.joindate }"></th>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th><th><input type="text" name="grade" value="${dto.grade }"></th>
				</tr>
				<tr>
					<th>도시코드</th><th><input type="text" name="city" value="${dto.city }"></th>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="수정"><button type="button" onclick="location.href='showuser.jsp'">조회</button></th>		
				</tr>
			
			</table>
		
		</form>
	</div>

</section>
<%@include file="footer.jsp" %>
</body>
</html>