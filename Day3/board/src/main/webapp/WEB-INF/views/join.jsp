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
        <tr>
            <td><label for="txtPostalCode">주소</label></td>
            <td><input type="text" id="postcode" placeholder="우편번호">
            <input type="button" value="우편번호 찾기" id="execPostcode"></td>
        </tr>
        <tr>
            <td></td>
            <td><input type="text" id="address" placeholder="주소"><br>
            <input type="text" id="detailAddress" placeholder="상세주소"><br>
            <input type="text" id="extraAddress" placeholder="참고항목"></td>
        </tr>

    </table>
    <br>
    <button type="button" style="width: 300px;" id="btnJoin">회원가입</button>
      
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                }
                else
                {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>
<script>
(()=>{   

    const txtUserId = document.querySelector('#txtUserId');
    const txtUserPw = document.querySelector('#txtUserPw');
    const txtCheckPw = document.querySelector('#txtCheckPw');
    const txtName = document.querySelector('#txtName');
    const txtEmail = document.querySelector('#txtEmail');
    const postcode = document.querySelector('#postcode');
    const address = document.querySelector('#address');
    const detailAddress = document.querySelector('#detailAddress');
    const extraAddress = document.querySelector('#extraAddress');
    const execPostcode = document.querySelector('#execPostcode');

    const btnJoin = document.querySelector('#btnJoin');
    const btnIdChecking = document.querySelector('#btnIdChecking');

    const spnTxtPw = document.querySelector('#spnTxtPw');
    const spnCheckPw = document.querySelector('#spnCheckPw');

    let idChecking = false;         // 아이디 중복확인 통과 여부
    let pwChecking = false;         // 비밀번호-비밀번화 확인 일치 여부
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

        // 패스워드 입력 확인
        if ((txtUserPw.value.length === 0) || (txtCheckPw.value.length === 0))
        {
            alert("비밀번호와 비밀번호 확인을 입력해주세요.");
            return false;
        }

        // 패스워드-패스워드 일치 확인
        if (pwChecking == false)
        {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        
        // 이름 입력 확인
        if (txtName.value.length === 0)
        {
            alert("이름을 입력해주세요.")
            txtName.focus();
            return false;
        }

        // 이메일 입력 확인
        if (txtEmail.value.length === 0)
        {
            alert("이메일을 입력해주세요.")
            txtEmail.focus();
            return false;
        }

        // 주소 입력 확인
        if ((postcode.value.length === 0) || (address.value.length === 0))
        {
            alert("우편번호를 입력해주세요.")
            execPostcode.focus();
            return false;
        }

        // 상세주소 입력 확인 (null 가능)
        if (detailAddress.value.length === 0)
        {
            if (false == confirm("상세주소가 입력되지 않았습니다. 위의 정보로 가입하시겠습니까?"))
            {
                detailAddress.focus();
                return false;
            }
        }
        
    }

    const checkPwData = function()
    {
        if ((txtUserPw.value.length > 0) && (txtCheckPw.value.length > 0))
        {
            if (txtUserPw.value === txtCheckPw.value)
            {
                spnCheckPw.innerHTML = "일치하는 비밀번호입니다.";
                txtCheckPw.style.border = "2px solid skyblue"
                pwChecking = true;
            }
            else
            {
                spnCheckPw.innerHTML = "비밀번호가 일치하지 않습니다.";
                txtCheckPw.style.border = "2px solid red"
                pwChecking = false;
            }
        }
    }

    ////////////////////////////////////////////////////////////////

    execPostcode.addEventListener('click', ()=>{
        execDaumPostcode();
    })

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
            email : txtEmail.value,
            address : postcode.value + ", " + address.value + ", " + detailAddress.value + extraAddress.value
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
        checkPwData();
    })

    ////////////////////////////////////////////////////////////////
        
})(); 
</script>


        
</body>