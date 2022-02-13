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
	    	String sql = "insert into product0212 values(?,?,?,?,?,?,?,?,?,?)";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	pstmt.setString(2, category);
	    	pstmt.setString(3, wname);
	    	pstmt.setString(4, pname);
	    	pstmt.setString(5, sname);
	    	pstmt.setString(6, price);
	    	pstmt.setString(7, downprice);
	    	pstmt.setString(8, inputdate);
	    	pstmt.setString(9, stock);
	    	pstmt.setString(10, description);
	    	pstmt.executeUpdate();
	    	System.out.println("등록 성공");
	    	%>
	    		<script>
	    			alert('등록이 완료되었습니다!');
	    			location.href='select_product.jsp';
	    		</script>
	    	<%
	    	
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