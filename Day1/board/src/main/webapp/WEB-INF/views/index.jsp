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
        <input type="button" id="login" setAttribute="로그인" value="로그인">
    </div>
    <br>
    <!-- 테이블 구현 -->
    <table border="1" id="bbsTable">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>아이디</th>
                <th>날짜</th>
            </tr>
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
        // $ : JQuery의 String 문법체계
        $('#login').click(()=>{
            alert('jquery-login');
        });

        const getBbs = function(page)
        {
            // 
            // input-box DOM을 가지고 온다.
            const inputDivi = document.querySelector('#divi');
            const inputPageNum = document.querySelector('#pageNum');

            // divi에는 A를, pageNum에는 1을 넣는다.
            inputDivi.setAttribute('value', 'A');
            inputPageNum.setAttribute('value', page.toString());

            // form 데이터를 만든다.
            let formData = new FormData(bbsform);
            const bbsTable = document.getElementById('bbsTable');

            $.ajax({
                data : formData,
                type : 'POST',      // POST 방식으로
                url : '/bbs/list',  // 여기에 전송
                // 이 외 기본적으로 들어가는 값들
                cache : false,
                processData : false,
                contentType : false,
                // function(data) : 전체정보
                success : function(data) {

                    // 초기화
                    // const tBody = document.querySelector('#bbsTable > tbody');
                    // tBody.innerHTML = '';

                    // for (let i = 0; i < data.bbsList.length; i++)
                    // {
                    //     const userId = data.bbsList[i].userId;
                    //     const seq = data.bbsList[i].seq;

                        // $("#bbsTable > tbody:last").append("<tr><td>" + data.bbsList[i].seq +
                        //                             "</td><td><a href=/bbs/content?userId=" + data.bbsList[i].userId + "&seq=" +
                        //                                 data.bbsList[i].seq + ">" + data.bbsList[i].title +
                        //                             "</a></td><td>" + data.bbsList[i].userId +
                        //                             "</td><td>" + data.bbsList[i].regdate + "</td></tr>");
                        // }

                    // way2
                    // 1. tbody를 가지고 온 후 초기화
                    // 초기화를 시키지 않을 경우 page2 이상에서는 기존에 있는 내용에 덧붙여서 출력됨
                    let bstr = '';
                    const tBody = document.querySelector('#bbsTable > tbody');
                    console.log(tBody);
                    tBody.innerHTML = '';   // 초기화

                    // // 2. tbody 생성
                    // data.bbsList는 서버에서 날아올 때 JSON 형식으로 만들어져 있기 때문에
                    // 객체 방식으로 받아서 사용할 수 있음
                    for (let i = 0; i < data.bbsList.length; i++)
                    {
                        bstr = '';  // 초기화
                        bstr += '<tr>';
                            bstr += '<td>' + (i + 1) + '</td>'
                            bstr += '<td><a href="/bbs/content?userId=' + data.bbsList[i].userId + '&seq=' + data.bbsList[i].seq + '">' +
                                    data.bbsList[i].title + '</a></td>'
                            bstr += '<td>' + data.bbsList[i].userId + '</td>'
                            bstr += '<td>' + data.bbsList[i].regDate + '</td>'
                        bstr += '</tr>';
                        
                        tBody.innerHTML += bstr;
                    }

                    // 3. 


                }
            });
        } 

        getBbs(1);

        // 제목에는 a태그로 링크할 수 있게 생성

        // document.getElementById('bt_seq').innerHTML = data.bbsList[i].seq;
        

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