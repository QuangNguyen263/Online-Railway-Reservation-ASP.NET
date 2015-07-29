<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Desktop_Admin_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1  style="text-align: center; ">SIGN IN</h1>
        </div>
        <div style="text-align: center;">
            <p style="padding-bottom: 10px; font-weight: bold">USERNAME:</p>
            <p>
                <asp:TextBox runat="server" CssClass="typetext2" Width="250px" ID="txtusername" />

            </p>
            <p style="padding-bottom: 10px; padding-top: 20px; font-weight: bold">PASSWORD:</p>
            <p>
                <asp:TextBox runat="server" CssClass="typetext2" Width="250px"  id="txtpass" TextMode="Password"/>
            </p>
            <p style="padding-top: 20px">
                <asp:Button Text="Submit" runat="server" CssClass="btnSimple" id="btnlogin" OnClick="btnlogin_Click"/></p>
            <p style="text-align:center">
                <asp:HyperLink NavigateUrl="Forget_pass.aspx" runat="server" Text="Forget Password?"/>
            </p>
        </div>

    </div>
</asp:Content>

