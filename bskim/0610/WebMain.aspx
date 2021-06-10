<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebMain.aspx.cs" Inherits="LoginKlas.WebMain" %>

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

        #tablesch {
            width : 99%;
            height : 350px;
            border : dimgray;
            border-collapse : collapse;
            text-align : center;
            line-height : 1.5;
        }

        #ProfSch {
            width : 90%;
            height : 100px;
            border : gray;
            border-collapse : collapse;
            text-align : center;
            float : left;
            margin-left : 10px;
            border-color : black; 
        }

        #ListBox {
            width : 100px;
            height : auto;
            
        }

        #d_main {
            width : auto;
            height : 75px;
            background-color : #3a051f;
        }

        #d1 {
            width : 200px;
            height : 30px;
            margin : 0 auto;
        }

        #d2 {
            width : auto;
            height : 35px;
            margin : 0 auto;
            text-align : center;
            vertical-align : middle;
        }

        #d_timetable {
            width : 100%;
            height : auto;
            border-color : dimgray;
            margin-top : 30px;
        }

        #d_subject {
            width : auto;
            height : auto;
            margin : 0 auto;
            margin-top : 15px;
            background-color : gray;
        }

        #d_calendar {
            width : auto;
            height : auto;
            margin : 0 auto;
            margin-top : 15px;
            background-color : gray;
        }

        #s1 {
            width : 250px;
            height : 20px;
            margin : 10px;
            text-align : left;
        }

        #s2 {
            width : auto;
            height : 50px;
            margin : 10px;
        }

        #s2_text {
            width : 150px;
            height : 50px;
            margin : 0 auto;
            font-size : 16px;
            font-weight : 700;
        }

        #s2_textm {
            width : 150px;
            height : 50px;
            margin : 0 auto;
            font-size : 12px;
        }

        #s2_button_1 {
            width : 150px;
            height : 30px;
            background-color : teal;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : white;
            vertical-align : middle;
        }

        #s2_button_2 {
            width : 150px;
            height : 30px;
            background-color : indigo;
            border : none;
            border-radius : 5px;
            cursor : pointer;
            font-weight : 700;
            color : white;
            vertical-align : middle;
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
            
        <div id = "d_timetable">
            <div id="d1">
                <asp:DropDownList ID="DropDownList1" runat="server" Height="30px" style="margin-left: 0px" Width="125px">
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text="시간표" Font-Size="16px"  ></asp:Label>
            </div>
            <div id="d2">
                

                <asp:Label ID="Label2" runat="server" Text= "NowTime()" ></asp:Label>
                
            </div>
            <asp:Table ID="tablesch" runat="server" HorizontalAlign="Center" GridLines="Both">
            <asp:TableRow ID="Row1" runat="server" Height="15px">
                <asp:TableCell ID="TableCell1" runat="server" Width="20">
                    /
                </asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server">
                    월
                </asp:TableCell>
                <asp:TableCell ID="TableCell3" runat="server">
                    화
                </asp:TableCell>
                <asp:TableCell ID="TableCell4" runat="server">
                    수
                </asp:TableCell>
                <asp:TableCell ID="TableCell5" runat="server">
                    목
                </asp:TableCell>
                <asp:TableCell ID="TableCell6" runat="server">
                    금
                </asp:TableCell>
                <asp:TableCell ID="TableCell7" runat="server">
                    토
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row2" runat="server" Height="50px">
                <asp:TableCell ID="TableCell8" runat="server">0</asp:TableCell>
                <asp:TableCell ID="TableCell9" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell10" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell11" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell12" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell13" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell14" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row3" runat="server" Height="50px">
                <asp:TableCell ID="TableCell15" runat="server">1</asp:TableCell>
                <asp:TableCell ID="TableCell16" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell17" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell18" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell19" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell20" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell21" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row4" runat="server" Height="50px">
                <asp:TableCell ID="TableCell22" runat="server">2</asp:TableCell>
                <asp:TableCell ID="TableCell23" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell24" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell25" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell26" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell27" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell28" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row5" runat="server" Height="50px">
                <asp:TableCell ID="TableCell29" runat="server">3</asp:TableCell>
                <asp:TableCell ID="TableCell30" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell31" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell32" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell33" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell34" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell35" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row6" runat="server" Height="50px">
                <asp:TableCell ID="TableCell36" runat="server">4</asp:TableCell>
                <asp:TableCell ID="TableCell37" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell38" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell39" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell40" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell41" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell42" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row7" runat="server" Height="50px">
                <asp:TableCell ID="TableCell43" runat="server">5</asp:TableCell>
                <asp:TableCell ID="TableCell44" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell45" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell46" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell47" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell48" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell49" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row8" runat="server" Height="50px">
                <asp:TableCell ID="TableCell50" runat="server">6</asp:TableCell>
                <asp:TableCell ID="TableCell51" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell52" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell53" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell54" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell55" runat="server"></asp:TableCell>
                <asp:TableCell ID="TableCell56" runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        </div>

        <div id="d_subject">
            <div id="s1">                
                <asp:Label vertical-align="middle" runat="server" Text="수강과목 (1)" ></asp:Label>
            </div>
            <hr />
            <div id="s2">
                <table border="0" width="100%">
                    <tr>
                        <td>
                            <asp:Label ID="s2_text" runat="server" Text="강의1"></asp:Label>
                        <br />
                        <asp:Label ID="s2_textm" runat="server" Text="교수1  강의실1"></asp:Label>
                        </td>
                        <td align="right">
                            <asp:Button ID="s2_button_1" runat="server" Text="공지사항" OnClick="s2_button_1_Click"/>
                            <asp:Button ID="s2_button_2" runat="server" Text="강의자료실" OnClick="s2_button_2_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div id="d_calendar">
            <asp:Calendar ID="Calendars" runat="server" BackColor="White" BorderColor="White" 
                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" 
                ForeColor="Black" NextMonthText=">" PrevMonthText="<" 
                ShowGridLines="false" Height="300px" Width="800px">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="true" />
                <SelectorStyle BackColor="#FFCC66" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#d7d7d7" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#d85697" Font-Bold="true" Height="1px" ForeColor="White" />
                
            </asp:Calendar>
        </div>

        <div style="border-style: solid; border-width: 1px; height: 200px; margin-top : 30px; margin-bottom : 80px;" >
            <h6>

            </h6>
            <h3 style="margin-left: 10px;">
                책임지도교수
            </h3>
            <asp:Table ID="ProfSch" runat="server" GridLines="Both">
                <asp:TableRow runat="server">
                    <asp:TableCell>
                        성명
                    </asp:TableCell>
                    <asp:TableCell>
                        Prof.Name;
                    </asp:TableCell>
                    <asp:TableCell>
                        전화번호
                    </asp:TableCell>
                    <asp:TableCell>
                        Prof.Number;
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
                        연구실위치
                    </asp:TableCell>
                    <asp:TableCell>
                        Prof.Lab;
                    </asp:TableCell>
                    <asp:TableCell>
                        이메일
                    </asp:TableCell>
                    <asp:TableCell>
                        Prof.email;
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell>
                        상담시간
                    </asp:TableCell>
                    <asp:TableCell>
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        홈페이지
                    </asp:TableCell>
                    <asp:TableCell>
                        
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
        </form>
</body>
</html>
