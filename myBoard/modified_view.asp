<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8"/>
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
    .uContents{
        width: 1000px;
        height: 500px;
        resize: none;
    }
    .uTitle{
        width: 1000px;
        height: 20px;
        resize: none;
    }
    .uInfo{
        margin-left: 450px;
    }
    .views{
        text-align: center;
    }
    .list_btn{
        margin-left: 450px;
    }
    </style>
    <% 
    dim charId, charTitle, charContents, iViews, dDate, num, mCase
    num = Request.QueryString("num")
    Set Db = Server.CreateObject("ADODB.Connection")
    Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
    Db.Open Conn
    Set Rs = Server.CreateObject("ADODB.RecordSet")
    SQL = "select * from bDB where num="&num&";"
    Rs.Open SQL, Db
    charId = Rs("id")
    charTitle = Rs("title")
    charContents = Rs("contents")
    iViews = Rs("mviews")
    dDate = Rs("mdate")
    Rs.close
    Db.close

    %>
</head>

<body>  
    <div class="uInfo">
        <p>Author: <%Response.Write (charId)%></p>
        <p>Views: <%Response.Write (iViews)%></p>
        <p>date: <%Response.Write (dDate)%></p>
    </div>
    
    <form action="modified.asp" method="post">
    <div class="views">
        <p><textarea name="title" class="uTitle"><%Response.Write (charTitle)%></textarea></p>
        <p><textarea name="contents" class="uContents"><%Response.Write (charContents)%></textarea></p>
    </div>
    
    <div class="list_btn">
        <input type="hidden" name="num" value="<%Response.write (num)%>">
        <input type="submit" value="확인">
        <button type="button" onclick="alert('cancle'); location.href='show_table.asp?num=<%Response.Write num%>';">취소</button>
    </div>
    </form>
    
    
</body>
</html>
