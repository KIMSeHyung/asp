<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>게시판</title>
    <style>
        .out{
            width: 100%;
            text-align: left;
            margin-left: 15%;
        }
        #Utitle{
            width: 1000px;
        }
        #uContents{
            width: 1000px;
            height: 500px;
            margin-left: 35px;
            text-align: start;
        }
        .buttons{
            text-align: center;
        }
    </style>
</head>
<body>
    <form action="insert_table.asp" method="POST">
        <div class="out">
            <div>
                <p>ID <input id="uId" name="User_id" type="text"></p>           
                <p>password <input id="pwd" name="User_pwd" type="password" maxlength="10"></p>
                <p>Title <input id="Utitle" name="User_title" type="text"></p>
                <p><textarea style="resize: none;" id="uContents" name="User_Contents"></textarea></p>
            </div>
        </div>
        
        <div class="buttons">
                <input id="submit" type="submit" value="등록">
                <input id="cancle" type="reset" value="취소" onclick="location.href='index.asp'">
            </div>

    </form>
</body>
</html>