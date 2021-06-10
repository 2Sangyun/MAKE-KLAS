<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="material_list.aspx.cs" Inherits="WebApplication1.material_list" EnableSessionState="True" %>

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

        #Button_material{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
        }
        #Button_notice{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
        }
        #Button_hw{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
        }
        #Button_timetable{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
        }
        #Button_kw{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
        }#Button_lecture_plan{
            width : 150px;
            height : 30px;
            background-color : lightgray;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : black;
            vertical-align : middle;
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

        #btnWrite{
            position: relative;
            left:50%;
        }

    </style>
</head>
<body style="height: 368px">
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
                        <asp:Button ID="Button_timetable" runat="server" Text="수업시간표"/>
                        <a href="#"></a>
                        <asp:Button ID="Button_kw" runat="server" Text="출석관리(KW출첵)"/>
                        <a href="#"></a>
                        <asp:Button ID="Button_lecture_plan" runat="server" Text="강의계획서 조회"/>
                    </div>
                    <div class="column">
                        <h3>강의종합정보</h3>
                        <asp:Button ID="Button_material" runat="server" Text="강의자료실" OnClick="goMaterialList"/>
                        <a href="#"></a>
                        <asp:Button ID="Button_notice" runat="server" Text="공지사항" OnClick="goNoticeList"/>
                        <a href="#"></a>
                        <asp:Button ID="Button_hw" runat="server" Text="과제 제출" OnClick="goHWList"/>
                    </div>
                    
               </div>
               </div>
            </div> 
            <asp:Button ID="logoutBtn" runat="server" Text="Logout =>" OnClick="logoutBtn_Click"  />
            <asp:Button ID="student_informationBtn" runat="server" Text="학생_정보(default)"  />

        </div>

        <div style="height: 253px">
            게시판 리스트
        <asp:GridView ID="ctlBasicList" runat="server"
            AutoGenerateColumns="false"
             BorderWidth="10px" CellPadding="5" BorderStyle="None" HorizontalAlign="Center">
            
            <FooterStyle BackColor="#CCCCCC" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#CCCCCC" Font-Bold="True" ForeColor="Black" />
            
            
            <Columns>
                <asp:BoundField HeaderText="번호" DataField="notice_id"  />
               
                <asp:HyperLinkField HeaderText ="제목"
                         DataNavigateUrlFields ="title, course_id, notice_id"
                         DataNavigateUrlFormatString="notice_show.aspx?course_id={1}&notice_id={2}"
                         DataTextField="Title"
                         ItemStyle-Width ="350px" />
             
                <asp:BoundField HeaderText="작성자" DataField="writer_id" />
                <asp:BoundField HeaderText="작성일" DataField="date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField HeaderText="조회수" DataField="hits" />
            </Columns>
        </asp:GridView>
             <asp:DropDownList 
                ID="DropDownList1" 
                runat="server" 
                OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" 
                AutoPostBack="True">
                <asp:ListItem Value="0"></asp:ListItem>
                <asp:ListItem Value="1"></asp:ListItem>
                <asp:ListItem Value="2"></asp:ListItem>
                <asp:ListItem Value="3"></asp:ListItem>
                <asp:ListItem Value="4"></asp:ListItem>
                <asp:ListItem Value="5"></asp:ListItem>
                <asp:ListItem Value="6"></asp:ListItem>
                <asp:ListItem Value="7"></asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnWrite" runat="server" Text="작성" Width="57px" OnClick="btnWrite_Click" />
        </div>
   
        <p>
            &nbsp;</p>
   
    </form>
</body>
</html>
