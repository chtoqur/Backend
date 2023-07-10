<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main BBS</title>
</head>
<body>
    <h1>Main BBS</h1>
    <hr>
    <div>
        <span>홍길동님 반갑습니다.</span>
        <input type="button" id="login" setAttribute="로그인">
    </div>
    <br>
    <!-- 테이블 구현 -->
    <table border="1" id="bbsTable">
        <thead>
            <th>번호</th>
            <th>제목</th>
            <th>아이디</th>
            <th>날짜</th>
        </thead>
        <tbody>
            

        </tbody>
    </table>

    <form action="" id="bbsform" name="bbsform">
        <input type="text" id="divi" name="divi">
        <input type="text" id="pageNum" name="pageNum">
    </form>

<script src="/JS/jquery-3.7.0.min.js"></script>

<script>
    // 로그인 버튼 클릭 시 alert("login")

    // Way 1
    // document.getElementById("login").onclick = function(){
    //     alert("login!");
    // };

    // Way 2
    // (()=>{
    //     // const btnLogin = document.querySelector('#login');
    //     const btnChange = document.getElementById("login");

    //     btnChange.addEventListener("click", ()=>{
    //         alert("login");
    //     });
    // })();

    // JQuery로 구현
    (()=>{
        $('#login').click(()=>{
            alert('jquery-login');
        });

        const getBbs = function(page)
        {
            // DOM
            const inputDivi = document.querySelector('#divi');
            const inputPageNum = document.querySelector('#pageNum');

            // divi에는 A를, pageNum에는 1을 넣는다.
            inputDivi.setAttribute('value', 'A');
            inputPageNum.setAttribute('value', page.toString());

            // form 데이터를 만든다.
            let formData = new FormData(bbsform);
            
            // 
            $.ajax({
            data : formData,
            type : 'POST',
            url : '/bbs/list',
            // 이 외 기본적으로 들어가는 값들
            cache : false,
            processData : false,
            contentType : false,
            success : function(data) {
                alert(data);
            }
        });

        }

        getBbs(1);

        // bbsform 내부 input 태그 두 개의 값을 세팅
        // 1. divi : C, pageNum : 1로 세팅
        // 2. "form 데이터"를 JSON 형태로 만든다.
        // 3. 만들어진 "FORM JSON 데이터"를 AJX 통신방식으로 서버에게 전달한다.
        // 4. 서버에서 전달된 게시판 데이터를 수신한다.
        // 5. 수신받은 데이터를 가지고 table body를 만든다.

        // 1. divi : C, pageNum : 1로 세팅
        // 돔 데이터 가져오기
        // const inputDivi = document.querySelector('#divi');
        // const inputPageNum = document.querySelector('#pageNum');
        
        // 돔데이터 벨류에 원하는 값 집어넣기
        // inputDivi.setAttribute('value', 'A');
        // inputPageNum.setAttribute('value', '1');

        // 2. "form 데이터"를 JSON 형태로 만든다.
        // let formData = new FormData(bbsform);

        // 3. 만들어진 "FORM JSON 데이터"를 AJX 통신방식으로 서버에게 전달한다.
        //  - 보낼 데이터 : formData
        //  - 전송할 URL : \bbs\list
        //  - method type : post
        //  - 결과를 받는 함수 필요
        // $.ajax({
        //     data : formData,
        //     type : 'POST',
        //     url : '/bbs/list',
        //     // 이 외 기본적으로 들어가는 값들
        //     cache : false,
        //     processData : false,
        //     contentType : false,
        //     success : function(data) {}
        // });

        // 4. 서버에서 전달된 게시판 데이터를 수신한다.
        // 5. 수신받은 데이터를 가지고 table body를 만든다.


    })();

</script>
</body>
</html>