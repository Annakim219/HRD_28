<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보 등록</title>
<style>
tr{
	height: 30px;
}

th{
	width: 120px;
	background: lavender;
}

tr{
	width: 180px;
}

#in1{
	width: 95%;
	height: 22px;
	margin-left: 2px;
	
}

#in2{
	width: 80%;
	height: 22px;
	margin-left: 2px;
}

#sel1{
	width: 80%;
	height: 25px;
	margin-left: 2px;
}
</style>
<script>
	function check(){
		form.action='add_order_p.jsp';
		document.form.submit();
	}

	function changesubmit(){
		document.form.submit();
	}
	
	function card(){
		alert('카드번호를 입력하세요');
		document.form.cardno.focus();
	}
</script>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<% 
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orderdate = request.getParameter("orderdate");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String pay = request.getParameter("pay");
		String cardno = request.getParameter("cardno");
		String prodcount = request.getParameter("prodcount");
		int t_prodcount = 0;
		int price = 0;
		int total = 0;
		
		if(id==null){
			id="";
			name="";
			orderdate="";
			addr="";
			tel="";
			pay="1";
			cardno="";
			prodcount="";
			total=0;
			t_prodcount=0;
		}else{
			t_prodcount=Integer.parseInt(prodcount);
		}
		
		if(cardno==null){cardno="";}
		
		try{
			String sql = "select id, price from product0212 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				price = rs.getInt(2);
				total = t_prodcount * price;
			}else if(id !=""){
				%>
					<script>
						alert('등록되지 않은 코드입니다.');
					</script>
				<%
			}
			
		}catch(SQLException e){
			System.out.println("product 테이블 조회 실패");
			e.printStackTrace();
		}

		
		%>
		<br>
		<h2>주문 추가</h2>
		<form name="form" method="post" action="add_order.jsp">
			<table>
				<tr>
					<th>상품 코드</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>" onchange="changesubmit()"></td>
					<th>주문자 이름</th>
					<td><input id="in1" type="text" name="name" value="<%=name %>"></td>
				</tr>
				
				<tr>
					<th>주문 날짜</th>
					<td><input id="in1" type="text" name="orderdate" value="<%=orderdate %>"></td>
					<th>전화번호</th>
					<td><input id="in1" type="text" name="tel" value="<%=tel %>"></td>
				</tr>
				
				<tr>
					<th>배달 주소</th>
					<td colspan=3><input id="in2" type="text" name="addr" value="<%=addr %>"></td>
				</tr>
				
				<tr>
					<th>결제 방법</th>
					<td><input id="ra1" type="radio" name="pay" value="1" <%if(pay.equals("1")){%>checked<%}%> onchange="changesubmit()">현금
					<input id="ra1" type="radio" name="pay" value="2" <%if(pay.equals("2")){%>checked<%}%> onchange="changesubmit()" onclick="card()">카드</td>
					<th>카드 번호</th>
					<td><input id="in1" type="text" name="cardno" value="<%=cardno %>" <%if(pay.equals("1")){%>disabled<%}%> ></td>
				</tr>
				
				<tr>
					<th>주문 상품 수</th>
					<td><input id="in1" type="text" name="prodcount" value="<%=t_prodcount %>" onchange="changesubmit()"></td>
					<th>주문 금액</th>
					<td><input id="in1" type="text" name="total" value="<%=total %>"></td>
				</tr>
				
				<tr id="tr_btn">
				<td colspan=4 align=center>
				<input id="btn1" type="button" value="목록" onclick="location.href='select_order.jsp'">
				<input id="btn1" type="button" value="등록" onclick="check()">
				</td>
				</tr>
								
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>