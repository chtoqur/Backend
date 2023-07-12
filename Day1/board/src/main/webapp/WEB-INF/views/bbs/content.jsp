<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

    <%-- 내가 쓴 글이라면 수정기능 부여, 내가 쓴 글이 아니라면 read-only --%>
    <%-- 서버로 수정된 title과 content 데이터를 날리기 위해 form 태그 사용 --%>

    <form action="" method="post">
        <input type="text" id="title" value="${vo.title}">
        <span>${vo.userId}</span>
        <hr><br>
        <textarea name="content" id="content" cols="30" rows="10">${vo.content}</textarea>
    </form>
    <div>
        <button id="bbsList">목록으로</button>
        <button id="modify">수정</button>
    </div>


        <!-- <input type="text" value="${vo.title}" readonly>
        <input type="button" value="목록으로" disabled><br><br>
        <textarea name="" id="" cols="30" rows="10" readonly>${vo.content}</textarea>
        <input type="button" value="수정(저장)" disabled> -->

    <script>
        (()=>{
            
            const btnBbsList = document.querySelector('#bbsList');
            btnBbsList.addEventListener('click', ()=>{
                // 이전 페이지로 돌아가기
                history.back();
                // = location.href = '/index';
            });

            const btnModify = document.querySelector('#modify');
            btnModify.addEventListener('click', ()=>{
                
                if (confirm('수정하시겠습니까?'))
                {
                    // 수정 요청
                }

            })

        })();
        
    </script>
</body>
</html>