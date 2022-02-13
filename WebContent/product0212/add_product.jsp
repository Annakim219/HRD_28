<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 정보 등록</title>
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
	<section>
		<br>
		<h2>상품 추가</h2>
		<form name="form" method="post" action="add_product_p.jsp">
			<table>
				<tr>
					<th>상품 코드</th>
					<td><input id="in1" type="text" name="id"></td>
					<th>상품 분류</th>
					<td><select id="sel1" name="category">
							<option value="" selected>상품 분류</option>
							<option value="11">가구</option>
							<option value="22">전기/전지</option>
							<option value="33">부엌용품</option>
							<option value="44">의류</option>
							<option value="55">보석 및 액세서리</option>
							<option value="66">헬스기구</option>
							<option value="77">컴퓨터 관련</option>
							<option value="88">기타</option>
					</select></td>
				</tr>
				
				<tr>
					<th>작성자 이름</th>
					<td><input id="in1" type="text" name="wname"></td>
					<th>상품 이름</th>
					<td><input id="in1" type="text" name="pname"></td>
				</tr>
				
				<tr>
					<th>제조사 이름</th>
					<td colspan=3><input id="in2" type="text" name="sname"></td>
				</tr>
				
				<tr>
					<th>시중 가격</th>
					<td><input id="in1" type="text" name="price"></td>
					<th>판매 가격</th>
					<td><input id="in1" type="text" name="downprice"></td>
				</tr>
				
				<tr>
					<th>날짜</th>
					<td><input id="in1" type="text" name="inputdate"></td>
					<th>재고량</th>
					<td><input id="in1" type="text" name="stock"></td>
				</tr>
				
				<tr>
				<th>메모</th>
				<td colspan=3>
				<textarea style="overflow: scroll;" name="description" rows=10 cols=65 ></textarea>
				</td>
				</tr>
				
				<tr id="tr_btn">
				<td colspan=4 align=center>
				<input id="btn1" type="button" value="목록" onclick="location.href='select_product.jsp'">
				<input id="btn1" type="submit" value="등록">
				</td>
				</tr>
								
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp"%>
</body>
</html>