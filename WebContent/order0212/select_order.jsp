<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문 정보 목록</title>
<style>
th{
	height: 35px;
	background: lavender;
}
td{
	height: 30px;
	text-align: center;
}
.cnt{
	display: table;
	width : 1250px;
	margin : 5px auto;
}
#p1{
 margin-right: 5px;
 text-align: right;
}
#p2{
 margin-left: 5px;
 text-align: left;
}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
		<h2>주문 목록</h2>
		<%
			int count = 0;
			try {
				String sql = "select count(*) from order0212";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					count = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("count 조회 실패");
				e.printStackTrace();
			}
		%>
		<div class="cnt">
			<p>
				총 <b><%=count%>개</b>의 주문이 있습니다.
			</p>
		</div>
		<table>
			<tr>
				<th width=80>상품코드</th>
				<th width=120>주문자 이름</th>
				<th width=120>주문날짜</th>
				<th width=200>배달주소</th>
				<th width=120>전화번호</th>
				<th width=80>결제방법</th>
				<th width=120>카드번호</th>
				<th width=100>주문상품수</th>
				<th width=100>판매가격</th>
				<th width=100>총금액</th>
				<th width=100>구분</th>
			</tr>
		<%
			DecimalFormat df = new DecimalFormat("###,###");
			try {
				String sql = "select a.id, a.name, to_char(a.orderdate,'yyyy-mm-dd'), a.addr, a.tel, a.pay, a.cardno, a.prodcount, b.price, a.total from order0212 a, product0212 b where a.id=b.id order by a.id";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					String id = rs.getString(1);
					String name = rs.getString(2);
					String orderdate = rs.getString(3);
					String addr = rs.getString(4);
					String tel = rs.getString(5);
					String pay = rs.getString(6);
					String cardno = rs.getString(7);
					String prodcount = rs.getString(8);
					int price = rs.getInt(9);
					int total = rs.getInt(10);
					
			if(cardno==null){cardno="";}

					%>
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=orderdate %></td>
				<td><p id="p2"><%=addr %></p></td>
				<td><%=tel %></td>		
				<td><%=pay %></td>
				<td><%=cardno %></td>
				<td><%=prodcount %></td>
				<td><p id="p1"><%=df.format(price) %></p></td>
				<td><p id="p1"><%=df.format(total) %></p></td>
				<td><a href="/HRD_0212/order0212/update_order.jsp?id=<%=id %>&name=<%=name%>">수정</a>
				<span>/</span>
				<a href="/HRD_0212/order0212/delete_order.jsp?id=<%=id %>&name=<%=name%>" onclick="if(!confirm('정말로 삭제하시겠습니까?')){return false}">삭제</a></td>
			</tr>			
					<%
				}
			} catch (SQLException e) {
				System.out.println("데이터 조회 실패");
				e.printStackTrace();
			}				
		%>
		</table>
		<div class="btn_group" align=center>
			<input id="btn2" type="button" value="작 성" onclick="location.href='add_order.jsp'">
		</div>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>