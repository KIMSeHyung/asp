<% 
    dim Db, conn
    dim SQL
    
    dim uId, uPwd, uTitle, uContents
    dim mDate
    mDate = Date()

    uId = Request.form("User_id")
    uPwd = Request.form("User_pwd")
    uTitle = Request.form("User_title")
    uContents = Request.form("User_Contents")

    Set Db = Server.CreateObject("ADODB.Connection")
    Conn = "Provider=SQLOLEDB;Password=kimse;User ID=kimse;Initial Catalog=kims;Data Source=(LOCAL)"
    Db.Open Conn
    Set Rs = Server.CreateObject("ADODB.RecordSet")

    SQL = "insert into bDB(id, pwd, title, contents, mdate) values('" &uId&"','"&uPwd&"', '"&uTitle&"', '"&uContents&"', '"&mDate&"')"

    Rs.Open SQL, Db, 3, 2
    
    
    sub insert_and_go_to(msg,url)
    response.write "<script>"
    response.write "alert('"&msg&"');"
    response.write "window.location.href='"&url&"';"
    response.write "</script>"
    response.end
    end sub
    insert_and_go_to "Success","index.asp"    
    Rs.close
    Db.close
%>