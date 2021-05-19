<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login2.aspx.cs" Inherits="WebApplication1.login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            height: 581px;
        }
    </style>
</head>
<body style="height: 600px">
    <form id="form1" runat="server">
        
        <asp:Panel runat="server" ID="pnl1" BackColor="#CCCCCC" Height="212px">
            <asp:Label ID="Label1" runat="server">
                <pre>1. 인증수단 (<strong>휴대폰번호</strong> 또는 <strong>E-mail</strong>)을 선택하세요.
                    <br />2. 사용자구분, 개인번호, 성명, 생년월일, 인증수단 정보를 입력 후
                    <br />   <strong>[다음]</strong> 버튼을 누르면 선택하신 인증수단으로 임시 비밀번호가
                    <br />   발송됩니다.
                    <br />3. 임시 비밀번호로 로그인 후 <strong>비밀번호를 변경</strong>하셔야 정상적으로
                    <br />   이용 가능합니다.
                </pre>
            </asp:Label>

            

            <asp:Table ID="Table1" runat="server" BorderColor="#CCCCCC" Height="231px" Width="411px" BorderStyle="Solid" BorderWidth="1px">
                <asp:TableRow runat="server" BorderColor="#CCCCCC" BorderStyle="Solid">
                    <asp:TableCell runat="server" BackColor="#CCCCCC">인증수단 *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:RadioButton ID="RadioButton1" runat="server" />
휴대폰번호
                        <asp:RadioButton ID="RadioButton2" runat="server" />
E-mail
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server" BorderColor="Black" BorderStyle="Solid">
                    <asp:TableCell runat="server">사용자구분 *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:DropDownList ID="DropDownList1" runat="server"><asp:ListItem>학부생</asp:ListItem>
<asp:ListItem>교수</asp:ListItem>
<asp:ListItem>직원</asp:ListItem>
<asp:ListItem>강사</asp:ListItem>
<asp:ListItem>조교</asp:ListItem>
<asp:ListItem>사환</asp:ListItem>
<asp:ListItem>일반대학원</asp:ListItem>
<asp:ListItem>경영대학원</asp:ListItem>
<asp:ListItem>스마트융합대학원</asp:ListItem>
<asp:ListItem>교육대학원</asp:ListItem>
<asp:ListItem>상담복지정책대학원</asp:ListItem>
<asp:ListItem>환경대학원</asp:ListItem>
<asp:ListItem>건설법무대학원</asp:ListItem>
<asp:ListItem>타교생(학부)</asp:ListItem>
<asp:ListItem>타교생(대학원)</asp:ListItem>
</asp:DropDownList>
</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">개인번호(학번) *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">성명 *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
</asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">생년월일 *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="TextBox3" runat="server" Width ="100"></asp:TextBox> 예시)19981231
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow runat="server">
                    <asp:TableCell runat="server">휴대폰번호 *</asp:TableCell>
                    <asp:TableCell runat="server"><asp:TextBox ID="TextBox4" runat="server" Width ="100"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text="Label"> 예시) 01012345678</asp:Label>
</asp:TableCell>
                </asp:TableRow>
            </asp:Table>

            
        </asp:Panel>
    </form>
</body>
</html>