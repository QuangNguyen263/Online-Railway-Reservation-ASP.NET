<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Station_Manager.aspx.cs" Inherits="Desktop_Admin_Station_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>STATIONS MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="div-manager-left" id="up1">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                        <tr>
                            <th>Station name:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtNamestation" type="text" class="typetext" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="true" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtNamestation" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableClientScript="true" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtNamestation" ValidationExpression="^[a-zA-Z\s0-9]*$" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Longtitude:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtLong" type="text" class="typetext" ValidationGroup="txt"/> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLong" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>    
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtLong"  ValidationExpression="^\d+\.{1}\d+$" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Latitude:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtLa" type="text" class="typetext" ValidationGroup="txt"/> 
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLa" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtLa"  ValidationExpression="^\d+\.{1}\d+$" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Status:</th>
                            <td>
                                <asp:RadioButton ID="rbtn1" Text="Active" runat="server" GroupName="rdstt" CssClass="radiobtn" Checked="true"/>
                                <asp:RadioButton ID="rbtn2" GroupName="rdstt" Text="Block" runat="server" CssClass="radiobtn"/>
                            </td>
                        </tr>
                    </table>
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="Button1" runat="server" Text="Add" class="btnSimple" Width="105px" OnClick="btnAdd_Click"/></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="Button2" runat="server" Text="Update" class="btnSimple" Width="105px" OnClick="btnUp_Click" visible="false"/></span>
                    </p>
                    <br />
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="Button3" runat="server" Text="Delete" class="btnSimple" Width="105px" OnClick="btnDel_Click" Visible="false" ValidationGroup="btn"/></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btnSimple" Width="105px" OnClick="btnCancel_Click" ValidationGroup="btn" Visible="false"/></span>
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2">
            <ContentTemplate>
                <div class="div-manager-right" style="height:350px; overflow-y:scroll">
                    <asp:DataGrid runat="server" ID="dgStation" AutoGenerateColumns="false" OnItemCommand="dgStation_ItemCommand" CssClass="table_manager" >
                        <Columns>
                            <asp:TemplateColumn HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Station_ID") %>' runat="server" id="lblIDs"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Station_Name") %>' runat="server" id="lblNas"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Longtitude">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Longtitude") %>' runat="server" ID="lblLong" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Latitude">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Latitude") %>' runat="server" id="lblLa"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button Text="Select" ID="btnSelects" runat="server" ValidationGroup="a"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                        </Columns>
                    </asp:DataGrid>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="clear: both"></div>
    </div>
</asp:Content>

