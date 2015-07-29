<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Schedule_Manager.aspx.cs" Inherits="Desktop_Admin_Schedule_Manager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>TIMETABLE MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left">
                    <table cellspacing="0" style="width: 100%; margin-bottom: 10px" class="table_manager" border="1">
                        <tr>
                            <th>Train Name:</th>
                            <td>
                                <asp:DropDownList runat="server" ID="ddl_train_name" CssClass="typetext" OnSelectedIndexChanged="ddl_train_name_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                                <asp:Button Text="Search" runat="server" class="btnSimple" ID="btnSearch" OnClick="btnSearch_Click" ValidationGroup="search"/>

                            </td>
                        </tr>
                        <tr>
                            <th>Origin Station:</th>
                            <td>
                                <asp:TextBox Text="" ID="txt_origin_station" runat="server" Enabled="false" CssClass="typetext" />
                            </td>
                        </tr>
                        <tr>
                            <th>Destination Station:</th>
                            <td>
                                <asp:TextBox Text="" ID="txt_destin_station" runat="server" Enabled="false" CssClass="typetext" />
                            </td>
                        </tr>
                        <tr>
                            <th>Departure Date:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txt_date_depart" CssClass="typetext" placeholder="mm/dd/yyyy" ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_date_depart" Display="Dynamic" CssClass="error" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txt_date_depart" Format="MM/dd/yyyy" />
                            </td>
                        </tr>

                        <tr>
                            <th>Departure Time:</th>
                            <td style="text-align: left">
                                <asp:DropDownList runat="server" ID="ddl_hour_depart" CssClass="typetext">
                                    <asp:ListItem Text="00" />
                                    <asp:ListItem Text="01" />
                                    <asp:ListItem Text="02" />
                                    <asp:ListItem Text="03" />
                                    <asp:ListItem Text="04" />
                                    <asp:ListItem Text="05" />
                                    <asp:ListItem Text="06" />
                                    <asp:ListItem Text="07" />
                                    <asp:ListItem Text="08" />
                                    <asp:ListItem Text="09" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                    <asp:ListItem Text="13" />
                                    <asp:ListItem Text="14" />
                                    <asp:ListItem Text="15" />
                                    <asp:ListItem Text="16" />
                                    <asp:ListItem Text="17" />
                                    <asp:ListItem Text="18" />
                                    <asp:ListItem Text="19" />
                                    <asp:ListItem Text="20" />
                                    <asp:ListItem Text="21" />
                                    <asp:ListItem Text="22" />
                                    <asp:ListItem Text="23" />
                                    <asp:ListItem Text="24" />
                                </asp:DropDownList>
                                <asp:DropDownList runat="server" ID="ddl_minute_depart" CssClass="typetext">
                                    <asp:ListItem Text="00" />
                                    <asp:ListItem Text="01" />
                                    <asp:ListItem Text="02" />
                                    <asp:ListItem Text="03" />
                                    <asp:ListItem Text="04" />
                                    <asp:ListItem Text="05" />
                                    <asp:ListItem Text="06" />
                                    <asp:ListItem Text="07" />
                                    <asp:ListItem Text="08" />
                                    <asp:ListItem Text="09" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                    <asp:ListItem Text="13" />
                                    <asp:ListItem Text="14" />
                                    <asp:ListItem Text="15" />
                                    <asp:ListItem Text="16" />
                                    <asp:ListItem Text="17" />
                                    <asp:ListItem Text="18" />
                                    <asp:ListItem Text="19" />
                                    <asp:ListItem Text="20" />
                                    <asp:ListItem Text="21" />
                                    <asp:ListItem Text="22" />
                                    <asp:ListItem Text="23" />
                                    <asp:ListItem Text="24" />
                                    <asp:ListItem Text="25" />
                                    <asp:ListItem Text="26" />
                                    <asp:ListItem Text="27" />
                                    <asp:ListItem Text="28" />
                                    <asp:ListItem Text="29" />
                                    <asp:ListItem Text="30" />
                                    <asp:ListItem Text="31" />
                                    <asp:ListItem Text="32" />
                                    <asp:ListItem Text="33" />
                                    <asp:ListItem Text="34" />
                                    <asp:ListItem Text="35" />
                                    <asp:ListItem Text="36" />
                                    <asp:ListItem Text="37" />
                                    <asp:ListItem Text="38" />
                                    <asp:ListItem Text="39" />
                                    <asp:ListItem Text="40" />
                                    <asp:ListItem Text="41" />
                                    <asp:ListItem Text="42" />
                                    <asp:ListItem Text="43" />
                                    <asp:ListItem Text="44" />
                                    <asp:ListItem Text="45" />
                                    <asp:ListItem Text="46" />
                                    <asp:ListItem Text="47" />
                                    <asp:ListItem Text="48" />
                                    <asp:ListItem Text="49" />
                                    <asp:ListItem Text="50" />
                                    <asp:ListItem Text="51" />
                                    <asp:ListItem Text="52" />
                                    <asp:ListItem Text="53" />
                                    <asp:ListItem Text="54" />
                                    <asp:ListItem Text="55" />
                                    <asp:ListItem Text="56" />
                                    <asp:ListItem Text="57" />
                                    <asp:ListItem Text="58" />
                                    <asp:ListItem Text="59" />
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <th>Arrival Date:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txt_date_arrival" CssClass="typetext" placeholder="mm/dd/yyyy"  ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_date_arrival" Display="Dynamic" CssClass="error" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                                <cc1:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txt_date_arrival" Format="MM/dd/yyyy" />
                            </td>
                        </tr>

                        <tr>
                            <th>Arrival Time:</th>
                            <td>
                                <asp:DropDownList runat="server" ID="ddl_hour_arrival" CssClass="typetext">
                                    <asp:ListItem Text="00" />
                                    <asp:ListItem Text="01" />
                                    <asp:ListItem Text="02" />
                                    <asp:ListItem Text="03" />
                                    <asp:ListItem Text="04" />
                                    <asp:ListItem Text="05" />
                                    <asp:ListItem Text="06" />
                                    <asp:ListItem Text="07" />
                                    <asp:ListItem Text="08" />
                                    <asp:ListItem Text="09" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                    <asp:ListItem Text="13" />
                                    <asp:ListItem Text="14" />
                                    <asp:ListItem Text="15" />
                                    <asp:ListItem Text="16" />
                                    <asp:ListItem Text="17" />
                                    <asp:ListItem Text="18" />
                                    <asp:ListItem Text="19" />
                                    <asp:ListItem Text="20" />
                                    <asp:ListItem Text="21" />
                                    <asp:ListItem Text="22" />
                                    <asp:ListItem Text="23" />
                                    <asp:ListItem Text="24" />
                                </asp:DropDownList>
                                <asp:DropDownList runat="server" ID="ddl_minute_arrival" CssClass="typetext">
                                    <asp:ListItem Text="00" />
                                    <asp:ListItem Text="01" />
                                    <asp:ListItem Text="02" />
                                    <asp:ListItem Text="03" />
                                    <asp:ListItem Text="04" />
                                    <asp:ListItem Text="05" />
                                    <asp:ListItem Text="06" />
                                    <asp:ListItem Text="07" />
                                    <asp:ListItem Text="08" />
                                    <asp:ListItem Text="09" />
                                    <asp:ListItem Text="10" />
                                    <asp:ListItem Text="11" />
                                    <asp:ListItem Text="12" />
                                    <asp:ListItem Text="13" />
                                    <asp:ListItem Text="14" />
                                    <asp:ListItem Text="15" />
                                    <asp:ListItem Text="16" />
                                    <asp:ListItem Text="17" />
                                    <asp:ListItem Text="18" />
                                    <asp:ListItem Text="19" />
                                    <asp:ListItem Text="20" />
                                    <asp:ListItem Text="21" />
                                    <asp:ListItem Text="22" />
                                    <asp:ListItem Text="23" />
                                    <asp:ListItem Text="24" />
                                    <asp:ListItem Text="25" />
                                    <asp:ListItem Text="26" />
                                    <asp:ListItem Text="27" />
                                    <asp:ListItem Text="28" />
                                    <asp:ListItem Text="29" />
                                    <asp:ListItem Text="30" />
                                    <asp:ListItem Text="31" />
                                    <asp:ListItem Text="32" />
                                    <asp:ListItem Text="33" />
                                    <asp:ListItem Text="34" />
                                    <asp:ListItem Text="35" />
                                    <asp:ListItem Text="36" />
                                    <asp:ListItem Text="37" />
                                    <asp:ListItem Text="38" />
                                    <asp:ListItem Text="39" />
                                    <asp:ListItem Text="40" />
                                    <asp:ListItem Text="41" />
                                    <asp:ListItem Text="42" />
                                    <asp:ListItem Text="43" />
                                    <asp:ListItem Text="44" />
                                    <asp:ListItem Text="45" />
                                    <asp:ListItem Text="46" />
                                    <asp:ListItem Text="47" />
                                    <asp:ListItem Text="48" />
                                    <asp:ListItem Text="49" />
                                    <asp:ListItem Text="50" />
                                    <asp:ListItem Text="51" />
                                    <asp:ListItem Text="52" />
                                    <asp:ListItem Text="53" />
                                    <asp:ListItem Text="54" />
                                    <asp:ListItem Text="55" />
                                    <asp:ListItem Text="56" />
                                    <asp:ListItem Text="57" />
                                    <asp:ListItem Text="58" />
                                    <asp:ListItem Text="59" />
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <th>Distance:</th>
                            <td>
                                <asp:TextBox runat="server" ID="txtDistance" CssClass="typetext"  ValidationGroup="txt"/>
                                <asp:RequiredFieldValidator  ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" Display="Dynamic" ControlToValidate="txtDistance" CssClass="error"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator  ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" Display="Dynamic" ControlToValidate="txtDistance" CssClass="error" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                            </td>
                        </tr>

                    </table>

                    <p style="text-align: center">
                        <span style="margin-left: 20px">
                            <asp:Button ID="btnAdd" runat="server" Text="Add" class="btnSimple" Width="105px" OnClick="btnAdd_Click" Visible="true"/></span>
                       
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
                <div class="div-manager-right" style="height: 600px; overflow: scroll">
                    <asp:DataGrid ID="dgTimeTable" runat="server" OnItemCommand="dgTimeTable_ItemCommand" AutoGenerateColumns="false">
                        <Columns>
                            <asp:TemplateColumn Visible="false">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Timetable_ID") %>' runat="server" ID="lblID" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Train Name">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" ID="lblTrainName" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Origin Station">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("origin_station") %>' runat="server"  />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Destination Station">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("destination_station") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            
                            <asp:TemplateColumn HeaderText="Departure Date">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Departure_Date") %>' runat="server"  />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Arrival Date">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("Arrival_Date") %>' runat="server" />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn HeaderText="Distance (KM)">
                                <ItemTemplate>
                                    <asp:Label Text='<%#Eval("distance") %>' runat="server"  />
                                </ItemTemplate>
                            </asp:TemplateColumn>
                            <asp:TemplateColumn>
                                <ItemTemplate>
                                    <asp:Button runat="server" CausesValidation="false" CommandName="" Text="Select"></asp:Button>
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

