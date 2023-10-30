<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="layout/db_connect.jsp" %>
<%
	String sql="SELECT a.custno 회원번호, "
			+ " a.custname 회원성명, " 
			+ " decode(a.grade, 'A', 'VIP', 'B', '일반', 'C', '직원') 고객등급, "
			+ " sum(nvl(price, 0)) 매출 "
  + " FROM member_tbl_02 a, money_tbl_02 b "
+ " WHERE a.custno = b.custno and price is not null " 
+ " GROUP BY a.custno, a.custname, a.grade "
+ " order by 매출 desc";


	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>header</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.2.0">
	<script type="text/javascript">
		function checkDel(custno){
			msg = "삭제를 하시겠습니까?";
			if(confirm(msg) != 0){
				location.href="delete.jsp?custno="+custno;
				alert("삭제되었습니다.");	
			}else{
				alert("취소되었습니다.");
				return;
			}
		
		}
	</script>
</head>
<body>
	<header>
		<jsp:include page="layout/header.jsp"></jsp:include>
	</header>
	<nav>
		<jsp:include page="layout/nav.jsp"></jsp:include>
	</nav>
	
	<main id="section">
		<h3 class="title">회원목록 조회/수정</h3>
		<div class="scroll">
			<table class="table_line">
				<tr align="center">
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
				<%
					while(rs.next()){
				%>
					<tr align="center">
						<td><%= rs.getString("회원번호") %></td>
						<td><%= rs.getString("회원성명") %></td>
						<td><%= rs.getString("고객등급") %></td>
						<td><%= rs.getString("매출") %></td>
					</tr>
				<%
					}
				%>
			</table>
		</div>
	</main>
	<footer>
		<jsp:include page="layout/footer.jsp"></jsp:include>
	</footer>
</body>
</html>
