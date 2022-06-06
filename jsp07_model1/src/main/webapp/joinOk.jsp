<%@page import="test.vo.MembersVo"%>
<%@page import="test.dao.MembersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 	request.setCharacterEncoding("utf-8"); %>
<%-- MembersVo vo=new MembersVo();  --%>
<jsp:useBean id="vo" class="test.vo.MembersVo" scope="page"/><%--vo객체 생성하기(디폴트생성자 호출) --%>
<%--
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String addr=request.getParameter("addr");
	vo.setNum(num);
	vo.setName(name);
	..
	위의 문장과 동일함
 --%>
<jsp:setProperty property="*" name="vo"/><%-- vo객체에 전달된 파라미터 넣기(setter메소드 호출) --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
사용자가 입력한 정보를 DB에 저장하고 회원가입성공 출력하기 2:20
 -->
 <%
 /*	request.setCharacterEncoding("utf-8");
	String num=request.getParameter("num");
	String name=request.getParameter("name");
	String phone=request.getParameter("phone");
	String addr=request.getParameter("addr");
	MembersVo vo=new MembersVo(Integer.parseInt(num),name,phone,addr,null);*/
	
	//DB에 저장하기
	MembersDao dao=new MembersDao();
	int n=dao.insert(vo);
	//결과 응답하기
	if(n>0){
		out.print("<h1>회원가입완료!</h1>");
	}else{
		out.print("<h1>회원가입실패!</h1>");
	}
%>
<a href="main.jsp">main</a>
</body>
</html>