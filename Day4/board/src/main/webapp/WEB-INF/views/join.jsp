<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1>회원가입</h1>
    <table>
        <tr>
            <td><label for="txtMemberId">아이디*</label></td>
            <td><input type="text" id="txtMemberId"name="memberId"> <button type="button" id="btnIdChecking">중복확인</button></td>
        </tr>
        <tr>
            <td><label for="txtMemberPw">비밀번호*</label></td>
            <td><input id="txtMemberPw" type="password" name="memberPw"> <span id="spnTxtPw"></span></td>            
        </tr>
        <tr>
            <td><label for="txtCheckPw">비밀번호확인*</label></td>
            <td><input id="txtCheckPw" type="password"> <span id="spnCheckPw"></span></td>
        </tr>

        <tr>
            <td><label for="txtName">이름</label></td>
            <td><input type="text" id="txtName" name="name"></td>
        </tr>
        <tr>
            <td><label for="txtEmail">이메일</label></td>
            <td><input type="eamil" id="txtEmail" name="email"></td>
        </tr>
        <tr>
            <td><label for="selGrade">등급</label></td>
            <td><select name="" id="selGrade">
                <option value="N">N: 일반회원</option>
                <option value="A">A: 관리자</option>
            </select></td>
        </tr>

    </table>
    <br>
    <button type="button" style="width: 300px;" id="btnJoin">회원가입</button>

<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    const txtMemberId = document.querySelector('#txtMemberId');
    const txtMemberPw = document.querySelector('#txtMemberPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
    const txtEmail = document.querySelector('#txtEmail');
    const selGrade = document.querySelector('#selGrade');

    const btnJoin = document.querySelector('#btnJoin');
    const btnIdChecking = document.querySelector('#btnIdChecking');

    const spnTxtPw = document.querySelector('#spnTxtPw');
    const spnCheckPw = document.querySelector('#spnCheckPw');

    let checkedId = "";
    let idChecking = false;
    let pwChecking = false;

    const checkJoinData = function()
    {   
        // ID 중복체크
        if ((idChecking == false) || (txtMemberId.value != checkedId))
        {
            alert("아이디 중복확인이 필요합니다.");
            btnIdChecking.focus();
            return false;
        }

        // 패스워드 입력
        if ((txtMemberPw.value.length < 1) || (txtCheckPw.value.length < 1))
        {
            alert("비밀번호와 비밀번호 확인을 입력해주세요.");
            return false;
        }
        
        // 패스워드-패스워드 확인 일치
        if (pwChecking == false)
        {
            alert("비밀번호가 일치하지 않습니다.")
            return false;
        }

        // 이름 입력
        if (txtName.value.length < 1)
        {
            alert("이름을 입력해주세요.")
            txtName.focus();
            return false;
        }

        // 이메일 입력
        if (txtEmail.value.length < 1)
        {
            alert("이메일을 입력해주세요.")
            txtEmail.focus();
            return false;
        }

    }

    const checkPwData = function()
    {
        if ((txtMemberPw.value.length > 0) && (txtCheckPw.value.length > 0))
        {
            if (txtMemberPw.value != txtCheckPw.value)
            {
                spnCheckPw.innerHTML = "비밀번호가 일치하지 않습니다."
                txtCheckPw.style.border = "2px solid red";
                pwChecking = false;
            }
            else
            {
                spnCheckPw.innerHTML = "일치하는 비밀번호입니다."
                txtCheckPw.style.border = "2px solid skyblue";
                pwChecking = true;
            }
        }
    }

    //////////////////////////////////////////////////////////////////////////

    btnIdChecking.addEventListener('click', ()=>{
        
        if (txtMemberId.value.length > 0)
        {
            let requestData = {
                memberId : txtMemberId.value
            }

            $.ajax({
                url : '/checkId',
                type : 'POST',
                data : requestData,
                success : function(data)
                {
                    if (data == "OK")
                    {
                        alert("사용할 수 있는 아이디입니다.");
                        idChecking = true;
                        checkedId = txtMemberId.value;
                        txtMemberPw.focus();
                    }
                    else
                    {
                        alert("사용 중인 아이디입니다. 다른 아이디를 입력해주세요.");
                        idChecking = false;
                        txtMemberId.value = '';
                        txtMemberId.focus();
                    }
                }
            })
        }
        else
        {
            alert("아이디를 입력해주세요.");
        }
    })

    txtCheckPw.addEventListener('input', ()=>{
        checkPwData();
    })

    btnJoin.addEventListener('click', ()=>{

        if (checkJoinData() == false)
            return;

        let requestData = {
            memberId : txtMemberId.value,
            memberPw : txtMemberPw.value,
            name : txtName.value,
            email : txtEmail.value,
            grade : selGrade.options[selGrade.selectedIndex].value
        }

        $.ajax({
            url : '/join',
            type : 'POST',
            data : requestData,
            success : function(data)
            {
                if (data === "OK")
                {
                    alert("가입되었습니다. 로그인 후 이용해주세요");
                    location.href = '/login';
                }
                else
                {
                    alert("가입에 실패하였습니다.");
                }
            }
        })
    })


        
})(); 
</script>
        
</body>
</html>