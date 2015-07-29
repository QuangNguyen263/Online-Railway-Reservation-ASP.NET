<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Info_Ticket.aspx.cs" Inherits="Desktop_Info_Ticket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <h2 style="text-align: center; padding-bottom: 20px" class="findTicketInfo"></h2>
        <table>
            <tr>
                <th class="codePrn" style="text-align: right"></th>
                <td>
                    <asp:TextBox ID="txtInput" runat="server" CssClass="typetext padd" Width="250px" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="PRN Is Empty" ControlToValidate="txtInput" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <th class="codePrn2" style="text-align: right"></th>
                <td>
                    <asp:TextBox ID="txtEmailIP" runat="server" CssClass="typetext padd" Width="250px" />
                    <asp:RegularExpressionValidator ID="reMail" runat="server" ErrorMessage="Email Incorrect" ControlToValidate="txtEmailIP" ValidaonGroup="checkData" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfMail" runat="server" ErrorMessage="Email Is Empty" ControlToValidate="txtEmailIP" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>

                </td>
            </tr>
            <tr>
                <th class="codePrn3" style="text-align: right"></th>
                <td>
                    <asp:TextBox ID="txtPhoneNumberIP" runat="server" CssClass="typetext padd" Width="250px" />
                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Phonenumber Incorrect" ControlToValidate="txtPhoneNumberIP" ValidaonGroup="checkData" ValidationExpression="^[0-9\-\+]{9,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfPhone" runat="server" ErrorMessage="Phonenumber Is Empty" ControlToValidate="txtPhoneNumberIP" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>

                </td>
            </tr>
        </table>
        <div style="text-align: center">
            <asp:Button Text="Tìm" SkinID="btnSearch" runat="server" ID="btnS" class="btnSimple" OnCommand="btnS_Command" />
            <a href="Info_Ticket_FindPRN.aspx" style="font-style: italic; text-decoration: none; margin-left: 10px;" class="forgetPrn"></a>
            <br />
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
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <asp:Panel ID="pnShow" runat="server" Visible="false">
                    <div>
                        <div class="div-head">

                            <div class="div-thongtinchuyen">
                                <h3 style="padding-bottom: 10px" class="customerInfo"></h3>

                                <div style="float: left; width: 48%">
                                    <p class="fullName"></p>
                                    <p>
                                        <asp:TextBox ID="txtHoTen" runat="server" CssClass="thongtin-formitem" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>
                                <div style="float: left; width: 48%; margin-left: 4%">
                                    <p class="codeP"></p>
                                    <p>
                                        <asp:TextBox ID="txtPNR" runat="server" CssClass="thongtin-formitem" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>
                                <div style="clear: both; margin-bottom: 10px"></div>
                                <div style="float: left; width: 48%;">
                                    <p>Email</p>
                                    <p>
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="thongtin-formitem" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>
                                <div style="float: left; width: 48%; margin-left: 4%;">
                                    <p class="phone"></p>
                                    <p>
                                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="thongtin-formitem" TextMode="Phone" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>
                                <div style="clear: both; margin-bottom: 10px;"></div>
                                <div style="float: left; width: 48%;">
                                    <p class="birth"></p>
                                    <p>
                                        <asp:TextBox ID="txtDOB" runat="server" placeholder="M/d/yyyy" CssClass="thongtin-formitem" TextMode="SingleLine" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>

                                <div style="float: left; width: 48%; margin-left: 4%;">
                                    <p class="address"></p>
                                    <p>
                                        <asp:TextBox ID="txtAddress" runat="server" CssClass="thongtin-formitem" ReadOnly="true"></asp:TextBox>
                                    </p>
                                </div>

                                <div style="clear: both;"></div>
                            </div>
                        </div>
                        <div class="div-list">
                            <div class="form-item">
                            </div>

                            <table style="width: 100%; font-size: 16px !important;">
                                <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                    <td style="width: 8%; font-weight: bold; padding-left: 10px; font-size: 14px;" class="ticketID"></td>
                                    <td style="width: 10%; font-weight: bold; color: #1977ea; font-size: 14px;" class="from"></td>
                                    <td style="width: 10%; font-weight: bold; font-size: 15px;" class="to"></td>
                                    <td style="width: 10%; font-weight: bold; color: #ff6a00; font-size: 14px;" class="trainName"></td>
                                    <td style="width: 10%; font-weight: bold; padding-left: 10px; font-size: 14px;" class="coachType"></td>
                                    <td style="width: 12%; font-weight: bold; color: #1977ea; font-size: 14px;" class="departureTime"></td>
                                    <td style="width: 12%; font-weight: bold; color: #ff6a00; font-size: 14px;" class="passengerType"></td>
                                    <td style="width: 10%; font-weight: bold; font-size: 14px;" class="price"></td>
                                    <td style="width: 10%; font-weight: bold; color: #ff6a00; font-size: 14px;" class="status"></td>
                                    <td style="width: 8%; text-align: right"></td>
                                </tr>
                                <asp:Repeater runat="server" ID="rpTo">
                                    <ItemTemplate>
                                        <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                            <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                                <td style="width: 8%; font-weight: bold; padding-left: 10px; font-size: 13px;">
                                                    <asp:Label ID="lblTKID" Text='<%#Eval("Ticket_ID") %>' runat="server" />
                                                </td>

                                                <td style="width: 10%; font-weight: bold; color: #1977ea; font-size: 13px;">
                                                    <asp:Label Text='<%#Eval("Origin_Station") %>' runat="server" />
                                                </td>
                                                <td style="width: 10%; font-weight: bold; font-size: 15px;">
                                                    <asp:Label Text='<%#Eval("Destination_Station") %>' runat="server" /></td>
                                                <td style="width: 10%; font-weight: bold; color: #ff6a00; font-size: 13px;">
                                                    <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" />
                                                </td>
                                                <td style="width: 10%; font-weight: bold; padding-left: 10px; font-size: 13px;">
                                                    <asp:Label Text='<%#Eval("Coach_Type") %>' runat="server" /></td>
                                                <td style="width: 12%; font-weight: bold; color: #1977ea; font-size: 13px;">
                                                    <asp:Label Text='<%#Eval("Departure_Date") %>' runat="server" />
                                                </td>
                                                <td style="width: 12%; font-weight: bold; color: #ff6a00; font-size: 13px;">
                                                    <asp:Label Text='<%#Eval("Passenger_Type") %>' runat="server" />
                                                </td>
                                                <td style="width: 10%; font-weight: bold; font-size: 13px;">
                                                    <asp:Label ID="lblTKPR" Text='<%#Eval("Price") %>' runat="server" />
                                                </td>
                                                <td style="width: 10%; font-weight: bold; color: #ff6a00; font-size: 13px;">
                                                    <asp:Label ID="lblStt" Text='<%#Eval("Status") %>' runat="server" />
                                                </td>
                                                <td style="width: 8%; font-weight: bold; color: #ff6a00; font-size: 13px;">
                                                    <asp:Button Text="Delete" runat="server" ID="btnChonKH" CssClass="btnChon" CommandArgument='<%#Eval("Ticket_ID") %>' OnCommand="btnChonKH_Command" /></td>
                                            </tr>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </div>
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnS" />
            </Triggers>
        </asp:UpdatePanel>
        <div style="clear: both"></div>
    </div>
</asp:Content>

