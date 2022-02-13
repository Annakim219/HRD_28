<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 수정</title>
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
		form.action='update_order_p.jsp';
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
		String send_id = request.getParameter("id");
		String send_name = request.getParameter("name");
		
		String Pay= request.getParameter("pay");
		String Prodcount = request.getParameter("prodcount");
			
		try{
			String sql = "select id, name, to_char(orderdate,'yyyy-mm-dd'), addr, tel, pay, cardno, prodcount from order0212 where id=? and name=?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, send_id);
			pstmt.setString(2, send_name);
			rs = pstmt.executeQuery();
			if(rs.next()){
		    	String id = rs.getString(1);
			    String name = rs.getString(2);
			    String orderdate =rs.getString(3);
			    String addr = rs.getString(4);
			    String tel = rs.getString(5);
			    String pay = rs.getString(6);
				String cardno =rs.getString(7);
			    String prodcount = rs.getString(8);
			    
				if(Pay==null){
				}else{
					if(Pay.equals(pay)){
					}else{
						pay=Pay;
						cardno="";
					}
				}
				
				if(Prodcount==null){
			 	}else{
					if(Prodcount.equals(prodcount)){
					}else{
						prodcount=Prodcount;
					}
				}
				
			if(cardno==null){cardno="";}			    
			    			    
			int total = 0;
			int pcount = Integer.parseInt(prodcount);			
			    
			sql = "select price from product0212 where id =?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				int price = rs.getInt(1);
				total = pcount*price;
								
				System.out.println("데이터 조회 성공");
				%>

		<br>
		<h2>상품 추가</h2>
		<form name="form" method="post" action="update_order.jsp">
			<table>
				<tr>
					<th>상품 코드</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>"></td>
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
					<td><input id="in1" type="text" name="cardno" value="<%=cardno %>" <%if(pay.equals("1")){%>disabled<%}%>></td>
				</tr>
				
				<tr>
					<th>주문 상품 수</th>
					<td><input id="in1" type="text" name="prodcount" value="<%=pcount %>" onchange="changesubmit()"></td>
					<th>주문 금액</th>
					<td><input id="in1" type="text" name="total" value="<%=total %>"></td>
				</tr>
				
				<tr id="tr_btn">
				<td colspan=4 align=center>
				<input id="btn1" type="button" value="목록" onclick="location.href='select_order.jsp'">
				<input id="btn1" type="button" value="수정" onclick="check()">
				</td>
				</tr>
								
			</table>
		</form>
				<%
			}
					
			}

		}catch(SQLException e){
			System.out.println("데이터 조회 실패");
			e.printStackTrace();
		}
	%>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>