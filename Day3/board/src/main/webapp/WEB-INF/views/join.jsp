<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
    <h1>회원가입</h1>
    <table>
        <tr>
            <td><label for="txtUserId">아이디*</label></td>
            <td><input type="text" id="txtUserId"name="userId"> <button type="button" id="btnIdChecking">중복확인</button></td>
        </tr>
        <tr>
            <td><label for="txtUserPw">비밀번호*</label></td>
            
            <!-- name : form으로 전송 시 / id : jsp 파일 내부에서 사용 -->
            <td><input id="txtUserPw" type="password" name="userPw"> <span id="spnTxtPw"></span></td>            
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호확인*</label></td>
            <td><input  id="txtCheckPw" type="password"> <span id="spnCheckPw"></span></td>
        </tr>

        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" id="txtName" name="name"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="eamil" id="txtEmail" name="email"></td>
        </tr>

    </table>
    <br>
    <button type="button" style="width: 300px;" id="btnJoin">회원가입</button>
      
<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    const txtUserId = document.querySelector('#txtUserId');
    const txtUserPw = document.querySelector('#txtUserPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
    const txtEmail = document.querySelector('#txtEmail');

    const btnJoin = document.querySelector('#btnJoin');
    const btnIdChecking = document.querySelector('#btnIdChecking');

    const spnTxtPw = document.querySelector('#spnTxtPw');
    const spnCheckPw = document.querySelector('#spnCheckPw');

    let idChecking = false;         // 아이디 중복확인 통과 여부
    let checkedId = "";

    const checkJoinData = function()
    {
        // ID 중복체크
        if ((idChecking == false) || (checkedId != txtUserId.value))
        {
            alert('아이디 중복확인을 해주세요.');
            txtUserId.value = '';
            txtUserId.focus();

            return false;
        }

        if (checkUserPw() == false)
            return false;
        
        if (checkUserInput() == false)
            return false;
        
    }

    const checkUserPw = function()
    {
        if ((txtUserPw.value.length != 0) && (txtCheckPw.value.length != 0))
        {
            if (txtUserPw.value === txtCheckPw.value)
            {
                spnCheckPw.innerHTML = "일치하는 비밀번호입니다.";
                // 수정중
                txtCheckPw.style.border = "1px solid green"
                return true;
            }
            else
            {
                spnCheckPw.innerHTML = "비밀번호가 일치하지 않습니다.";
                txtCheckPw.style.border = "1px solid red"
                return false;
            }
        }
        else if ((txtUserPw.value.length != 0) && (txtCheckPw.value.length == 0))
        {
            alert("비밀번호 확인을 입력해주세요.")
            txtCheckPw.focus();
            return false;
        }
        else if ((txtUserPw.value.length == 0) && (txtCheckPw.value.length != 0))
        {
            alert("비밀번호를 입력해주세요.")
            txtUserPw.focus();
            return false;
        }
        else // ((txtUserPw.value.length === 0) && (txtCheckPw.value.length === 0))
        {
            alert("비밀번호를 입력해주세요.")
            txtUserPw.focus();
            return false;
        }
    }

    const checkUserInput = function()
    {
        if ((txtName.value.length === 0) && (txtEmail.value.length === 0))
        {
            alert("이름과 이메일을 입력해주세요.");
            txtName.focus();
            return false;
        }  
        if ((txtName.value.length != 0) && (txtEmail.value.length === 0))
        {
            alert("이메일을 입력해주세요.");
            txtEmail.focus();
            return false;
        }
        if ((txtName.value.length === 0) && (txtEmail.value.length != 0))
        {   
            alert("이름을 입력해주세요.");
            txtName.focus();
            return false;
        }
        return true;
    }

    ////////////////////////////////////////////////////////////////

    btnIdChecking.addEventListener('click', ()=>{
        
        if (txtUserId.value.length > 0)
        {
            let requestData = {
            userId : txtUserId.value
            }

            $.ajax({
                url : '/idChecking',
                type : 'POST',
                data : requestData,
                success : function(data)
                {
                    if (data === "OK")
                    {
                        alert("사용할 수 있는 아이디입니다.");
                        idChecking = true;
                        checkedId = txtUserId.value;
                        txtUserPw.focus();
                    }
                    else
                    {
                        alert("이미 가입된 아이디가 있습니다. 다른 아이디를 입력해주세요.");
                        idChecking = false;
                        txtUserId.value = '';
                        txtUserId.focus();
                    }
                }
            })
        }
        else
        {
            alert("아이디를 입력해주세요.");
        }

    })

    btnJoin.addEventListener('click', ()=>{

        // 데이터를 검사한다.
        if (false === checkJoinData())
            return;
        
        let requestData = {
            userId : checkedId,     // txtUserId.value
            userPw : txtUserPw.value,
            name : txtName.value,
            email : txtEmail.value
        }

        $.ajax({
            url : '/join',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === "OK")
                {
                    alert("회원가입이 완료되었습니다. 로그인 후 이용해주세요.");
                    location.href = '/login';
                }
                else
                {
                    alert("회원가입에 실패하였습니다.")
                }
            }
        })
    })

    txtCheckPw.addEventListener('input', ()=>{

        checkUserPw();
    })
    ////////////////////////////////////////////////////////////////
        
})(); 
</script>
        
</body>