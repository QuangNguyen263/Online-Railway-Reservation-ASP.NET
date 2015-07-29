<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Choose_Ticket.aspx.cs" Inherits="Desktop_Choose_Ticket" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h3 class="tientrinh-so" style="background-color: #ff6a00; color: #ffffff;">1</h3>
            <h3 class="tientrinh-chu selectTrain" style="color: #ff6a00;"></h3>
            <h3 class="tientrinh-dau" style="color: #ff6a00;"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so">2</h3>
            <h3 class="tientrinh-chu infoTrain"></h3>
            <h3 class="tientrinh-dau"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so">3</h3>
            <h3 class="tientrinh-chu complete"></h3>
        </div>
        <div class="div-left">
            <div class="div-head">
                <div class="div-chieudi oneway"></div>
                <div class="div-tentuyen">
                    <h3 class="from "> <span class="diadiem">
                        <asp:Label ID="lblFrom" Text="" runat="server" />
                    </span><span class="to"></span> <span class="diadiem">
                        <asp:Label ID="lblTo" Text="" runat="server" /></span></h3>
                </div>
                <asp:TextBox ID="datefrom" class="ddl" runat="server" placeholder="M/d/yyyy" AutoPostBack="True" OnTextChanged="datefrom_TextChanged" TextMode="SingleLine"></asp:TextBox>
                <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="datefrom" TargetControlID="datefrom" ViewStateMode="Disabled" />
                <asp:RegularExpressionValidator ID="reCalendarFrom" runat="server" ErrorMessage="Origination Date Incorrect" ControlToValidate="datefrom" ValidaonGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="rfCalendarFrom" runat="server" ErrorMessage="Origination Date Is Empty" ControlToValidate="datefrom" ValidationGroup="checkData"></asp:RequiredFieldValidator>

            </div>
            <div class="div-list">
                <asp:UpdatePanel runat="server" ID="datefromPanel" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="width: 100%; font-size: 16px !important;">
                            <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                <td style="width: 20%; padding-left: 10px">Train Name</td>
                                <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">Departure-Arrival Time
                                </td>
                                <td style="width: 15%; text-align: right">Distance</td>
                                <td style="width: 25%; text-align: right; font-weight: bold; color: #ff6a00; font-size: 18px;">Train Type
                                </td>
                                <td style="width: 15%; text-align: right"></td>
                            </tr>
                            <asp:Repeater runat="server" ID="rpFrom">
                                <ItemTemplate>
                                    <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                        <td style="width: 20%; padding-left: 10px">
                                            <asp:Label ID="lbltimetableID" Text='<%#Eval("Timetable_ID") %>' runat="server" Visible="false" />
                                            <asp:Label ID="lblTID" Text='<%#Eval("Train_ID") %>' runat="server" Visible="false" />
                                            <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" /></td>
                                        <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">
                                            <asp:Label Text='<%#Eval("Departure_Time") %>' runat="server" />
                                            <asp:Label Text='<%#Eval("Arrival_Time") %>' runat="server" Style="color: #ff6a00" />
                                        </td>
                                        <td style="width: 15%; text-align: right">
                                            <asp:Label Text='<%#Eval("Distance") %>' runat="server" /></td>
                                        <td style="width: 25%; text-align: right; font-weight: bold; color: #ff6a00; font-size: 18px;">
                                            <asp:Label Text='<%#Eval("Train_Type") %>' runat="server" />
                                        </td>
                                        <td style="width: 15%; text-align: right">
                                            <asp:Button Text="Choose" runat="server" ID="btnChon" CssClass="btnChon" CommandArgument='<%#Eval("Train_ID") %>' OnCommand="btnChon_Command" /></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="datefrom" />
                    </Triggers>
                </asp:UpdatePanel>

            </div>
        </div>
        <div class="div-right">
            <div class="div-head">
                <div class="div-chieudi returnJourney"></div>
                <div class="div-tentuyen">
                    <h3 class="from"> <span class="diadiem ">
                        <asp:Label ID="lblDesFrom" Text="" runat="server" />
                    </span><span class="to"></span> <span class="diadiem">
                        <asp:Label ID="lblDesTo" Text="" runat="server" /></span></h3>
                </div>
                <asp:TextBox ID="dateto" class="ddl" runat="server" placeholder="MM/dd/yyyy" AutoPostBack="True" OnTextChanged="dateto_TextChanged" TextMode="SingleLine"></asp:TextBox>
                <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="dateto" TargetControlID="dateto" ViewStateMode="Disabled" />
                <asp:RegularExpressionValidator ID="reCalendarTo" runat="server" ErrorMessage="Origination Date Incorrect" ControlToValidate="dateto" ValidaonGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$"></asp:RegularExpressionValidator>
            </div>
            <div class="div-list">
                <div class="form-item">
                </div>
                <asp:UpdatePanel runat="server" ID="datetoPanel" UpdateMode="Conditional">
                    <ContentTemplate>
                        <table style="width: 100%; font-size: 16px !important;">
                            <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                <td style="width: 20%; padding-left: 10px">Train Name</td>
                                <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">Departure-Arrival Time
                                </td>
                                <td style="width: 15%; text-align: right">Distance</td>
                                <td style="width: 25%; text-align: right; font-weight: bold; color: #ff6a00; font-size: 18px;">Train Type
                                </td>
                                <td style="width: 15%; text-align: right"></td>
                            </tr>
                            <asp:Repeater runat="server" ID="rpTo">
                                <ItemTemplate>
                                    <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                        <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                            <td style="width: 20%; padding-left: 10px">
                                                  <asp:Label ID="lbltimetableToID" Text='<%#Eval("Timetable_ID") %>' runat="server" Visible="false" />
                                            <asp:Label ID="lblTToID" Text='<%#Eval("Train_ID") %>' runat="server" Visible="false" />
                                                <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" /></td>
                                            <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">
                                                <asp:Label Text='<%#Eval("Departure_Time") %>' runat="server" />

                                                <asp:Label Text='<%#Eval("Arrival_Time") %>' runat="server" Style="color: #ff6a00" />

                                            </td>
                                            <td style="width: 15%; text-align: right">
                                                <asp:Label Text='<%#Eval("Distance") %>' runat="server" /></td>
                                            <td style="width: 25%; text-align: right; font-weight: bold; color: #ff6a00; font-size: 18px;">
                                                <asp:Label Text='<%#Eval("Train_Type") %>' runat="server" />
                                            </td>
                                            <td style="width: 15%; text-align: right">
                                                <asp:Button Text="Choose" runat="server" ID="btnChonKH" CssClass="btnChon" CommandArgument='<%#Eval("Train_ID") %>' OnCommand="btnChonKH_Command" /></td>
                                        </tr>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="dateto" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div style="clear: both"></div>
        <div class="div-btn">
            <p style="text-align: center">
                <asp:Button Text="Đặt vé" SkinID="btnbookTicket" runat="server" ID="btn_Dat" class="btnSimple" ValidationGroup="checkData" OnCommand="btn_Dat_Command" />
            </p>
            <br />
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblCheckValidate" Text="" runat="server" Visible="False" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_Dat" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>

