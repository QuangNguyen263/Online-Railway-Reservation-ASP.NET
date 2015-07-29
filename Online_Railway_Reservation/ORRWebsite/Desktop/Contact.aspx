<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Desktop_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <h2 style="text-align: center; padding-bottom: 20px" class="contactus"></h2>
        <p style="text-align: center" class="fa fa-phone call" > </p>
        <br />
        <p style="text-align: center" class="fa fa-envelope-o "> Email: contact@bookin.vn </p>
        <br />
        <h4 style="font-weight: bold" class="register"></h4>
        <p>ICICI Bank Limited</p>
        <p>Landmark, Race Course Circle, Vadodara 390 007.</p>
        <br />
        <h4 style="font-weight: bold" class="corporate"></h4>
        <p>
            ICICI Bank Towers,
Bandra-Kurla Complex, Mumbai 400 051.
        </p>
        <p>+91 22 26531414</p>
        <br />
        <br />
        <h2 style="text-align: center; padding-bottom: 20px" class="talk"></h2>
        <div>
            <p class="nameU"></p>
            <asp:TextBox ID="txtName" class="email typetext" runat="server"></asp:TextBox>
            <br />
            <br />
            <p class="emailU"></p>
            <asp:TextBox ID="txtEmail" class="email typetext" runat="server" ></asp:TextBox>
            <br />
            <br />
            <p class="messenger"></p>
            <asp:TextBox ID="txtContent" class="enquiry" runat="server" Rows="0" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Button Text="Send" SkinID="btnSend" runat="server" ID="btnS" class="btnSimple" OnCommand="btnS_Command"/>
            <br />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>   
                     <h3><asp:Label ID="lblKQ" runat="server" Text=""></asp:Label></h3>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnS" />
                </Triggers>
            </asp:UpdatePanel>
            
        </div>
    </div>
</asp:Content>

