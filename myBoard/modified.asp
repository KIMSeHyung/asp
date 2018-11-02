
        <%
            dim num, charTitle, charContents
            num = Request.Form("num")
            charTitle = Request.Form("title")
            charContents = Request.Form("contents")
           
            Set Db = Server.CreateObject("ADODB.Connection")
            Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
            Db.Open Conn
            Set Rs = Server.CreateObject("ADODB.RecordSet")
            SQL = "update bDB set title='"&charTitle&"', contents='"&charContents&"' where num="&num&";"
            Rs.Open SQL, Db, 3, 2
            
            sub go_to(url)
                response.write "<script>"
                response.write "window.location.href='"&url&"';"
                response.write "</script>"
                response.end                
            End Sub
            go_to "show_table.asp?num="&num
            Rs.close
            Db.close
        %>
