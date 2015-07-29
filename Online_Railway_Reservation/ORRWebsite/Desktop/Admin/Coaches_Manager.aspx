<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Coaches_Manager.aspx.cs" Inherits="Desktop_Admin_Coaches_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>COACHES MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                        <tr>
                            <th>Train Name:</th>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlTrainName" CssClass="typetext">
                                </asp:DropDownList>
                                <asp:Button Text="Search" runat="server" ID="btnSearchCoach" OnClick="btnSearchCoach_Click" class="btnSimple" ValidationGroup="search"/>

                            </td>
                        </tr>
                        <tr>
                            <th>Type:</th>
                            <td>
                                <asp:DropDownList ID="ddlCoachesType" runat="server" Width="280px" CssClass="typetext">
                                    <asp:ListItem Text="AC 1" />
                                    <asp:ListItem Text="AC Sleeper" />
                                    <asp:ListItem Text="First Class" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>Seats:</th>
                            <td>
                                <asp:TextBox runat="server" Width="280px" CssClass="typetext" ID="txtSeats" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtSeats" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="^\d+$"  ErrorMessage="RegularExpressionValidator" ControlToValidate="txtSeats" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Price:</th>
                            <td>
                                <asp:TextBox runat="server" Width="280px" CssClass="typetext" ID="txtPrices" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPrices" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationExpression="^[\d]*[\.]{0,1}[\d]+$" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtPrices" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>

                            </td>
                        </tr>
                        <tr>
                            <th>Status:</th>
                            <td>
                                <asp:RadioButton ID="RadioButton1" Text="Active" runat="server" GroupName="rdstt" CssClass="radiobtn" Checked="true"/>
                                <asp:RadioButton ID="RadioButton2" GroupName="rdstt" Text="Block" runat="server" CssClass="radiobtn"/></td>
                        </tr>
                        <tr>
                        </tr>
                    </table>

                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" class="btnSimple" Width="105px" OnClick="btnAdd_Click" /></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btnSimple" OnClick="btnUpdate_Click" Visible="false"/></span>
                    </p>
                    <br />
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btnSimple" Width="105px" OnClick="btnDelete_Click" Visible="false"/></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btnSimple" Width="105px" OnClick="btnCancel_Click" Visible="false"/></span>
                    </p>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2">
            <ContentTemplate>
                <div class="div-manager-right" style="height: 470px; overflow-y: scroll">

                    <asp:DataGrid runat="server" ID="dgCoaches" CssClass="table_manager" AutoGenerateColumns="False" OnItemCommand="dgCoaches_ItemCommand">
                        <Columns>
                            <asp:TemplateColumn HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Coach_ID") %>' runat="server" ID="lblid" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Coach Type">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Coach_Type") %>' runat="server" ID="lbltype" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Train Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" ID="lblname" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Seats">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Number_Of_Seats") %>' runat="server" ID="lblseat" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Price") %>' runat="server" ID="lblprice" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Status") %>' runat="server" ID="lblstatus" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button runat="server" CommandName="" Text="Select" ID="btnSelect" ValidationGroup="btn"></asp:Button>
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

