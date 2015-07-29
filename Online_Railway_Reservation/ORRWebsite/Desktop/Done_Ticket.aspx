<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Done_Ticket.aspx.cs" Inherits="Desktop_Done_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group" style="text-align: center">
        <div class="tientrinh">
            <h3 class="tientrinh-so" style="background-color: #388cf2; color: #ffffff; padding: 6px 9px;"><i class="fa fa-check"></i></h3>
            <h3 class="tientrinh-chu selectTrain" style="color: #388cf2;"></h3>
            <h3 class="tientrinh-dau" style="color: #388cf2;"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so" style="background-color: #388cf2; color: #ffffff; padding: 6px 9px;"><i class="fa fa-check"></i></h3>
            <h3 class="tientrinh-chu infoTrain" style="color: #388cf2;"></h3>
            <h3 class="tientrinh-dau" style="color: #388cf2;"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so" style="background-color: #ff6a00; color: #ffffff;">3</h3>
            <h3 class="tientrinh-chu complete" style="color: #ff6a00;"></h3>
        </div>
        <h3 class="mess"></h3>
        <asp:Button Text="Ticket Information" SkinID="btnTicketInfo" runat="server" style="margin-top:3% !important; padding:1% !important; font-size:18px !important" ID="btnSearch" CssClass="btnSimple" OnCommand="btnSearch_Command"/>
    </div>
</asp:Content>

