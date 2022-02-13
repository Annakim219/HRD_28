<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp" %>
    <%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orderdate = request.getParameter("orderdate");
		String addr = request.getParameter("addr");
		String tel = request.getParameter("tel");
		String pay = request.getParameter("pay");
		String cardno = request.getParameter("cardno");
		String prodcount = request.getParameter("prodcount");
		String total = request.getParameter("total");
		int t_stock = 0;
	    
	    try{
	    	String	sql = "insert into order0212 values(?,?,?,?,?,?,?,?,?)";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, name);
	    	pstmt.setString(3, orderdate);
	    	pstmt.setString(4, addr);
	    	pstmt.setString(5, tel);
	    	pstmt.setString(6, pay);
	    	pstmt.setString(7, cardno);
	    	pstmt.setString(8, prodcount);
	    	pstmt.setString(9, total);
	    	pstmt.executeUpdate();
	    		    	
	    	 sql = "select stock from product0212 where id=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    rs = pstmt.executeQuery();
		    if(rs.next()){
		    	int stock = rs.getInt(1);
		    	t_stock = stock-Integer.parseInt(prodcount);
		    		
		    sql = "update product0212 set stock=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_stock);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			    		
			System.out.println("등록 성공");
	    	%>
	    		<script>
	    			alert('등록이 완료되었습니다!');
	    			location.href='/HRD_0212/order0212/select_order.jsp';
	    		</script>
	    	<%
		    }
	    }catch(SQLException e){
	    	System.out.println("등록 실패");
	    	%>
	    		<script>
	    			alert('등록 실패');
	    			history.back(-1);
	    		</script>
	    	<%
	    	e.printStackTrace();	    	
	    }
    %>