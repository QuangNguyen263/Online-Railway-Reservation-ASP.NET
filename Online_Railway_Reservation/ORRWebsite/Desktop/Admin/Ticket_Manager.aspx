<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Ticket_Manager.aspx.cs" Inherits="Desktop_Admin_Ticket_Manager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>TICKETS MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                        <tr>
                            <th>PNR code:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txtpnr" />
                                <asp:Button Text="Search" runat="server" CssClass="btnSimple" ID="btnSearch" OnClick="btnSearch_Click" />
                            </td>
                        </tr>
                        <tr>
                            <th>Ticket type:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txttickttype" Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <th>Train Name:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txttrainname" Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <th>Status:</th>
                            <td>
                                <asp:RadioButton ID="RadioButton1" Text="Active" runat="server" GroupName="rdstt" CssClass="radiobtn" Enabled="false" />
                                <asp:RadioButton ID="RadioButton2" GroupName="rdstt" Text="Block" runat="server" CssClass="radiobtn" Enabled="false" /></td>
                        </tr>
                        <tr>
                            <th>Departure Date:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txtdate" Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <th>Departure Time:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txttime" Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <th>Coach Type:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txtcoachtype" Enabled="false" />
                            </td>
                        </tr>
                        <tr>
                            <th>Price:</th>
                            <td>
                                <asp:TextBox runat="server" CssClass="typetext" ID="txtprice" Enabled="false" />
                            </td>
                        </tr>

                    </table>
                    <p style="text-align: center; margin-top:20px">
                        <asp:GridView ID="gv1" runat="server">   </asp:GridView>
                        <span style="margin-right:20px"><asp:Button runat="server" Text="Delete" class="btnSimple" OnClick="btnxoa_Click" ID="btnxoa" /></span><span style="margin-right:20px"></span><asp:Button runat="server" Text="Cancel" class="btnSimple" OnClick="btnCancel_Click" ID="btnCancel" />
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2">
            <ContentTemplate>
                <div class="div-manager-right" style="height:500px; overflow:scroll">
                    <asp:DataGrid runat="server" ID="dgticket" AutoGenerateColumns="False" CssClass="table_manager" OnItemCommand="dgticket_ItemCommand">
                        <Columns>
                            <asp:TemplateColumn Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Ticket_ID") %>' runat="server" ID="lblid" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="PNR">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("PNR") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Ticket Type">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Passenger_type") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Status") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Train Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button runat="server" CausesValidation="false" CommandName="Select" Text="Select"></asp:Button>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button runat="server" Style="float:right;margin:2%" Text="Export" class="btnSimple" OnClick="btnXuat_Click" ID="btnXuat" />
        <div style="clear: both"></div>
    </div>
</asp:Content>

