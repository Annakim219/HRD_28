<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="/DBconn.jsp" %>
    <%
    	String id = request.getParameter("id");
	    
	    try{
	    	String sql = "delete from product0212 where id=?";
	    	pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, id);
	    	pstmt.executeUpdate();
	    	System.out.println("삭제 성공");
	    	%>
	    		<script>
	    			alert('삭제가 완료되었습니다!');
	    			location.href='select_product.jsp';
	    		</script>
	    	<%
	    	
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