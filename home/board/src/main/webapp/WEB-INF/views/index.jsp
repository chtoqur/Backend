<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
</head>
<body>
    <h1>Main BBS</h1>
    <hr>
    <div>
        <span id="spnWelcome"></span>
        <button type="button" id="btnLogin"></button>
    </div>
    
    <table border="1" id="tblBBS">
        <thead>
            <th>순번</th>
            <th>번호</th>
            <th>아이디</th>
            <th>날짜</th>
        </thead>
        <tbody>
        </tbody>
    </table>

    <button type="button" id="btnPrev">이전</button>
    <button type="button" id="btn1" class="btns">1</button>
    <button type="button" id="btn2" class="btns">2</button>
    <button type="button" id="btn3" class="btns">3</button>
    <button type="button" id="btn4" class="btns">4</button>
    <button type="button" id="btn5" class="btns">5</button>
    <button type="button" id="btnNext">다음</button>
    <button type="button" id="btnWrite">글작성</button>


<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
(()=>{   

    let sessionState = false;

    // 로우 관련 정보
    let rowCount = 0;           // 전체 건수
    
    // 페이지 관련 정보
    let rowsPerPage = 5;        // 페이지 당 건수 (테이블에서 보여지는 최대 건수)
    let curPage = 0;            
    let totalPage = 0;          // 전체 페이지 넘버
    let page = '${page}';             // 해당 변수 넘버에 따라서 페이지 동적 변화

    // 섹션 관련 정보
    let curSection = 0;         // 현재 섹션 (다음 버튼 = 증가, 이전 버튼 = 감소)
    let pagesPerSection = 5;    // 섹션 당 페이지 수 (버튼 수와 동일)
    let totalSectionNum = 0;    // 전체 섹션 개수

    const spnWelcome = document.querySelector('#spnWelcome');

    const btns = document.querySelectorAll('.btns');
    const btnLogin = document.querySelector('#btnLogin');

    const btnPrev = document.querySelector('#btnPrev');
    const btn1 = document.querySelector('#btn1');
    const btn2 = document.querySelector('#btn2');
    const btn3 = document.querySelector('#btn3');
    const btn4 = document.querySelector('#btn4');
    const btn5 = document.querySelector('#btn5');
    const btnNext = document.querySelector('#btnNext');
    const btnWrite = document.querySelector('#btnWrite');
    

    //////////////////////////////////////////////////////////

    // 현재 세션이 존재하는지 확인
    const setsessionState = function()
    {
        if('${vo.userId}' == '')
        {
            sessionState = false;
        }
        else
        {
            sessionState = true;
        }
    }

    // 웰컴 메세지 설절
    const setWelcomeMsg = function()
    {
        if (sessionState == true)
        {
            spnWelcome.textContent = '${vo.name}님 반갑습니다.';
        }
        else
        {
            spnWelcome.textContent = 'Guest Mode로 이용 중입니다.';
        }
    }

    const setLoginButton = function()
    {
        if (sessionState == true)
        {
            btnLogin.textContent = '로그아웃'
        }
        else
        {
            btnLogin.textContent = '로그인'
        }
    }

    const setBBS = function(page)
    {
        const httpRequest = new XMLHttpRequest();

        httpRequest.open('POST', 'bbs/list');
        httpRequest.setRequestHeader('content-type', 'application/json');

        httpRequest.onreadystatechange = function()
        {
            // 서버의 응답에 따른 로직 작성
            if (httpRequest.readyState !== XMLHttpRequest.DONE)
                return;

            if (httpRequest.status === 200)
            {
                let data = JSON.parse(httpRequest.responseText);

                let bstr = '';
                const tblBody = document.querySelector('#tblBBS > tbody');

                // data : 1. 전체 rowCount, 2. bbsList
                // 1. 전체 카운트를 저장한다.
                rowCount = data.rowCount;
                // 2. 테이블 body를 채워준다.
                tblBody.innerHTML = '';

                for (let i = 0; i < data.bbsList.length; i++)
                {
                    bstr = '';
                    bstr += '<tr>';
                        bstr += '<td>' + data.bbsList[i].rowNum + '</td>';
                        bstr += '<td><a href=\"/bbs/content?userId=' + data.bbsList[i].userId + 
                                '&seq=' + data.bbsList[i].seq + '\">' + data.bbsList[i].title +
                                '</a></td>'
                        bstr += '<td>' + data.bbsList[i].userId + '</td>';
                        bstr += '<td>' + data.bbsList[i].regDate + '</td>';
                    bstr += '</tr>';

                    tblBody.innerHTML += bstr;
                }
            }
            else
            {
                console.error(httpRequest.status, httpRequest.statusText);
            }
        }        

        // 객체로 생성하기
        let requestData = {
            divi : 'C',
            page : page,
            rowsPerPage : rowsPerPage
        };

        httpRequest.send(JSON.stringify(requestData));

        // $.ajax({
        //     url : 'bbs/list',
        //     type : 'POST',
        //     data : requestData,
        //     success : function(data)
        //     {
        //         let bstr = '';
        //         const tblBody = document.querySelector('#tblBBS > tbody');

        //         // data : 1. 전체 rowCount, 2. bbsList
        //         // 1. 전체 카운트를 저장한다.
        //         rowCount = data.rowCount;
        //         // 2. 테이블 body를 채워준다.
        //         tblBody.innerHTML = '';

        //         for (let i = 0; i < data.bbsList.length; i++)
        //         {
        //             bstr = '';
        //             bstr += '<tr>';
        //                 bstr += '<td>' + data.bbsList[i].rowNum + '</td>';
        //                 bstr += '<td><a href=\"/bbs/content?userId=' + data.bbsList[i].userId + 
        //                         '&seq=' + data.bbsList[i].seq + '\">' + data.bbsList[i].title +
        //                         '</a></td>'
        //                 bstr += '<td>' + data.bbsList[i].userId + '</td>';
        //                 bstr += '<td>' + data.bbsList[i].regDate + '</td>';
        //             bstr += '</tr>';

        //             tblBody.innerHTML += bstr;
        //         }
            // }
        // });

    }

    // 실제 적용해야 할 페이지를 구하는 함수
    const getRealPage = function(pageOffset)
    {
        return (curSection * pagesPerSection) + pageOffset;
    }

    // const setPageBtn = function()
    // {
    //     rowCount = '${rowCount}';
    //     curSection = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;
    //     console.log("curSection = " + curSection);
    //     console.log("rowCount = " + rowCount);

    //     setPageBtnNum();
    //     hidddenBtn();
    // }

    const setPageBtnNum = function()
    {
        // 하단 숫자 버튼 변경
        let count = 1;

        for (let i = 0; i < btns.length; i++)
        {
            btns[i].textContent = getRealPage(count);
            count++;
        }
    }

    const hidddenBtn = function()
    {
        // 버튼 히든
        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        if (curSection == totalSectionNum)
        {
            let deleteBtn = ((totalSectionNum + 1) * pagesPerSection) - (totalPage + 1);
            let startIndex = pagesPerSection - deleteBtn;
            
            if (deleteBtn > 0)
            {
                for (let i = startIndex; i < pagesPerSection; i++)
                {
                    btns[i].style.display = 'none';
                }
            }
        }
    }

    const displayBtn = function()
    {
        // 버튼 히든 해제
        let deleteBtn = ((totalSectionNum + 1) * pagesPerSection) - (totalPage + 1);
        let startIndex = pagesPerSection - deleteBtn;

        if (deleteBtn > 0)
        {
            for (let i = startIndex; i < pagesPerSection; i++)
            {
                btns[i].style.display = 'inline';
            }
        }
    }

    ////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////// 이벤트 핸들러 영역 //////////////////////////////
    
    btnLogin.addEventListener('click', ()=>{

        // 로그인 상태일 시 로그아웃
        if (sessionState == true)
        {
            location.href = '/logout';
        }
        // 로그아웃 상태일 시 로그인
        else
        {
            location.href = '/login';
        }
    })

    btnWrite.addEventListener('click', ()=>{

        if (sessionState == true)
        {
            location.href = "/bbs/newcontent";
        }
        else
        {
            alert("로그인 후 작성할 수 있습니다.");
        }

    })

    btnPrev.addEventListener('click', ()=>{

        // Prev 불가능 : 첫번째 섹션에 위치해있는 경우
        if (curSection <= 0)
        {
            alert("첫번째 섹션입니다.");
            return;
        }
        
        // 서버에 현재 몇 건이 있는지 알아본다.
        // 코드 수정

        curSection--;
        let realPage = getRealPage(0);
        setBBS(realPage);

        setPageBtnNum();

        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        // 버튼 복귀
        if (curSection == (totalSectionNum - 1))
        {
            displayBtn();
        }
        
    });

    btnNext.addEventListener('click', ()=>{

        // 현재 rowCount의 개수를 한 번 더 출력
        // 코드 작성란

        let rowsPerSection = rowsPerPage * pagesPerSection;
        let nextRowCount = rowCount - (rowsPerSection * (curSection + 1));
        if (nextRowCount <= 0)
        {
            alert("다음 내용은 없습니다.");
            return;
        }

        curSection ++;
        let realPage = getRealPage(0);
        setBBS(realPage);

        // 하단 숫자 버튼 변경
        setPageBtnNum();

        totalPage = Math.ceil(rowCount / rowsPerPage) - 1;
        totalSectionNum = Math.ceil(rowCount / rowsPerPage / pagesPerSection) - 1;

        // 버튼 숨기기
        if (curSection == totalSectionNum)
        {
            hidddenBtn();
        }

    });

    btn1.addEventListener('click', ()=>{
        const pageOffset = 0;
        const realPage = getRealPage(pageOffset);
        setBBS(realPage);
    });

    btn2.addEventListener('click', ()=>{
        const pageOffset = 1;
        const realPage = getRealPage(pageOffset);
        setBBS(realPage);
    });

    btn3.addEventListener('click', ()=>{
        const pageOffset = 2;
        const realPage = getRealPage(pageOffset);
        setBBS(realPage);
    });

    btn4.addEventListener('click', ()=>{
        const pageOffset = 3;
        const realPage = getRealPage(pageOffset);
        setBBS(realPage);
    });

    btn5.addEventListener('click', ()=>{
        const pageOffset = 4;
        const realPage = getRealPage(pageOffset);
        setBBS(realPage);
    });


    //////////////////////////////////////////////////////////
    ///////////////////////// 호출부 /////////////////////////
    setsessionState();      // 세션이 있는지 없는지 상태값을 저장
    setWelcomeMsg();        // 웰컴 메세지 설정
    setLoginButton();       // 로그인-로그아웃 버튼 설정
    setBBS(page);
    // setPageBtn();

})(); 
</script>
        
</body>
</html>