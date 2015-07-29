<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="User_Manager.aspx.cs" Inherits="Desktop_Admin_User_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>USERS MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                       <tr>
                            <th>Username:</th>
                            <td>
                                <asp:TextBox runat="server" ValidationGroup="txt" ID="txtUsername" CssClass="typetext" /><asp:Button ValidationGroup="search" Text="Search" runat="server" CssClass="btnSimple padd" id="btnsearch" OnClick="btnsearch_Click"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtUsername" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtUsername" Display="Dynamic" CssClass="error" ValidationExpression="^[a-zA-Z'_'\d]+$"></asp:RegularExpressionValidator>
                            </td>

                        </tr>
                        <tr>
                            <th>Email:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtEmail" CssClass="typetext" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEmail" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtEmail" Display="Dynamic" CssClass="error" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Phone number:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtPhone" CssClass="typetext" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhone" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtPhone" Display="Dynamic" CssClass="error" ValidationExpression="^[0-9]{9,15}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender:</th>
                            <td>
                                <asp:RadioButton ID="rdMale" Text="Male" runat="server" GroupName="rdGender" CssClass="radiobtn" Checked="true"/>
                                <asp:RadioButton ID="rdFemale" GroupName="rdGender" Text="Female" runat="server" CssClass="radiobtn" />
                                <asp:RadioButton ID="rdOther" GroupName="rdGender" Text="Other" runat="server" CssClass="radiobtn" />
                            </td>
                        </tr>
                        <tr>
                            <th>User type:</th>
                            <td>
                                <asp:DropDownList runat="server" class="typetext" ID="ddlUserType">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>

                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" class="btnSimple" Width="105px" OnClick="btnAdd_Click" Visible="true" /></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btnSimple" OnClick="btnUpdate_Click" Visible="false"/></span>
                    </p>
                    <br />
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btnSimple" Width="105px" OnClick="btnDelete_Click" ValidationGroup="btn" Visible="false"/></span>
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btnSimple" Width="105px" OnClick="btnCancel_Click" ValidationGroup="btn" Visible="false"/></span>
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2" style="height: 400px; overflow: scroll">
            <ContentTemplate>
                <div class="div-manager-right">
                    <asp:DataGrid runat ="server" AutoGenerateColumns="False" ID="dgUser" OnItemCommand="dgUser_ItemCommand" CssClass="table_manager">
                        <Columns>
                             <asp:TemplateColumn HeaderText = "Username">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Username") %>' runat="server" id="lblUsername"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText = "Email">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Email") %>' runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText = "Phone">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Phone_Number") %>' runat="server"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText = "Role Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Role_Name") %>' runat="server" id="lblRolename"/>
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

