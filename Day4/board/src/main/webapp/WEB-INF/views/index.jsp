<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>main.jsp</h1>

    <span id="spnWelcomeMsg"></span>
    <button type="button" id="btnLogin"></button>
    <button type="button" id="btnJoin"></button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{

    const spnWelcomeMsg = document.querySelector('#spnWelcomeMsg');

    const btnLogin = document.querySelector('#btnLogin');
    const btnJoin = document.querySelector('#btnJoin');

    let sessionState = false;

    //////////////////////////////////////////////////////////////

    const setSessionState = function()
    {
        if ('${vo.memberId}' == '')
            sessionState = false;
        else
            sessionState = true;
    }

    const setWelcomeMsg = function()
    {
        if (sessionState == true)
        {
            spnWelcomeMsg.textContent = '${vo.name}님 반갑습니다.';
        }
        else
        {
            spnWelcomeMsg.textContent = 'Guest Mode로 이용 중입니다.';
        }
    }

    const setLoginBtn = function()
    {
        if (sessionState == true)
            btnLogin.textContent = '로그아웃';
        else
            btnLogin.textContent = '로그인';
    }

    const setJoinBtn = function()
    {
        if (sessionState == true)
        {
            btnJoin.style.display = 'none';
        }
        else
        {
            btnJoin.style.display = 'inline';
            btnJoin.textContent = '회원가입';
        }
    }

    //////////////////////////////////////////////////////////////
    // 이벤트 리스너
    btnLogin.addEventListener('click', ()=>{

        if (sessionState == true)
        {
            if (confirm("로그아웃 하시겠습니까?"))
                location.href = '/logout';
            else
                return;
        }
        else
        {
            location.href = '/login';
        }
    })

    btnJoin.addEventListener('click', ()=>{

        if(sessionState == true)
            return;
        else
        {
            location.href = '/join';
        }
    })


    //////////////////////////////////////////////////////////////
    // 호출부

    setSessionState();
    setWelcomeMsg();
    setLoginBtn();
    setJoinBtn();

})(); 
</script>
        
</body>
</html>