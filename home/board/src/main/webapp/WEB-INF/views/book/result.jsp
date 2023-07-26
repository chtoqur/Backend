<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <h3>네이버 오픈 API를 이용한 도서 목록</h3>

    <ul>
        <% for (com.study.board.book2.Item item : items) { %>
            <li><a href="<%= item.getLink() %>"><%= item.getTitle() %></a></li>
        <% } %>
    </ul>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
(()=>{   
        
})(); 
</script>
        
</body>
</html>