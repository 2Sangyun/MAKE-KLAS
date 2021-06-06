<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="LoginKlas.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style> 
        #login{
        position: absolute;
        width : 100%;
        left : 9%;
        margin-left: -150px;
        top: 35px;
        height : 100%;
    }
    #IdBox{
        width : 250px;
        height : 30px;
        position:relative;
        left:50%;
        margin-left: -125px;
        top : 100px;
        border-radius : 20px;
        border: none;
        background-color : #d1eef8;
        
    }
    #PwBox{
        width : 250px;
        height : 30px;
        position: relative;
        left:50%;
        margin-left: -125px;
        top : 100px;
        border-radius : 20px;
        border: none;
        background-color : #d1eef8
    }
    #LoginBtn{
        width : 250px;
        height : 30px;
        position: relative;
        left:50%;
        margin-left: -125px;
        top : 100px;
        background-color : #992626;
        border-radius : 20px;
        color : white;
        font-weight : bold;
    }
    #CheckBox{
        left : 50%;
        margin-left: -125px;
        position: relative;
        top : 100px;
        
    }
    #Label1{
        position: relative;
        left : 50%;
        top : 100px;
        font-size : 13px;
        font-weight : bold;
        color : white;
    }
    #FindPwBtn{
        border-style: none;
        position: relative;
        border-color: inherit;
        border-width: medium;
        width : 120px;
        height : 30px;
        
        left: 50%;
        margin-left : 40px;
        top : 100px;
        border-radius : 5px;
        background-color : #7d7777;
        font-size : 13px;
        font-weight : bold;
        color : white;
    }
    #PersonalNumBtn{
        width : 120px;
        height : 30px;
        position: relative;
        left: 50%;
        margin-left : -125px;
        top : 100px;
        border-radius : 5px;
        border: none;
        background-color : #7d7777;
        font-size : 13px;
        font-weight : bold;
        color : white;
    }
    #RegisterPwBtn{
        width : 120px;
        height : 30px;
        position: relative;
        left : 50%;
        margin-left : 7px;
        top : 100px;
        border-radius : 5px;
        border: none;
        background-color : #7d7777;
        font-size : 13px;
        font-weight : bold;
        color : white;
    }
    #PnlPasswd{
        width : 500px;
        height :500px;
        position: absolute;
        left : 50%;
        top: 100px;
        margin-left : -250px;
    }
    #PnlPasswdBar{
        width : 500px;
        height :50px;
        position: absolute;
        left : 50%;
        top: 0px;
        margin-left : -250px;
    }
    #LblPasswd{
        position: absolute;
        left: 10px;
        top:10px;
    }
    #BtnExit1{
        position: relative;
        left : 450px;
        width : 50px;
        height : 50px;
        top: 0px;
    }
    #PnlFindNumber{
        width : 500px;
        height :500px;
        position: absolute;
        left : 50%;
        top: 100px;
        margin-left : -250px;
    }
    #PnlFindNumberBar{
        width : 500px;
        height :30px;
        position: absolute;
        left : 50%;
        top: 0px;
        margin-left : -250px;
    }
    #BtnExit2{
        position: relative;
        left : 480px;
        width : 14px;
            top: 0px;
        }
    #PnlRegisterPw{
        width : 500px;
        height :500px;
        position: absolute;
        left : 50%;
        top: 100px;
        margin-left : -250px;
    }
    #PnlRegisterPwBar{
        width : 500px;
        height :30px;
        position: absolute;
        left : 50%;
        top: 0px;
        margin-left : -250px;
    }
    #BtnExit3{
        position: relative;
        left : 480px;
        width : 14px;
            top: 0px;
        }
    </style>
    <script>

</script>

</head>
<body bgcolor ="lightgray">
    <form id="form1" runat="server">
        
        
        <div id ="login" >
            <asp:TextBox ID="IdBox" runat="server"></asp:TextBox>
            <p></p>
            <asp:TextBox ID="PwBox" runat="server"></asp:TextBox>
            <p></p>
            <asp:Button ID="LoginBtn" runat="server" Text="로그인" OnClick="LoginBtn_Click" />
            <p></p>
            <asp:CheckBox ID="CheckBox" runat="server" />
            <asp:Label ID="Label1" runat="server" Text="아이디저장"></asp:Label>
            <asp:Button ID="FindPwBtn" runat="server" Text="비밀번호 찾기" OnClick="FindPwBtn_Click"/>
            <p></p>
            <asp:Button ID="PersonalNumBtn" runat="server" Text="개인번호 조회" OnClick="PersonalNumBtn_Click" />
            <asp:Button ID="RegisterPwBtn" runat="server" Text="비밀번호 최초 등록" OnClick="RegisterPwBtn_Click" />

            <asp:Panel ID="PnlPasswd" runat="server" BackColor="White" Height="457px" Visible="False">
                <asp:Panel ID="PnlPasswdBar" runat="server" BackColor="#CCCCCC">
                    <asp:Label ID="LblPasswd" runat="server" Text="비밀번호 찾기"></asp:Label>
                    <asp:Button ID="BtnExit1" runat="server" Text="X" OnClick="BtnExit1_Click" BorderStyle="None" BackColor="#CCCCCC" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="PnlFindNumber" runat="server" BackColor="White" Height="457px" Visible="False">
                <asp:Panel ID="PnlFindNumberBar" runat="server" BackColor="#CCCCCC">
                    <asp:Button ID="BtnExit2" runat="server" Text="X" OnClick="BtnExit2_Click" BorderStyle="None" BackColor="#CCCCCC" />
                </asp:Panel>
            </asp:Panel>

            <asp:Panel ID="PnlRegisterPw" runat="server" BackColor="White" Height="457px" Visible="False">
                <asp:Panel ID="PnlRegisterPwBar" runat="server" BackColor="#CCCCCC">
                    <asp:Button ID="BtnExit3" runat="server" Text="X" OnClick="BtnExit3_Click" BorderStyle="None" BackColor="#CCCCCC" />
                </asp:Panel>
            </asp:Panel>
            
        </div>
        
        
        
    </form>
</body>
</html>