<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Info_Ticket_FindPRN.aspx.cs" Inherits="Desktop_Info_Ticket_FindPRN" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <h2 style="text-align: center; padding-bottom: 20px" class="retrieveInfo"></h2>
        <table>
            <tr>
                <th style="text-align: right">Email: </th>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="typetext padd" Width="250px" /><br />
                    <asp:RegularExpressionValidator ID="reCFMail" runat="server" ErrorMessage="Confirm Email Incorrect" ControlToValidate="txtEmail" ValidaonGroup="checkData" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfCFMail" runat="server" ErrorMessage="Confirm Email Is Empty" ControlToValidate="txtEmail" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th style="text-align: right" class="phone"></th>
                <td>
                    <asp:TextBox ID="txtPN" runat="server" CssClass="typetext padd" Width="250px" /><br />
                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Phonenumber Incorrect" ControlToValidate="txtPN" ValidaonGroup="checkData" ValidationExpression="^[0-9\-\+]{9,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfPhone" runat="server" ErrorMessage="Phonenumber Is Empty" ControlToValidate="txtPN" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:Button Text="Get PNR" SkinID="btngetPrn" runat="server" ID="btnS" class="btnSimple" ValidationGroup="checkData" OnCommand="btnSearch_Command" />
            <br />
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <h3>
                        <asp:Label ID="lblKQ" Text="" runat="server" /></h3>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnS" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress runat="server">
                <ProgressTemplate>
                    <p style="text-align: center">
                        <img src="../images/loading.gif" alt="Alternate Text" width="60" height="60" />
                    </p>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
</asp:Content>

