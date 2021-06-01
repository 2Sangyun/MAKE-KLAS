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
            position: relative;
            margin-left: 245px;
            border : none;
            background-color: #992626;
            color : gray;
            font-weight : bold;
            text-align : center;
        }

        #logoutBtn {
            width : 80px;
            height : 45px;
            position : relative;
            margin-left : -5px;
            border : none;
            background-color : #992626;
            color : gray;
            font-weight : bold;
            text-align : center;
        }

        #imgBtn {
            width : 120px;
            height : 55px;
            background : url("logo.png") no-repeat;
            border : none;
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
            <asp:Button ID="logoutBtn" runat="server" Text="Logout-&gt;" />
        </p>
        <asp:ListBox ID="ListBox1" runat="server" style="margin-left: 289px">
            <asp:ListItem Selected="True">2021년 1학기</asp:ListItem>
            <asp:ListItem>2021년 2학기</asp:ListItem>
            <asp:ListItem>2022년 1학기</asp:ListItem>
            <asp:ListItem>2022년 2학기</asp:ListItem>
        </asp:ListBox>
        <asp:Label ID="Label1" runat="server" Text="시간표"></asp:Label>
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
        <asp:TextBox ID="TextBox2" runat="server" Height="173px" style="margin-top: 19px" Width="781px">수강과목</asp:TextBox>
        <asp:TextBox ID="TextBox3" runat="server" Height="173px" style="margin-top: 40px" Width="777px">Notice</asp:TextBox>
        <asp:TextBox ID="TextBox4" runat="server" Height="184px" style="margin-top: 38px" Width="779px">책임지도교수</asp:TextBox>
    </form>
</body>
</html>
