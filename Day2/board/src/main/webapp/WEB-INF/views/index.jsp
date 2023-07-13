<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main BBS</title>
</head>
<body>
    <h1>게시판</h1>
    <hr>
    <div>
        <!-- <span>홍길동님 반갑습니다.</span> -->
        <input type="button" id="login" setAttribute="로그인" value="로그인"
            onclick="location='login'">
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

    // JQuery로 구현
    (()=>{
        // $ : JQuery의 String 문법체계
        // $('#login').click(()=>{
        //     alert('jquery-login');
        // });

        const getBbs = function(page)
        {
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

                    // 1. tbody를 가지고 온 후 초기화
                    let bstr = '';
                    const tBody = document.querySelector('#bbsTable > tbody');
                    console.log(tBody);
                    tBody.innerHTML = '';   // 초기화

                    // // 2. tbody 생성
                    for (let i = 0; i < data.bbsList.length; i++)
                    {
                        bstr = '';
                        bstr += '<tr>';
                            bstr += '<td>' + (i + 1) + '</td>'
                            bstr += '<td><a href="/bbs/content?userId=' + data.bbsList[i].userId + '&seq=' + data.bbsList[i].seq + '">' +
                                    data.bbsList[i].title + '</a></td>'
                            bstr += '<td>' + data.bbsList[i].userId + '</td>'
                            bstr += '<td>' + data.bbsList[i].regDate + '</td>'
                        bstr += '</tr>';
                        
                        tBody.innerHTML += bstr;
                    }
                }
            });
        } 

        getBbs(1);
        
    })();

</script>
</body>
</html>