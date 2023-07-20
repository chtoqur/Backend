<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <table>
        <tr>
            <td><label for="memberId">아이디</label></td>
            <td><input type="text" name="" id="memberId"></td>
        </tr>
        <tr>
            <td><label for="memberPw">비밀번호</label></td>
            <td><input type="password" name="" id="memberPw"></td>
        </tr>
    </table>

    <div>
        <button type="button" id="btnLogin" style="width: 250px;">로그인</button>
    </div>
    <div>
        <button type="button" id="btnJoin">회원가입</button>
        <button type="button" id="btnFindId">ID 찾기</button>
        <button type="button" id="btnFindPw">PW 찾기</button>
    </div>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{

    const memberId = document.querySelector('#memberId');
    const memberPw = document.querySelector('#memberPw');

    const btnLogin = document.querySelector('#btnLogin');
    const btnJoin = document.querySelector('#btnJoin');
    const btnFindId = document.querySelector('#btnFindId');
    const btnFindPw = document.querySelector('#btnFindPw');

    const checkInputData = function()
    {
        if ((memberId.value.length < 1))
        {
            alert("아이디를 입력하세요.");
            memberId.focus();
            return false;
        }

        if ((memberPw.value.length < 1))
        {
            alert("비밀번호를 입력하세요.");
            memberPw.focus();
            return false;
        }

        return true;
    }

    ////////////////////////////////////////////////////////

    btnLogin.addEventListener('click', ()=>{
        
        if (checkInputData() == false)
            return;

        let requestData = {
            memberId : memberId.value,
            memberPw : memberPw.value
        }

        $.ajax({
            url : '/login',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === "OK")
                {
                    location.href = '/index';
                    return;
                }

                if (data === "FAIL")
                {
                    memberId.value = '';
                    memberPw.value = '';
                    alert("회원정보가 일치하지 않거나, 존재하지 않는 계정입니다.");
                    memberId.focus();
                }
            }
        })
    })

    btnJoin.addEventListener('click', ()=>{
        location.href = "/join";
    })

    btnFindId.addEventListener('click', ()=>{
        
    })

    btnFindPw.addEventListener('click', ()=>{
        
    })



        
})(); 
</script>
        
</body>
</html>