<!--METADATA TYPE="typelib" name="ADODB Type Library"
       UUID = "00000205-0000-0010-8000-00AA006D2EA4"  -->


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>게시판</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
        table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        table{
            margin: auto;
            text-align: center;
        }
        #subtitle{
            margin: auto;
            text-align: center;
        }
        .btn{
            margin-top: 50px;
            text-align: center;
        }
    </style>
    <OBJECT RUNAT=server PROGID=ADODB.Connection ID=Db></OBJECT>
    <OBJECT RUNAT=server PROGID=ADODB.RecordSet ID=Rs></OBJECT>
    <%
    
    dim Conn, rcCount, SQL

    Session.timeout = 120
    session.codepage = 65001
    Response.charset = "utf-8"
    

    'Set Db = Server.CreateObject("ADODB.Connection")
     Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
     Db.Open Conn
    'Set Rs = Server.CreateObject("ADODB.RecordSet")
     SQL = "select * from (select ROW_NUMBER() over (order by num desc) as rownum, * from bdb) tb;"
     Rs.Open SQL, Db, 3, 1
     rcCount = Rs.recordcount
    
    sub addRow(n, a, t, v, d)
        Response.Write ("<tr>")
        Response.Write ("<td>"&n&"</td>")
        Response.Write ("<td>"&a&"</td>")
        Response.Write ("<td><a href='show_table.asp?num="&n&"'>"&t&"</a></td>")
        Response.Write ("<td>"&v&"</td>")
        Response.Write ("<td>"&d&"</td>")
        Response.Write ("</tr>")
    end sub
    %>
    
</head>
<body>


    <div id="subtitle">
        <h1>게시판</h1>
    </div>

    <div>
        <table id="board" style="width: 950px">
            <tr>
                <th width="80px">번호</th>
                <th width="100px">작성자</th>
                <th width="600px">제목</th>
                <th width="70px">조회수</th>
                <th width="100px">작성일</th>
            </tr>
            <%
                if rs.bof or rs.eof then
                %>
                    <tr>
                        <td colspan = "5">등록된 게시물이 없습니다.</td>
                    </tr>
                <%
                else

                    do until rs.eof
                    n = rs("num")
                    %>
                <tr>
                    <th width="80px"><%=n%></th>
                    <th width="100px"><%=rs("id")%></th>
                    <th width="600px"><a href="show_table.asp?num=<%=n%>"><%=rs("title")%></a></th>
                    <th width="70px"><%=rs("mviews")%></th>
                    <th width="100px"><%=rs("mdate")%></th>
                </tr>                
                    <%
                        rs.MoveNext
                    loop

                end if
                
                for i = 0 to rcCount-1 step 1
                %>
                <%
                '    addRow Rs("num"), Rs("id"), Rs("title"), Rs("mviews"), Rs("mdate")
                '    Rs.MoveNext
                next
                Rs.close
                Db.close
            %>
        </table>
    </div>
    <div class="btn">
        <button onclick="location.href='insert_table_view.asp'">글쓰기</button>
    </div>
</body>
</html>