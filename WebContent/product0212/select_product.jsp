<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 목록</title>
<style>
th{
	height: 35px;
	background: lavender;
}
td{
 	height: 30px;
 	text-align: center;
}
p{
	margin-right: 5px;
	text-align: right;
}
.cnt{
	display: table;
	width: 1100px;
	height: 35px;
	margin: 0 auto;
}

</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<br>
		<h2>상품 목록</h2>
		<%
			int cnt = 0;
			try{
				String sql = "select count(*) from product0212";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()){
					cnt = rs.getInt(1);
				}
				
			}catch(SQLException e){
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<div class="cnt">
		<span>총 <b><%=cnt%>개</b>의 상품이 있습니다</span>
		</div>
		<table>
			<tr>
				<th width=80>상품 코드</th>
				<th width=80>상품 분류</th>
				<th width=100>작성자 이름</th>
				<th width=120>상품 이름</th>
				<th width=120>제조사 이름</th>
				<th width=100>시중 가격</th>
				<th width=100>판매 가격</th>
				<th width=120>날짜</th>
				<th width=80>재고량</th>
				<th width=120>메모</th>
				<th width=100>구분</th>
			</tr>
			<% 
				DecimalFormat df = new DecimalFormat("###,###");
				int no = 0;
				try{
					String sql = "select id, category, wname, pname, sname, price, downprice, to_char(inputdate,'yyyy-mm-dd'), stock, description from product0212 order by id";
					pstmt = conn.prepareStatement(sql);					
					rs = pstmt.executeQuery();
					while(rs.next()){
				    	String id = rs.getString(1);
					    String category = rs.getString(2);
					    String wname =rs.getString(3);
					    String pname = rs.getString(4);
					    String sname = rs.getString(5);
					    int price = rs.getInt(6);
					    int downprice = rs.getInt(7);
					    String inputdate =rs.getString(8);
					    String stock = rs.getString(9);
					    String description = rs.getString(10);
					    System.out.println("데이터 조회 성공");
					    %>
				<tr>
					<td><%=id %></td>
					<td><%=category %></td>
					<td><%=wname %></td>
					<td><%=pname %></td>
					<td><%=sname %></td>
					<td><p><%=df.format(price) %></p></td>
					<td><p><%=df.format(downprice) %></p></td>
					<td><%=inputdate %></td>
					<td><%=stock %></td>
					<td><%=description %></td>
					<td>
					<a href='/HRD_0212/product0212/update_product.jsp?id=<%=id %>'>수정</a>
					<span>/</span>
					<a href='/HRD_0212/product0212/delete_product.jsp?id=<%=id %>' onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a>
					</td>
				</tr>
					    <%						
				}
			
			}catch(SQLException e){
				System.out.println("데이터 조회 실패");
				e.printStackTrace();
			}
			%>		
		</table>
		<div class="btn_group" align=center>
			<input id="btn2" type="button" value="작성" onclick="location.href='add_product.jsp'">
		</div>		
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>