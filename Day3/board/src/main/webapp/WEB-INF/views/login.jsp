<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
    <h1>Login</h1>

    <!-- ID/PW와 인풋 사이 마진 조절을 위해 table 테크닉-->
    <table>
        <tr>
            <!-- name은 서버에서 인식하는 이름, id는 jsp 내부 페이지 인식용 -->
            <td><label for="userId">아이디</label></td>
            <td><input type="text" name="userId" id="userId"></td>
        </tr>

        <tr>
            <td><label for="userPw">패스워드</label></td>
            <td><input type="text" name="userPw" id="userPw"></td>
        </tr>
    </table>

    <!-- button의 디폴트 기능은 submit이기 때문에 사용자가 수동 핸들하기 위해서
         button이라고 명시적으로 하는 것이 좋음 -->
    <div>
        <button type="button" id="btnLogin">로그인</button>
        <button type="button" id="btnIndex">첫화면</button>
    </div>
    <hr>
    <div>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnFindId">ID 찾기</button>
        <button type="button" id="btnFindPw">PW 찾기</button>
    </div>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{

    // 메세지 핸들러

    // 버튼에 대한 DOM 로딩
    const btnLogin = document.querySelector('#btnLogin');
    const btnIndex = document.querySelector('#btnIndex');
    const btnJoin = document.querySelector('#btnJoin');
    const btnFindId = document.querySelector('#btnFindId');
    const btnFindPw = document.querySelector('#btnFindPw');
    
    const frmLogin = document.querySelector('#frmLogin');
    const userId = document.querySelector('#userId');
    const userPw = document.querySelector('#userPw');
    
    const checkInputStatus = function()
    {
        if((userId.value.length > 0) && (userPw.value.length > 0))
        {
            return true;
        }
        else
        {
            alert("아이디와 패스워드를 입력해주세요.")
            return false;
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// 이벤트 핸들러 영역 //////////////////////////////

    btnLogin.addEventListener('click', ()=>{
        
        if (true == checkInputStatus())
        {
            let requestData = {
                userId : userId.value,
                userPw : userPw.value
            };
    
            console.log(requestData);
    
            $.ajax({
                url : '/login',
                type : 'POST',
                data : requestData,
                success : function(data)
                {
                    if (data === "OK")
                    {
                        location.href = "/index";
                    }
                    else if ((data === "FAIL"))
                    {
                        alert("존재하지 않는 계정입니다. 아이디와 패스워드를 확인해주세요.");
                    }
                    else
                    {
                        return;
                    }
                }
            });
        }
    });

    btnIndex.addEventListener('click', ()=>{
        location.href = '/index';
    });

    btnJoin.addEventListener('click', ()=>{
        location.href = '/join';
    });

    btnFindId.addEventListener('click', ()=>{

    });

    btnFindPw.addEventListener('click', ()=>{

    });


        
})(); 
</script>
        
</body>
</html>