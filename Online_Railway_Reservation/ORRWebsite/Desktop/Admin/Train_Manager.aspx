<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Train_Manager.aspx.cs" Inherits="Desktop_Admin_Train_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>TRAINS MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                        <tr>
                            <th>Train Name:</th>
                            <td>
                                <asp:TextBox ID="txttrain_name" CssClass="typetext email2" runat="server" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" EnableClientScript="true" ErrorMessage="RequiredFieldValidator" ControlToValidate="txttrain_name" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" EnableClientScript="true" ErrorMessage="RegularExpressionValidator" ControlToValidate="txttrain_name" ValidationExpression="^[a-zA-Z\s0-9]*$" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Origin station:</th>
                            <td>
                                <asp:DropDownList ID="ddl_station_origin" runat="server" CssClass="typetext" Width="280px"></asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>Destination station:</th>
                            <td>
                                <asp:DropDownList ID="ddl_station_destin" runat="server" class="typetext" Width="280px"></asp:DropDownList></td>
                        </tr>
                        <tr>
                            <th>Train type:</th>
                            <td>
                                <asp:RadioButton ID="rdSpecial" Text="Special" runat="server" GroupName="rdtype" CssClass="radiobtn" Checked="true" />
                                <asp:RadioButton ID="rdDaily" GroupName="rdtype" Text="Daily" runat="server" CssClass="radiobtn" /></td>
                        </tr>
                        <tr>
                            <th>Status:</th>
                            <td>
                                <asp:RadioButton ID="rdActive" Text="Active" runat="server" GroupName="rdstt" CssClass="radiobtn" Checked="true"/>
                                <asp:RadioButton ID="rdBlock" GroupName="rdstt" Text="Block" runat="server" CssClass="radiobtn" /></td>
                        </tr>
                    </table>

                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" class="btnSimple" Width="105px" OnClick="btnAdd_Click" Visible="true" /></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btnSimple" OnClick="btnUpdate_Click" Visible="false" /></span>
                    </p>
                    <br />
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btnSimple" Width="105px" OnClick="btnDelete_Click" Visible="false" /></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btnSimple" Width="105px" OnClick="btnCancel_Click" Visible="false" /></span>
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2" >
            <ContentTemplate>
                <div class="div-manager-right" style="height: 400px; overflow-y: scroll">
                    <asp:DataGrid runat="server" Width="100%" AutoGenerateColumns="False" ID="dgTrain" CssClass="table_manager" OnItemCommand="dgTrain_ItemCommand">
                        <Columns>
                            <asp:TemplateColumn Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_id")%>' runat="server" ID="lbltrain_id" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Train Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_Name")%>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Origin Station">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("origin_station") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Destination Station">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("destin_station") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Train Type">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_Type") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Status") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button runat="server" CommandName="" Text="Select" ValidationGroup="select"></asp:Button>
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

