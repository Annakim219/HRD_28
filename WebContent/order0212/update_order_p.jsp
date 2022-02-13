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
		int b_stock = 0; // 최초 재고 수
		int t_stock = 0; // 수정 후 재고 수
	    
	    try{		    	
	    	String sql = "select a.stock, b.prodcount from product0212 a, order0212 b where a.id=b.id and b.id=? and b.name=?";
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, id);
		    pstmt.setString(2, name);
		    rs = pstmt.executeQuery();
		    if(rs.next()){
		    	int stock = rs.getInt(1);
		    	int pcount = rs.getInt(2);
		    	b_stock = stock + pcount;
		    	t_stock = b_stock - Integer.parseInt(prodcount);
			    		
	    	sql = "update order0212 set orderdate=?, addr=?, tel=?, pay=?, cardno=?, prodcount=?, total=? where id=? and name=?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, orderdate);
	    	pstmt.setString(2, addr);
	    	pstmt.setString(3, tel);
	    	pstmt.setString(4, pay);
	    	pstmt.setString(5, cardno);
	    	pstmt.setString(6, prodcount);
	    	pstmt.setString(7, total);
	    	pstmt.setString(8, id);
	    	pstmt.setString(9, name);
	    	pstmt.executeUpdate();
    		
		    sql = "update product0212 set stock=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, t_stock);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			System.out.println("수정 성공");
	    	%>
	    		<script>
	    			alert('수정이 완료되었습니다!');
	    			location.href='/HRD_0212/order0212/select_order.jsp';
	    		</script>
	    	<%
		    }
	    }catch(SQLException e){
	    	System.out.println("수정 실패");
	    	%>
	    		<script>
	    			alert('수정 실패');
	    			history.back(-1);
	    		</script>
	    	<%
	    	e.printStackTrace();	    	
	    }
    %>