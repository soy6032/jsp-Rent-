<%@page import="admindb.FrBoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admindb.FrBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<style>
        
        .board_con {
            width: 100%;
        }
        
        .board_con .boardList dl {
            width: 100%;
            height: 300px;
            overflow: hidden;
            padding: 30px 0;
            border-bottom: 1px dashed #c8c8c8;
            clear: both;
            cursor: pointer;
        }
        .board_con .boardList dl dt {
            width: 400px;
            float: left;
        }
        .board_con .boardList dl dt img {
            width: 100%;
            height: 230px;
        }
        .board_con .boardList dl dd {
            width: 660px;
            float: right;
        }
        
        .board_con .boardList dl dd strong {
            display: block;
            font-weight: 400;
            color: #000;
            font-size: 24px;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            line-height: 80px;
        }
        .board_con .boardList dl dd span {
            display: block;
            height: 66px;
            line-height: 22px;
            font-size: 16px;
            margin-top: 20px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            white-space: normal;
            overflow: hidden;
            text-align: left;
        }
        .board_con .boardList dl dd em {
            display: block;
            font-style: normal;
            font-size: 16px;
            position: relative;
            margin-top: 20px;
        }

    </style>
</head>
<body>
	<%
	
	FrBoardDAO bdao = new FrBoardDAO();
	ArrayList<FrBoardBean> arrs = bdao.allSelectBoard();
	
	
	
	%>
	<div class="container" style="margin-top: 100px; margin-bottom: 100px;">
	    <div class="board_con">
	        <h3>계약 후기</h3><br>
	        <h5>믿고 진행해주셔서 감사합니다. 최고의 만족과 신뢰의 이름! 카빌리지 계약후기 내역입니다</h5>
	        <div class="boardList">
	        
	        <%
	        	for(int i = 0; i < arrs.size(); i++){
	        		FrBoardBean bean = arrs.get(i);
	        %>
	        
	        
	        
	            <dl onclick="#">
	                <dt><img src="./images/FrBoardImg/<%=bean.getImg() %>" width='100'></dt>
	                <dd>
	                    <strong><%=bean.getSubject() %></strong>
	                    <span>
	                       <%=bean.getContents() %> 
	                    </span>
	                    <em><%=bean.getBdate() %></em>
	                </dd>
	            </dl>
	        <%
	        	}
	        %>
	        </div>
	      </div>
       </div>
</body>
</html>