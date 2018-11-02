<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <%
        dim num, mCase
        num = Request.Form("num")
        mCase = Request.Form("case")
    %>
    <style>
        .views{
            text-align: center;
            margin-top: 300px;
        }
    </style>
</head>
<body>
<form action ="cert_pwd.asp" method="post">
    <div class="views">
        <p>비밀번호를 입력하세요</p>
        <input type="password" name="pwd">
        <input type="hidden" name="num" value="<%Response.Write (num)%>">
        <input type="hidden" name="case" value="<%Response.Write (mCase)%>">
        <input type="submit" value="확인">    
        
    </div>
</form>

</body>
</html>