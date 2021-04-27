<%@page import="db.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
	
	<%
	
	MemberDAO mdao = new MemberDAO();
	ArrayList<MemberBean> arrs = mdao.allSelectMember();
	
	%>
		<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
  		<h5 style="text-align: center;">회원관리</h5><br>
             
  		<table class="table">
    		<thead>
      			<tr>
        			<th>ID</th>
        			<th>Email</th>
        			<th>Phone</th>
      			</tr>
    		</thead>
    		<tbody>
    		<%
    		
    		for(int i = 0; i < arrs.size(); i++){
    			MemberBean bean = arrs.get(i);
    			
    		%>
    			<tr>
        			<td><%=bean.getId() %></td>
        			<td><%= bean.getEmail() %></td>
        			<td><%=bean.getTel() %></td>
      			</tr>
    		<%
    		}
    		
    		%>
      			
    		</tbody>
  		</table>
	</div>

	</body>
</html>