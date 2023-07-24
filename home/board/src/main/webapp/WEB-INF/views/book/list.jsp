<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <h3>네이버 오픈 API를 이용한 도서 목록</h3>

    <table border="1">
        <tr>
            <td>'${books}'</td>
        </tr>
        <!-- <tr th:each="book:${books}">
            <td>[[${book.isbn}]]</td>
            <td><img th:src="${book.image}" th:alt="${book.title}" width="100"></td>
            <td><a th:href="${book.link}">[[${book.title}]]</a></td>
            <td>[[${book.author}]]/[[${book.publisher}]]</td>
            <td>[[${book.pubdate}]]</td>		
        </tr> -->
    </table>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
        
})(); 
</script>
        
</body>
</html>