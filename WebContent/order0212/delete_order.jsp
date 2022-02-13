<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp" %>
    <%
	String id = request.getParameter("id");
	String name = request.getParameter("name");

	int b_stock = 0; // 최초 재고 수
    
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
		    	
		    sql = "update product0212 set stock=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b_stock);
			pstmt.setString(2, id);
			pstmt.executeUpdate();	
			    		
	    	sql = "delete from order0212 where id=? and name=?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, name);
	    	pstmt.executeUpdate();
	    	
			System.out.println("삭제 성공");
	    	%>
	    		<script>
	    			alert('삭제가 완료되었습니다!');
	    			location.href='/HRD_0212/order0212/select_order.jsp';
	    		</script>
	    	<%
		    }
	    }catch(SQLException e){
	    	System.out.println("삭제 실패");
	    	%>
	    		<script>
	    			alert('삭제 실패');
	    			history.back(-1);
	    		</script>
	    	<%
	    	e.printStackTrace();	    	
	    }
    %>