<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Changeinfo_user.aspx.cs" Inherits="Desktop_Changeinfo_user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>Personal Information Management</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1c">
            <ContentTemplate>
                <div style="width:50%; padding-right:1%; float:left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px">
                        <tr>
                            <th colspan="2" style="font-size: 16px; color: darkblue; text-transform:uppercase">Change Your Password</th>
                        </tr>
                        <tr>
                            <th>Current Password: </th>
                            <td>
                                <asp:TextBox runat="server" ID="txtCpass" Width="280px" CssClass="typetext" TextMode="Password"/>
                            </td>
                        </tr>
                        <tr>
                            <th>New Password: </th>
                            <td>
                                <asp:TextBox runat="server" ID="txtNpass" Width="280px" CssClass="typetext" TextMode="Password" />
                            </td>
                        </tr>
                        <tr>
                            <th>Confirm Password: </th>
                            <td>
                                <asp:TextBox runat="server" ID="txtNcpass" Width="280px" CssClass="typetext" TextMode="Password"/>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Your New password and Confirm password do not math" Display="Dynamic" CssClass="error" ControlToCompare="txtNpass" ControlToValidate="txtNcpass"></asp:CompareValidator>
                            </td>
                        </tr>
                    </table>
                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnAccess" runat="server" Text="OK" class="btnSimple" Width="105px" OnClick="btnAccess_Click" />
                        </span>
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2c">
            <ContentTemplate>
                <div  style="width:50%; padding-left:1%; float:left; height:380px; overflow-y:scroll; margin-bottom: 20px">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px; border-left: 1px solid  #6db7f6">
                        <tr>
                            <th colspan="2" style="font-size: 16px; color: darkblue; text-transform:uppercase">Change Your Information</th>
                        </tr>
                        <tr>
                            <th>Username: </th>
                            <td>
                                <asp:Label Text="" ID="txtUser" runat="server" Width="280px" Class="typetext" />
                            </td>
                        </tr>
                        <tr>
                            <th>Role:</th>
                            <td>
                                <asp:Label Text="" ID="txtRole" runat="server" Width="280px" Class="typetext" />
                            </td>
                        </tr>
                        <tr>
                            <th>Email: </th>
                            <td>
                                <asp:TextBox runat="server" ID="txtEmail" Width="280px" CssClass="typetext" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" CssClass="error" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" CssClass="error" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$" ControlToValidate="txtEmail"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Phone: </th>
                            <td>
                                <asp:TextBox runat="server" ID="txtPhone" Width="280px" CssClass="typetext" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" CssClass="error" ValidationExpression="^[0-9\-\+]{9,15}$" ControlToValidate="txtPhone"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Gender: </th>
                            <td>
                                <asp:DropDownList runat="server" ID="ddlGender" Width="280px" CssClass="typetext">
                                    <asp:ListItem Text="Female" />
                                    <asp:ListItem Text="Male" />
                                    <asp:ListItem Text="Other"/>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    <p style="text-align: center">
                        <span >
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btnSimple" Width="105px" OnClick="btnSave_Click" />
                        </span>
                        <span>
                            <asp:Button Text="Cancel" ID="btnCancel" CssClass="btnSimple" OnClick="btnCancel_Click" runat="server" Width="105px" />
                        </span>
                    </p>
                   <br />
                    
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

</asp:Content>

