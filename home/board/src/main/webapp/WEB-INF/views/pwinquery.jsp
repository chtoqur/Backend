<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <h1>PW 찾기</h1>
    <hr>
    아이디 <input type="text" name="userId" id="txtUserId">
    <button type="button" id="btnSubmit">확인</button>
    <br><br>
    <button type="button" id="btnLogin">로그인</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
        
    const txtUserId = document.querySelector('#txtUserId');
    const btnSubmit = document.querySelector('#btnSubmit');
    const btnLogin = document.querySelector('#btnLogin');

    //////////////////////////////////////////////////////////////////////
    // 이벤트 리스너

    btnSubmit.addEventListener('click', ()=>{
        
        if (txtUserId.value.length === 0)
        {
            alert("아이디를 입력해주세요.");
            return;
        }

        const httpRequest = new XMLHttpRequest();

        httpRequest.open('POST', '/pwinquery');
        httpRequest.setRequestHeader('content-type', 'application/json');

        httpRequest.onreadystatechange = function()
        {
            // 서버의 응답에 따른 로직 작성
            if(httpRequest.readyState !== XMLHttpRequest.DONE)
                return;

            if (httpRequest.status === 200)
            {
                let responseText = httpRequest.responseText;
                if (responseText == "$NOUSER")
                {
                    alert("존재하지 않는 정보입니다.");
                }
                else
                {
                    alert("이메일을 전송하였습니다.")
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }        

        let requestData = {
            userId : txtUserId.value
        }

        httpRequest.send(JSON.stringify(requestData));

        // $.ajax({
        //     url : '/pwinquery',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)
        //     {
        //         if (data == "$NOUSER")
        //         {
        //             alert("존재하지 않는 정보입니다.");
        //         }
        //         else
        //         {
        //             alert("이메일을 전송하였습니다.")
        //         }
        //     }
        // })
    })

    btnLogin.addEventListener('click', ()=>{
        location.href = '/login';
    })


})(); 
</script>
        
</body>
</html>