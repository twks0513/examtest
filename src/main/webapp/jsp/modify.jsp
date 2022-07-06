<%@page import="membertest.MembertestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<%
	MembertestDAO dao = new MembertestDAO();
	//int m = dao.modify(custname, phone, address, joindate, grade, city);
%>
	<div align="center">
		<h2 style="padding: 30px;">홈쇼핑 회원 정보 수정</h2>
		<form action="modifychk.jsp">
			<table border="1">
				<tr>
					<th>회원번호</th><th><input type="text" name="custno" value="<%=request.getParameterValues("id")%>"></th> <%-- 여기 처리해야함 --%>
				</tr>
				<tr>
					<th>회원성명</th><th><input type="text" name="custname"></th>
				</tr>
				<tr>
					<th>회원전화</th><th><input type="text" name="phone"></th>
				</tr>
				<tr>
					<th>회원주소</th><th><input type="text" name="address"></th>
				</tr>
				<tr>
					<th>가입일자</th><th><input type="text" name="joindate"></th>
				</tr>
				<tr>
					<th>고객등급[A:VIP,B:일반,C:직원]</th><th><input type="text" name="grade"></th>
				</tr>
				<tr>
					<th>도시코드</th><th><input type="text" name="city"></th>
				</tr>
				<tr>
					<th colspan="2"><button type="button" onclick="chkval()">수정</button><button type="button" onclick="location.href='showuser.jsp'">조회</button></th>		
				</tr>
			
			</table>
		
		</form>
	</div>

</section>
<%@include file="footer.jsp" %>
</body>
</html>