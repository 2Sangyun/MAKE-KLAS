<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notice_write.aspx.cs" Inherits="WebApplication1.notice_write" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        #MenuBtn {
            width : 115px;
            height : 45px;
            position: relative;
            margin-left: 20px;
            margin-top : 10px;
            border-color : white;
            color : white;
            font-weight : bold;
            background-color : #3a051f;
            cursor : pointer;
        }

        #logoutBtn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            width: 80px;
            height: 55px;
            color : white;
            float : right;
            margin-right : 45px;
            margin-top : 10px;
            font-weight : bold;
            text-align : center;
            background-color : #3a051f;
            cursor : pointer;
        }

        #student_informationBtn {
            width : 140px;
            height : 55px;
            float : right;
            border : none;
            color : white;
            font-weight : bold;
            text-align : center;
            background-color : #3a051f;
            cursor : pointer;
            margin-top : 10px;
            margin-right : 10px;
        }

        #mainBtn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            float : left;
            text-align : center;
            background-color : #3a051f;
            cursor : pointer;
            color : white;
            font-weight : 800;
            font-size : 32px;
            font-family : 'Times New Roman';
        }
        #d_main {
            width : auto;
            height : 75px;
            background-color : #3a051f;
        }
        .navbar {
            overflow: hidden;
            background-color: #333;
            font-family: Arial, Helvetica, sans-serif;
        }

        .navbar a {
          float: left;
          font-size: 10px;
          color: white;
          text-align: center;
          padding: 14px 16px;
          text-decoration: none;
        }

        .dropdown {
          float: left;
          overflow: hidden;
        }

        .dropdown .dropbtn {
          font-size: 16px;  
          border-color : white;
          outline: none;
          color: white;
          width : 95px;
          height : 55px;
          background-color: inherit;
          margin-left: 20px;
          margin-top : 10px;
          font: inherit;
        }

        .navbar a:hover, .dropdown:hover .dropbtn {
          background-color: #3a051f;
        }

        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #ccc;
          width: 100%;
          left: 0;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          z-index: 1;
        }

        .dropdown-content .header {
          padding: 15px;
        }

        .dropdown:hover .dropdown-content {
          display: block;
        }

        /* Create three equal columns that floats next to each other */
        .column {
          float: left;
          width: 22.5%;
          padding: 10px;
          background-color: #ccc;
          height: 250px;
        }

        .column a {
          float: none;
          color: black;
          padding: 8px;
          text-decoration: none;
          display: block;
          text-align: left;
        }

        .column a:hover {
          background-color: #ddd;
        }

        /* Clear floats after the columns */
        .row:after {
          content: "";
          display: table;
          clear: both;
        }

        #d_classname {
            width : auto;
            height : 50px;
            background-color : #b10058;
        }

        #d_writenotice {
            width : 90%;
            height : 450px;
            padding : 5%;

        }

        #Button_Class {
            width : auto;
            height : 50px;
            margin-left : 5%;
            vertical-align : middle;
            font-size : 18px;
            color : white;
            font-weight : 700;
            background-color : #b10058;
            border : none;
            cursor : pointer;
        }

        #txtTitle {
            margin-left : 2%;
            width : 85%;
            height : 15px;
        }

        #txtContent {
            margin-left : 2%;
            }

        #d_bottom {
            margin-top : 20px;
            width : 90%;
            height : 35px;
            padding : 5%;
            
        }

        #btnWrite {
            width : 60px;
            height : 30px;
            float : right;
            margin-right : 20px;
        }

        #btnCancel {
            width : 60px;
            height : 30px;
            float : right;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="d_main">
            <asp:Button ID="mainBtn" runat="server" Text="KLAS" Height="75px" Width="200px" OnClick="mainBtn_Click"/>

            <div class="dropdown">
                <button class="dropbtn">Menu
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <div class="header">
                    </div>   
                <div class="row">
                    <div class="column">
                        <h3>대학생활</h3>
                        <a href="#">수업시간표</a>
                        <a href="#">출석관리(KW출첵)</a>
                        <a href="#">강의계획서 조회</a>
                    </div>
                    <div class="column">
                        <h3>강의종합정보</h3>
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                    <div class="column">
                      <h3>공학교육</h3>
                      <a href="#">Link 1</a>
                      <a href="#">Link 2</a>
                      <a href="#">Link 3</a>
                    </div>
                    <div class="column">
                      <h3>학사 서비스</h3>
                      <a href="#">Link 1</a>
                      <a href="#">Link 2</a>
                      <a href="#">Link 3</a>
                    </div>
               </div>
               </div>
            </div> 
            <asp:Button ID="logoutBtn" runat="server" Text="Logout =>" OnClick="logoutBtn_Click"  />
            <asp:Button ID="student_informationBtn" runat="server" Text="학생_정보(default)"  />

        </div>

        <div id="d_classname">
            <asp:Button ID="Button_Class" runat="server" Text="강의 공지사항" />
        </div>

        <div id="d_writenotice">                
            <div>
                제목 :
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox><br />
            </div>
            <div style="margin-top : 30px;">                
            </div> 
            <div style ="width : 90%; height :max-content;">
                <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Columns="20" Rows="5" Height="400px" Width="688px">공지사항을 입력하세요.</asp:TextBox><br />
            </div>
        </div>

        <div id="d_bottom">
            <asp:Button ID="btnCancel" runat="server" Text="리스트" onclick="btnCancel_Click" />
            <asp:Button ID="btnWrite" runat="server" Text="저장" onclick="btnWrite_Click" /> &nbsp <br />           
        </div>
    </form>
</body>
</html>
