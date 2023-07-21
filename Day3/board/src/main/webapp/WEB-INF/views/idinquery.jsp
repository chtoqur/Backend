<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <h1>ID 찾기</h1>
    <hr>
    이메일 <input type="email" name="email" id="txtEmail">
    <button type="button" id="btnSubmit">확인</button>
    <br><br>
    <button type="button" id="btnLogin">로그인</button>
<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   
        
    const txtEmail = document.querySelector('#txtEmail');
    const btnSubmit = document.querySelector('#btnSubmit');
    const btnLogin = document.querySelector('#btnLogin');

    //////////////////////////////////////////////////////////////////////
    // 이벤트 리스너

    btnSubmit.addEventListener('click', ()=>{
        
        if (txtEmail.value.length === 0)
        {
            alert("이메일을 입력해주세요.");
            return;
        }

        let requestData = {
            email : txtEmail.value
        }

        $.ajax({
            url : '/idinquery',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data == "$NOUSER")
                {
                    alert("존재하지 않는 정보입니다.");
                }
                else
                {
                    alert("아이디 = " + data);
                }
            }
        })
    })

    btnLogin.addEventListener('click', ()=>{
        location.href = '/login';
    })


})(); 
</script>
        
</body>
</html>