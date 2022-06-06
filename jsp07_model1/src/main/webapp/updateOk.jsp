<%@page import="test.vo.MembersVo"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
/*	int num=Integer.parseInt(request.getParameter("num"));
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String addr=request.getParameter("addr");
	MembersVo vo=new MembersVo(num,name,phone,addr,null);
*/
%>
<jsp:useBean id="vo" class="test.vo.MembersVo"/>
<jsp:setProperty property="num" name="vo" />
<jsp:setProperty property="name" name="vo" />
<jsp:setProperty property="phone" name="vo" />
<jsp:setProperty property="addr" name="vo" />
<%	//DB에 저장하기
	MembersDao dao=new MembersDao();
	
	int n=dao.update(vo);
	if(n>0){
		out.print("<h1>회원정보수정완료!</h1>");
	}else{
		out.print("<h1>회원정보수정실패!</h1>");
	}
%>
</body>
</html>











