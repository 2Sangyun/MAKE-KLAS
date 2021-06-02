<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notice_show.aspx.cs" Inherits="WebApplication1.notice_show" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

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

        #lblTitle {
            margin-top : 25px;
            width : 90%;
            height : 20px;
            font-family : 'Hanna', sans-serif;
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

        #d_classname {
            width : auto;
            height : 50px;
            background-color : #b10058;
        }

        #d_container {
            width : 90%;
            height : 600px;
            margin-left : 5%;
            border : 1px solid gray;
            padding : 2%;
        }

        #d_title {
            width : auto;
            height : 25px;
            
        }

        #d_subtitle {
            display : inline-block;
            width : 100%;
            height : 75px;
            padding : 5px;
        }

        .subtitle1 {
            width : auto;
            height : 40px;
            color : dimgray;
            float : left;
            margin : 20px 0px;
        }

        .subtitle2 {
            width : auto;
            height : 30px;
            color : dimgray;
            float : right;
            margin : 20px 0px;
        }

        .subtitle3 {
            width : auto;
            height : 30px;
            color : dimgray;
            float : right;
            margin : 20px 0px;
        }

        #d_content {
            width : 95%;
            height : 465px;
            margin-top : 10px;
            padding : 10px;
            font-size : 12.5px;
            font-family : 'Hanna' , sans-serif;
        }

        #d_bottom {
            width : 90%;
            height : 30px;
            margin-top : 15px;
            margin-left : 5%;
            padding : 15px;
        }

        #btnModify {
            width : 80px;
            height : 30px;
            border : 1px solid gray;
        }

        #btnDelete {
            width : 80px;
            height : 30px;
            border : 1px solid gray;
            margin-left : 80px;
        }

        #btnList {
            width : 80px;
            height : 30px;
            border : 1px solid gray;
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

        <div id="d_container">
            <div id="d_title">
                <asp:Label ID="lblTitle" runat="server" ForeColor="Red"></asp:Label>
            </div>

            <div id="d_subtitle">
                <div class="subtitle1">
                     이름 : <asp:Label ID="lblName" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="subtitle2">                    
                    조회수 : <asp:Label ID="lblReadCount" runat="server" ForeColor="Red"></asp:Label>
                </div>
                <div class="subtitle3">
                     작성일 : <asp:Label ID="lblPostDate" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>

            <div id = "d_content">
                <asp:Label ID="lblContent" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>

        <div id="d_bottom">           
            <asp:Button ID="btnModify" runat="server" Text="수정" onclick="btnModify_Click" />
            <asp:Button ID="btnDelete" runat="server" Text="삭제" onclick="btnDelete_Click" />&nbsp
            <asp:Button ID="btnList" runat="server" Text="목록" onclick="btnList_Click" />&nbsp
        </div>
    </form>
</body>
</html>
