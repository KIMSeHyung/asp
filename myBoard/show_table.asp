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
        height: auto;
    }
    </style>
    <% 
    dim charId, charTitle, charContents, iViews, dDate, num, mCase
    num = Request.QueryString("num")
    Set Db = Server.CreateObject("ADODB.Connection")
    Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
    Db.Open Conn
    Set Rs = Server.CreateObject("ADODB.RecordSet")
    SQL = "select * from bDB where num="&num&";  update bDB set mviews = mviews+1 where num="&num&";"
    Rs.Open SQL, Db
    charId = Rs("id")
    charTitle = Rs("title")
    charContents = Rs("contents")
    iViews = Rs("mviews")
    dDate = Rs("mdate")
    Rs.close
    Db.close

    sub chose_Case(n)
        mCase = n
    end sub

    %>
</head>

<body>
    <div class="uInfo">
        <p>Author: <%Response.Write (charId)%></p>
        <p>Views: <%Response.Write (iViews)%></p>
        <p>date: <%Response.Write (dDate)%></p>
    </div>
    <div class="views">
        <p><textarea class="uTitle" readonly="readonly"><%Response.Write (charTitle)%></textarea></p>
        <p><textarea class="uContents" readonly="readonly"><%Response.Write (charContents)%></textarea></p>
    </div>
    <div class="list_btn">
        <form action="cert_pwd_view.asp" method="post">
            <button type="button" onclick="location.href='index.asp'">목록</button>
            <input type="hidden" name="num" value="<%Response.write (num)%>">
            <button name="case" onclick="submit" value="m">수정</button>
            <button name="case" onclick="submit" value="d">삭제</button>
        </form>
    </div>
    
    
</body>
</html>
