<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<%@ include file="layout/db_connect.jsp" %>
<%
	try{
		request.setCharacterEncoding("UTF-8");
		
		String sql = "update member_tbl_02 "
				   + "    set custname=?, phone=?, address=?, joindate=?, grade=?, city=?"
				   + " where custno=" + request.getParameter("custno");
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		//pstmt.setInt(1, Integer.parseInt(request.getParameter("custno"))); // 회원번호
		pstmt.setString(1, request.getParameter("custname")); // 회원성명
		pstmt.setString(2, request.getParameter("phone")); // 회원전화
		pstmt.setString(3, request.getParameter("address")); // 회원주소
		pstmt.setString(4, request.getParameter("joindate")); // 가입일자
		pstmt.setString(5, request.getParameter("grade")); // 등급
		pstmt.setString(6, request.getParameter("city")); // 도시코드
		
		pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	
</head>
<body>
	<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>