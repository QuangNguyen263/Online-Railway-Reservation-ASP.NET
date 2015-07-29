<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Forget_pass.aspx.cs" Inherits="Desktop_Admin_Forget_pass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1  style="text-align: center; ">FORGET PASSWORD</h1>
        </div>
        <div style="text-align: center;">
            <p style="padding-bottom: 10px; font-weight: bold">USERNAME:</p>
            <p>
                <asp:TextBox runat="server" CssClass="typetext2" Width="250px" ID="txtusername" />

            </p>
            <p style="padding-bottom: 10px; padding-top: 20px; font-weight: bold">EMAIL:</p>
            <p>
                <asp:TextBox runat="server" CssClass="typetext2" Width="250px"  id="txtmail" />
            </p>
            <p style="padding-top: 20px">
                <asp:Button Text="Submit" runat="server" CssClass="btnSimple" id="btnlogin" OnClick="btnlogin_Click"/></p>
            <asp:Label Text="" ID="lblkq" runat="server" />
        </div>
    </div>
</asp:Content>

