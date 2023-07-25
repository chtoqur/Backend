<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <h1>main.jsp</h1>
    검색
    <input type="text" name="" id="searchBook">

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    const searchBook = document.querySelector('#searchBook');

    const httpRequest = new XMLHttpRequest();
    httpRequest.open('POST', '/book/list');
    httpRequest.setRequestHeader('content-type', 'application/json');

    httpRequest.onreadystatechange = function()
    {
        // 서버의 응답에 따른 로직 작성
        if(httpRequest.readyState !== XMLHttpRequest.DONE)
            return;

        if (httpRequest.status === 200)
        {
            // 성공 시 코드
        }
        else
        {
            console.error(httpRequest.status, httpRequest.statusText);
        }
    }        

    let requestData = {
        title : searchBook.value
    }

    httpRequest.send(JSON.stringify(requestData));
    

        
})(); 
</script>
        
</body>
</html>