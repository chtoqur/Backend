<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bbs Content</title>
</head>
<body>
    <h1>Bbs Content.jsp</h1>

</body>

<!-- <script>
        (()=>{

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
                success : function(data) {

                    for (let i = 0; i < data.bbsList.length; i++)
                    {
                        const userId = data.bbsList[i].userId;
                        const seq = data.bbsList[i].seq;

                        $("#bbsTable > tbody:last").append("<tr><td>" + data.bbsList[i].seq +
                                                    "</td><td><a href=/bbs/content?userId=" + userId + "&seq=" + seq + ">" + data.bbsList[i].title +
                                                    "</a></td><td>" + data.bbsList[i].userId +
                                                    "</td><td>" + data.bbsList[i].regdate + "</td></tr>");
                    }
                }
            });
        } 

        getBbs(1);
    })();
</script> -->
</html>