<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
    <!-- <h1>Login.jsp</h1> -->

    <form action="/login" method="post">
        <legend><h2>로그인</h2></legend>
        <label for="userId">아이디</label> : <input type="text" name="userId" id="userId"><br>
        <label for="userPw">비밀번호</label> : <input type="password" name="userPw" id="userPw">
        <input type="submit" value="LOGIN">
    </form>
    <br>
    <input type="button" value="회원가입">
    <input type="button" value="아이디찾기">
    <input type="button" value="비밀번호찾기">

    <script>
        (()=>{
            
            confirm("아이디가 일치하지 않습니다. 입력한 내용을 다시 확인해 주세요.");

        })();
        
    </script>

</body>
</html>