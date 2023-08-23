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
    <div id="book-search-form">
        <label for="query">키워드 입력: </label>
        <input type="text" size="50" id="query" name="query" placeholder="검색하고 싶은 도서 키워드를 입력하세요.">
        <button type="submit" id="searchBook">완료</button>
    </div>

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
    
    const btnSearch = document.querySelector('#searchBook');
    
    btnSearch.addEventListener('click', ()=>{
        const query = document.querySelector('#query').value;
        
        const httpRequest = new XMLHttpRequest();
        httpRequest.open('POST', '/book/result');
        httpRequest.setRequestHeader('content-type', 'application/json');
        
        httpRequest.onreadystatechange = function()
        {
            // 서버의 응답에 따른 로직 작성
            if(httpRequest.readyState !== XMLHttpRequest.DONE)
                return;
    
            if (httpRequest.status === 200)
            {
                console.log("성공");
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }        
    
        let formData = {
            Title : query
        }
        
        httpRequest.send(JSON.stringify(formData));
        // formData.append('Title', query);
        // formData.append('sort', 'Accuracy');
        // formData.append('maxResults', '5');
        // formData.append('start', '1');

    })

        
})(); 
</script>
        
</body>
</html>