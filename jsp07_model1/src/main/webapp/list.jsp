<%@page import="test.vo.MembersVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list.jsp</title>
</head>
<body>
<h1>회원전체 목록</h1>
<table border="1" width="500">
<tr>
	<th>번호</th><th>이름</th><th>가입일</th><th>삭제</th><th>수정</th>
</tr>
<%
	MembersDao dao=new MembersDao();
	ArrayList<MembersVo> list=dao.selectAll();
	for(MembersVo vo:list){
%>
	<tr>
		<td><%=vo.getNum() %></td>
		<td><%=vo.getName() %></td>
		<td><%=vo.getRegdate() %></td>
		<!-- delete.jsp에서 회원삭제하고 목록페이지(list.jsp)로 리다이렉트 하기 -->
		<td><a href="delete.jsp?num=<%=vo.getNum()%>">삭제</a></td>
		<!-- 수정페이지로 이동(회원정보가 폼에 보여짐-수정폼) -->
		<td><a href="update.jsp?num=<%=vo.getNum()%>">수정</a></td>
	</tr>
<%		
	}
%>
</table>
<a href="main.jsp">메인페이지</a>
</body>
</html>









