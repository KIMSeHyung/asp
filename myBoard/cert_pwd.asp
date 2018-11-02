<%

    dim num, pwd, mCase
    pwd = Request.Form("pwd")
    num = Request.Form("num")
    mCase = Request.Form("case")
    Response.Write pwd
    Response.Write num
    Response.Write mCase
   
    Set Db = Server.CreateObject("ADODB.Connection")
    Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
    Db.Open Conn
    Set Rs = Server.CreateObject("ADODB.RecordSet")
    SQL = "select pwd from bDB where num="&num&";"
    Rs.Open SQL, Db, 3, 1
    password = Rs("pwd")
    Rs.Close

  
    sub go_to(msg,url)
    response.write "<script>"
    response.write "alert('"&msg&"');"
    response.write "window.location.href='"&url&"';"
    response.write "</script>"
    response.end
    end sub
    
    
    sub cert_pwd(mCase, pwd, password)
    Select Case mCase
        Case "d"
            if pwd = password then
            Rs.Open "delete from bDB where num="&num&";", Db, 3, 2
            go_to "success", "index.asp"
            else
            go_to "fail", "show_table.asp?num="&num
            end if
        Case "m"
            if pwd = password then
            go_to "success", "modified_view.asp?num="&num
            else
            go_to "fail", "show_table.asp?num="&num
            end if
        Case else
            go_to "error", "index.asp"
    End Select
    end sub

    cert_pwd mCase, pwd, password
    


    Rs.Close
    Db.Close

%>