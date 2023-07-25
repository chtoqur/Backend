<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title></title>

    <style>
        h1 {
            margin-top: 20px;
            text-align: center;
        }

        table tbody tr {
            cursor: pointer;
        }
        .box {
            border : 1px solid red
        }
        .flex-box {
            display: flex;
        }
        .container-sm {
            border: 1px solid red;
        }
    </style>

</head>
<body>

    <div>
        <h1>공지사항</h1>
    </div>
    <div class="container-md">
        <table class="table table-hover table-bordered">
            <thead>
              <tr class="table-active">
                <th scope="col">SEQ</th>
                <th scope="col">제목</th>
                <th scope="col">아이디</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <!-- 윗줄 굵은선 -->
            <tbody class="">
              <tr id="row-1" userId="jsh" seq="1">
                <th scope="row">1</th>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">3</th>
                <td colspan="2">Larry the Bird</td>
                <td>@twitter</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <th scope="row">5</th>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
            </tbody>
          </table>

    </div>

    <div class="flex-box">
        <div class="box">A</div>
        <div class="box">B</div>
        <div class="box">C</div>
        <div class="box">D</div>
    </div>

    

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/JS/jquery-3.7.0.min.js"></script>
<script>
    
    const row1 = document.querySelector('#row-1');
    row1.addEventListener('click', ()=>{
        console.log(row1.getAttribute('seq'));
        console.log(row1.getAttribute('userId'));
        row1.setAttribute('memberId', "cis");
        console.log(row1.getAttribute('memberId'));


    });
    
(()=>{   
        
})(); 
</script>
        
</body>
</html>