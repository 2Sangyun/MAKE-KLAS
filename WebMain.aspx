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
            margin-left: 30px;
            background-color : #992626;
            border-color : white;
            color : white;
            font-weight : bold;
        }

        #student_informationBtn {
            width: 140px;
            height: 45px;
            border : none;
            background-color: #992626;
            color : gray;
            font-weight : bold;
            text-align : center;
            margin-left : -5px;
            position : 
        }

        #logoutBtn {
            width : 80px;
            height : 45px;
            float : right;
            border : none;
            background-color : none;
            color : gray;
            font-weight : bold;
            text-align : center;
        }

        #imgBtn {
            width : 120px;
            height : 55px;
            background : url("logo.png") no-repeat;
            border : none;
            float : left;
        }

        #tablesch {
            width : 750px;
            height : 350px;
            border : dimgray;
            border-collapse : collapse;
            text-align : center;
            line-height : 1.5;
        }

        #ListBox {
            width : 100px;
            height : auto;
            
        }

        #d1 {
            width : 200px;
            height : 20px;
            margin : 0 auto;
        }

        #d_timetable {
            width : auto;
            height : auto;
            border-color : dimgray;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Main Page</div>
        <p style =" background-color: #992626";>
            <asp:ImageButton ID="ImgBtn" runat="server" />
            <asp:Button ID="MenuBtn" runat="server" Text="Menu" />
            <asp:Button ID="student_informationBtn" runat="server" Text="학생_정보(default)" />
            <asp:Button ID="logoutBtn" runat="server" Text="Logout-&gt;"  />
        </p>
        <div id = "d_timetable">
            <div id="d1">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="15px" style="margin-left: 0px" Width="125px">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
        </asp:DropDownList>
                <asp:Label ID="Label1" runat="server" Text="시간표" Font-Size="16px"  ></asp:Label>
        </div>
            <asp:Table ID="tablesch" runat="server" HorizontalAlign="Center" GridLines="Both">
            <asp:TableRow ID="Row1" runat="server" Height="50px">
                <asp:TableCell ID="TableCell1" runat="server">
                    \
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
                <asp:TableCell ID="TableCell8" runat="server">
                    0교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell9" runat="server">
                    2행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell10" runat="server">
                    2행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell11" runat="server">
                    2행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell12" runat="server">
                    2행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell13" runat="server">
                    2행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell14" runat="server">
                    2행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row3" runat="server" Height="50px">
                <asp:TableCell ID="TableCell15" runat="server">
                    1교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell16" runat="server">
                    3행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell17" runat="server">
                    3행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell18" runat="server">
                    3행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell19" runat="server">
                    3행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell20" runat="server">
                    3행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell21" runat="server">
                    3행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row4" runat="server" Height="50px">
                <asp:TableCell ID="TableCell22" runat="server">
                    2교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell23" runat="server">
                    4행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell24" runat="server">
                    4행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell25" runat="server">
                    4행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell26" runat="server">
                    4행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell27" runat="server">
                    4행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell28" runat="server">
                    4행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row5" runat="server" Height="50px">
                <asp:TableCell ID="TableCell29" runat="server">
                    3교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell30" runat="server">
                    5행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell31" runat="server">
                    5행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell32" runat="server">
                    5행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell33" runat="server">
                    5행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell34" runat="server">
                    5행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell35" runat="server">
                    5행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row6" runat="server" Height="50px">
                <asp:TableCell ID="TableCell36" runat="server">
                    4교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell37" runat="server">
                    6행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell38" runat="server">
                    6행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell39" runat="server">
                    6행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell40" runat="server">
                    6행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell41" runat="server">
                    6행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell42" runat="server">
                    6행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row7" runat="server" Height="50px">
                <asp:TableCell ID="TableCell43" runat="server">
                    5교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell44" runat="server">
                    7행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell45" runat="server">
                    7행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell46" runat="server">
                    7행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell47" runat="server">
                    7행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell48" runat="server">
                    7행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell49" runat="server">
                    7행7열
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="Row8" runat="server" Height="50px">
                <asp:TableCell ID="TableCell50" runat="server">
                    6교시
                </asp:TableCell>
                <asp:TableCell ID="TableCell51" runat="server">
                    8행2열
                </asp:TableCell>
                <asp:TableCell ID="TableCell52" runat="server">
                    8행3열
                </asp:TableCell>
                <asp:TableCell ID="TableCell53" runat="server">
                    8행4열
                </asp:TableCell>
                <asp:TableCell ID="TableCell54" runat="server">
                    8행5열
                </asp:TableCell>
                <asp:TableCell ID="TableCell55" runat="server">
                    8행6열
                </asp:TableCell>
                <asp:TableCell ID="TableCell56" runat="server">
                    8행7열
                </asp:TableCell>
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
                            <asp:Button ID="s2_button_1" runat="server" Text="공지사항"/>
                            <asp:Button ID="s2_button_2" runat="server" Text="강의자료실"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div id="d_calendar">
            <asp:Calendar ID="Calendars" runat="server" BackColor="White" BorderColor="White" 
                BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" 
                ForeColor="Black" Height="310px" NextMonthText=">" PrevMonthText="<" 
                ShowGridLines="false" Width="607px">
                <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="true" />
                <SelectorStyle BackColor="#FFCC66" />
                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#d7d7d7" />
                <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                <DayHeaderStyle BackColor="#d85697" Font-Bold="true" Height="1px" ForeColor="White" />
                
            </asp:Calendar>
        </div>
        <asp:TextBox ID="TextBox3" runat="server" Height="173px" style="margin-top: 40px" Width="777px">Notice</asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" Height="184px" style="margin-top: 38px" Width="779px">책임지도교수</asp:TextBox>
    </form>
</body>
</html>
