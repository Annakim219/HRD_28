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
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="/nav.jsp"%>
	<%@ include file="/DBconn.jsp"%>
	<section>
	<%
		String send_id = request.getParameter("id");
	
		try{
			String sql = "select id, category, wname, pname, sname, price, downprice, to_char(inputdate,'yyyy-mm-dd'), stock, description from product0212 where id=?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
		    	String id = rs.getString(1);
			    String category = rs.getString(2);
			    String wname =rs.getString(3);
			    String pname = rs.getString(4);
			    String sname = rs.getString(5);
			    String price = rs.getString(6);
			    String downprice = rs.getString(7);
			    String inputdate =rs.getString(8);
			    String stock = rs.getString(9);
			    String description = rs.getString(10);
			    System.out.println("데이터 조회 성공");
			    %>
		<br>
		<h2>상품 추가</h2>
		<form name="form" method="post" action="update_product_p.jsp">
			<table>
				<tr>
					<th>상품 코드</th>
					<td><input id="in1" type="text" name="id" value="<%=id %>"></td>
					<th>상품 분류</th>
					<td><select id="sel1" name="category">
							<option value="" <%if(category.equals("")){%>selected<%}%>>상품 분류</option>
							<option value="11" <%if(category.equals("11")){%>selected<%}%>>가구</option>
							<option value="22" <%if(category.equals("22")){%>selected<%}%>>전기/전지</option>
							<option value="33" <%if(category.equals("33")){%>selected<%}%>>부엌용품</option>
							<option value="44" <%if(category.equals("44")){%>selected<%}%>>의류</option>
							<option value="55" <%if(category.equals("55")){%>selected<%}%>>보석 및 액세서리</option>
							<option value="66" <%if(category.equals("66")){%>selected<%}%>>헬스기구</option>
							<option value="77" <%if(category.equals("77")){%>selected<%}%>>컴퓨터 관련</option>
							<option value="88" <%if(category.equals("88")){%>selected<%}%>>기타</option>
					</select></td>
				</tr>
				
				<tr>
					<th>작성자 이름</th>
					<td><input id="in1" type="text" name="wname" value="<%=wname %>"></td>
					<th>상품 이름</th>
					<td><input id="in1" type="text" name="pname" value="<%=pname %>"></td>
				</tr>
				
				<tr>
					<th>제조사 이름</th>
					<td colspan=3><input id="in2" type="text" name="sname" value="<%=sname %>"></td>
				</tr>
				
				<tr>
					<th>시중 가격</th>
					<td><input id="in1" type="text" name="price" value="<%=price %>"></td>
					<th>판매 가격</th>
					<td><input id="in1" type="text" name="downprice" value="<%=downprice %>"></td>
				</tr>
				
				<tr>
					<th>날짜</th>
					<td><input id="in1" type="text" name="inputdate" value="<%=inputdate %>"></td>
					<th>재고량</th>
					<td><input id="in1" type="text" name="stock" value="<%=stock %>"></td>
				</tr>
				
				<tr>
				<th>메모</th>
				<td colspan=3>
				<textarea style="overflow: scroll;" name="description" rows=10 cols=65><%=description %></textarea>
				</td>
				</tr>
				
				<tr id="tr_btn">
				<td colspan=4 align=center>
				<input id="btn1" type="button" value="목록" onclick="location.href='select_product.jsp'">
				<input id="btn1" type="submit" value="수정">
				</td>
				</tr>
								
			</table>
		</form>
			    <%
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