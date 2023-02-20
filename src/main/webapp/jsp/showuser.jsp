<%@page import="membertest.MembertestDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="membertest.MembertestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../CSS/section.css" rel="stylesheet">
</head>
<body>
<%@include file="header.jsp" %>	
<% request.setCharacterEncoding("utf-8");
MembertestDAO dao = new MembertestDAO();
ArrayList<MembertestDTO> list = dao.getMembers();
%>
<section>

	<H2 align="center">회원목록조회/수정</H2>
	<form action="modifychk.jsp" method="post">
	<div align="center">
		<table border="1">
			<tr>
				<th>회원번호</th><th>회원성명</th><th>전화번호</th><th>주소</th><th>가입일자</th><th>고객등급</th><th>거주지역</th>
			</tr>
			<% String grade ="";
			for(MembertestDTO dto :list){
				if(dto.getGrade().equals("A")){
					grade ="VIP";
				}else if(dto.getGrade().equals("B")){
					grade = "일반";
				}else if(dto.getGrade().equals("C")){
					grade = "직원";
				}else if(dto.getGrade()==null){
					response.sendRedirect("index.jsp");
				} %>
			<tr>
				<th><a id="num" href="modify.jsp?num=<%=dto.getCustno()%>"><%=dto.getCustno() %></a></th><th id="custname"><%=dto.getCustname() %></th><th id="phone"><%=dto.getPhone() %></th><th id="address"><%=dto.getAddress() %></th><th id="joindate"><%=dto.getJoindate().toString().replace('-', '.') %></th><th id="grade"><%=grade %></th><th id="city"><%=dto.getCity() %></th>
				</tr>
			<%} %>
		</table>	
		</div>
	</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>