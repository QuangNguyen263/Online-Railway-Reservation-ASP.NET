<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Passenger_Manager.aspx.cs" Inherits="Desktop_Admin_Passenger_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>CUSTOMER INFORMATION MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1pass">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager">
                        <tr>
                            <th>PNR:</th>
                            <td>
                                <asp:TextBox runat="server" id="txtPNR" type="text" class="typetext" ValidationGroup="pnr"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPNR" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>   
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[0-9a-zA-Z]{7}$" ControlToValidate="txtPNR" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                                <asp:Button Text="Search" runat="server" class="btnSimple" OnClick="btnSearch_Click" ID="btnSearch" ValidationGroup="pnr"/>
                            </td>
                        </tr>
                        <tr>
                            <th>Name:</th>
                            <td>
                                <asp:TextBox runat="server" id="txtName" type="text" class="typetext" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtName" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ValidationExpression="^[a-zA-Z\s]{1,100}$"  ControlToValidate="txtName" Display="Dynamic" CssClass="error"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Birthday</th>
                            <td>
                                <asp:TextBox runat="server" id="txtBirth" type="text" class="typetext" ValidationGroup="txt" />   
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtBirth" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Email:</th>
                            <td>
                                <asp:TextBox runat="server" id="txtE" type="text" class="typetext" ValidationGroup="txt"/>  
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtE" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtE" Display="Dynamic" CssClass="error" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <th>Phone:</th>
                            <td>
                                <asp:TextBox runat="server" id="txtPhone" type="text" class="typetext"  ValidationGroup="txt"/>  
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPhone" Display="Dynamic" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="txtPhone" Display="Dynamic" CssClass="error" ValidationExpression="^[0-9\-\+]{9,15}$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                    </table>
                    <p style="text-align: center">
                        <asp:Button ID="btnU" runat="server" Width="105px" Text="Update" class="btnSimple" OnClick="btnU_Click" visible="false" ValidationGroup="txt"/><asp:Button ID="btnD" runat="server" Text="Delete" class="btnSimple" Width="105px" OnClick="btnD_Click" Visible="false"  ValidationGroup="txt"/><asp:Button Text="Cancel" runat="server" id="btnC"  class="btnSimple" Width="105px" Visible="false" OnClick="btnC_Click"  ValidationGroup="txt"/>
                    </p>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2pass">
            <ContentTemplate>
                <div class="div-manager-right" style="height: auto; overflow-y:scroll">
                    <asp:DataGrid runat="server" ID="dgPass" CssClass="table_manager" AutoGenerateColumns="False" OnItemCommand="dgPass_ItemCommand">
                        <Columns>
                            <asp:TemplateColumn HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("PNR") %>' runat="server" id="lblPNR"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Passenger Name">
                                 <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Passenger_Name") %>' runat="server" id="lblName"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Birthday">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Date_Of_Birth") %>' runat="server" id="lblDob"/>
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Email") %>' id="lblEmail" runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Phone">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Phone_Number") %>' runat="server" ID="lblPhone" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button Text="Select" ID="btnS" runat="server" CommandName="" ValidationGroup="select"/>
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

