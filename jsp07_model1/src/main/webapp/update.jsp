<%@page import="test.vo.MembersVo"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>
</head>
<body>
<%
	int num=Integer.parseInt(request.getParameter("num"));
	MembersDao dao=new MembersDao();
	MembersVo vo=dao.select(num);
%>
<h1>회원정보수정</h1>
<form method="post" action="updateOk.jsp">
	<input type="hidden" value="<%=vo.getNum() %>" name="num">
	회원번호 <input type="text"  value="<%=vo.getNum()%>" disabled="disabled"><br>
	이름 <input type="text" name="name" value="<%=vo.getName()%>"><br>
	전화번호 <input type="text" name="phone" value="<%=vo.getPhone()%>"><br>
	주소 <input type="text" name="addr" value="<%=vo.getAddr()%>"><br>
	가입일 <input type="text" name="regdate" value="<%=vo.getRegdate()%>" disabled="disabled"><br>
	<input type="submit" value="저장">
</form>
</body>
</html>



