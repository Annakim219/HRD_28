<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp" %>
    <%
    	String id = request.getParameter("id");
	    String category = request.getParameter("category");
	    String wname = request.getParameter("wname");
	    String pname = request.getParameter("pname");
	    String sname = request.getParameter("sname");
	    String price = request.getParameter("price");
	    String downprice = request.getParameter("downprice");
	    String inputdate = request.getParameter("inputdate");
	    String stock = request.getParameter("stock");
	    String description = request.getParameter("description");
	    
	    try{
	    	String sql = "update product0212 set category=?, wname=?, pname=?, sname=?, price=?, downprice=?, inputdate=?, stock=?, description=? where id=?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, category);
	    	pstmt.setString(2, wname);
	    	pstmt.setString(3, pname);
	    	pstmt.setString(4, sname);
	    	pstmt.setString(5, price);
	    	pstmt.setString(6, downprice);
	    	pstmt.setString(7, inputdate);
	    	pstmt.setString(8, stock);
	    	pstmt.setString(9, description);
	    	pstmt.setString(10, id);
	    	pstmt.executeUpdate();
	    	System.out.println("수정 성공");
	    	%>
	    		<script>
	    			alert('수정이 완료되었습니다!');
	    			location.href='select_product.jsp';
	    		</script>
	    	<%
	    	
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