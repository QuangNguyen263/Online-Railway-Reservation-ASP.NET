<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Book_ticket.aspx.cs" Inherits="Desktop_Book_Ticket" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h3 class="tientrinh-so" style="background-color: #388cf2; color: #ffffff; padding: 6px 9px;"><i class="fa fa-check"></i></h3>
            <h3 class="tientrinh-chu selectTrain" style="color: #388cf2;"></h3>
            <h3 class="tientrinh-dau" style="color: #388cf2;"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so" style="background-color: #ff6a00; color: #ffffff;">2</h3>
            <h3 class="tientrinh-chu infoTrain" style="color: #ff6a00;"></h3>
            <h3 class="tientrinh-dau" style="color: #ff6a00;"><i class="fa fa-angle-right"></i></h3>

            <h3 class="tientrinh-so">3</h3>
            <h3 class="tientrinh-chu complete"></h3>
        </div>
        <div class="div-left">
            <div class="div-thongtinchuyen">
                <h3 style="padding-bottom: 10px" class="infoTrip"></h3>
                <div class="div-thongtinchuyen1">
                    <p class="oneway">
                        : <span class="thongtinchuyen">
                            <asp:Label ID="lblStationFrom" runat="server"></asp:Label></span>-<span class="thongtinchuyen"><asp:Label ID="lblStationTo" runat="server"></asp:Label></span>
                        <span class="thongtinchuyen2 day"><span class="thongtinchuyen">
                            <asp:Label ID="lblDeparture_Date" Text="" runat="server" /></span></span>
                    </p>
                    <p class="time">
                        : <span class="thongtinchuyen">
                            <asp:Label ID="lblDaparture_Time" Text="" runat="server" /></span>-<span class="thongtinchuyen"><asp:Label ID="lblArrival_Time" Text="" runat="server" /></span>
                        <span class="thongtinchuyen2 idTrain"><span class="thongtinchuyen">
                            <asp:Label ID="lblTrainID" runat="server" Text="Label"></asp:Label></span></span>
                    </p>
                </div>
                <asp:Panel runat="server" ID="pnCV" Visible="False">
                    <div class="div-thongtinchuyen2">
                        <p class="returnJourney">
                            : <span class="thongtinchuyen ">
                                <asp:Label ID="lblKHStationFrom" runat="server" Text=""></asp:Label></span>-<span class="thongtinchuyen"><asp:Label ID="lblKHStationTo" runat="server" Text=""></asp:Label></span><span class="thongtinchuyen2 day"> <span class="thongtinchuyen">
                                    <asp:Label ID="lblKHDeparture_Date" Text="" runat="server" /></span></span>
                        </p>
                        <p class="time">
                            : <span class="thongtinchuyen ">
                                <asp:Label ID="lblKHDeparture_Time" Text="" runat="server" /></span>-<span class="thongtinchuyen"><asp:Label ID="lblKHArrival_Time" Text="" runat="server" /></span><span class="thongtinchuyen2 idTrain"> <span class="thongtinchuyen">
                                    <asp:Label ID="lblKHTrainID" runat="server" Text=""></asp:Label></span></span>
                        </p>
                    </div>
                </asp:Panel>
            </div>
            <div class="div-thongtinchuyen">
                <h3 style="padding-bottom: 10px" class="customerInfo"></h3>
                <div style="float: left; width: 20%;">
                    <p class="title"></p>
                    <p>
                        <asp:DropDownList ID="DropDownGen" runat="server" CssClass="thongtin-formitem">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </p>
                </div>
                <div style="float: left; width: 30%; margin-left: 4%;">
                    <p class="lastN"></p>
                    <p>
                        <asp:TextBox ID="txtHo" runat="server" CssClass="thongtin-formitem"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reHo" runat="server" ErrorMessage="First Name Incorrect" ControlToValidate="txtHo" ValidaonGroup="checkData" ValidationExpression="^[a-zA-Z'-'\s]{1,40}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfHo" runat="server" ErrorMessage="First Name Is Empty" ControlToValidate="txtHo" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 42%; margin-left: 4%;">
                    <p class="firstN"></p>
                    <p>
                        <asp:TextBox ID="txtName" runat="server" CssClass="thongtin-formitem"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reName" runat="server" ErrorMessage="Last Name Incorrect" ControlToValidate="txtName" ValidaonGroup="checkData" ValidationExpression="^[a-zA-Z'-'\s]{1,40}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfName" runat="server" ErrorMessage="Last Name Is Empty" ControlToValidate="txtName" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both; margin-bottom: 10px"></div>
                <div style="float: left; width: 48%;">
                    <p>Email (*)</p>
                    <p>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="thongtin-formitem" TextMode="Email"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reMail" runat="server" ErrorMessage="Email Incorrect" ControlToValidate="txtEmail" ValidaonGroup="checkData" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfMail" runat="server" ErrorMessage="Email Is Empty" ControlToValidate="txtEmail" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 48%; margin-left: 4%;">
                    <p class="reconfirmE"></p>
                    <p>
                        <asp:TextBox ID="txtCFEmail" runat="server" CssClass="thongtin-formitem" TextMode="Email"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reCFMail" runat="server" ErrorMessage="Confirm Email Incorrect" ControlToValidate="txtCFEmail" ValidaonGroup="checkData" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,4})+)$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfCFMail" runat="server" ErrorMessage="Confirm Email Is Empty" ControlToValidate="txtCFEmail" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:CompareValidator ErrorMessage="Email Is Not True" ControlToValidate="txtCFEMail" runat="server" ControlToCompare="txtEmail" Display="Dynamic" />
                <div style="clear: both; margin-bottom: 10px;"></div>
                <div style="float: left; width: 48%;">
                    <p class="birth">(*)</p>
                    <p>
                        <asp:TextBox ID="txtDOB" runat="server" placeholder="M/d/yyyy" CssClass="thongtin-formitem" TextMode="SingleLine"></asp:TextBox>
                    </p>
                    <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="txtDOB" TargetControlID="txtDOB" ViewStateMode="Disabled" />
                    <asp:RegularExpressionValidator ID="reCalendarFrom" runat="server" ErrorMessage="Date Of Birth Incorrect" ControlToValidate="txtDOB" ValidaonGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfCalendarFrom" runat="server" ErrorMessage="Date Of Birth Is Empty" ControlToValidate="txtDOB" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 48%; margin-left: 4%;">
                    <p class="phone">(*)</p>
                    <p>
                        <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="thongtin-formitem" TextMode="Phone"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="rePhone" runat="server" ErrorMessage="Phonenumber Incorrect" ControlToValidate="txtPhoneNumber" ValidaonGroup="checkData" ValidationExpression="^[0-9\-\+]{9,15}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfPhone" runat="server" ErrorMessage="Phonenumber Is Empty" ControlToValidate="txtPhoneNumber" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 100%;">
                    <p class="address"></p>
                    <p>
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="thongtin-formitem"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reAddress" runat="server" ErrorMessage="Address Incorrect" ControlToValidate="txtAddress" ValidaonGroup="checkData" ValidationExpression="^[A-Za-z0-9\.\-\s\,\/]+$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>

                <div style="clear: both;"></div>
            </div>
            <div class="div-thongtinchuyen">
                <h3 style="padding-bottom: 10px" class="infoPayment"></h3>
                <div style="float: left; width: 20%;">
                </div>
                <div style="float: left; width: 48%;">
                    <p class="bankName"></p>
                    <p>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="thongtin-formitem"></asp:TextBox>
                    </p>
                    <asp:RegularExpressionValidator ID="reUsername" runat="server" ErrorMessage="Username Incorrect" ControlToValidate="txtUsername" ValidaonGroup="checkData" ValidationExpression="^[a-zA-Z'-'\s]{1,40}$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfUsername" runat="server" ErrorMessage="Username Is Empty" ControlToValidate="txtUsername" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="float: left; width: 48%; margin-left: 4%;">
                    <p class="pass"></p>
                    <p>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="thongtin-formitem" TextMode="Password"></asp:TextBox>
                    </p>
                    <asp:RequiredFieldValidator ID="rfPassword" runat="server" ErrorMessage="Password Is Empty" ControlToValidate="txtPassword" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both; margin-bottom: 10px"></div>
                <div style="float: left; width: 100%">
                    <p class="cardCode"></p>
                    <p>
                        <asp:TextBox ID="txtCC" runat="server" CssClass="thongtin-formitem"></asp:TextBox>
                    </p>
                    <%--  <asp:RegularExpressionValidator ID="reCardcode" runat="server" ErrorMessage="Card Code Incorrect" ControlToValidate="txtCC" ValidaonGroup="checkData" ValidationExpression="^[0-9\-\+]{9,20}$" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                    <asp:RequiredFieldValidator ID="rfCardcode" runat="server" ErrorMessage="Card Code Is Empty" ControlToValidate="txtCC" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <div style="clear: both;"></div>
                <p style="text-align: center">
                    <asp:Button Text="Thanh Toán" SkinID="btnpayment" runat="server" ID="btn_Dat" class="btnSimple" ValidationGroup="checkData" OnCommand="btn_Dat_Command" />
                    <p>
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblKQ" Text="" runat="server" />
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btn_Dat" />
                            </Triggers>
                        </asp:UpdatePanel>
                        <asp:UpdateProgress runat="server">
                            <ProgressTemplate>
                                <p style="text-align: center">
                                    <img src="../images/loading.gif" alt="Alternate Text" width="60" height="60" /></p>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </p>
                </p>
            </div>
        </div>
        <div class="div-right">
            <div class="div-thongtinchuyen">
                <h3 style="padding-bottom: 10px" class="infoGo"></h3>
                <table class="table-thanhtoan" cellspacing="0">
                    <tr>
                        <th class="passengerType"></th>
                        <th class="class"></th>
                        <th class="coachCode"></th>
                        <th class="price"></th>
                        <th class="number"></th>
                        <th class="money"></th>
                    </tr>
                    <tr>
                        <td class="adults"></td>
                        <td>
                            <asp:DropDownList ID="DropDownAdultCoachType" runat="server" OnSelectedIndexChanged="DropDownAdultCoachType_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>AC 1</asp:ListItem>
                                <asp:ListItem>Sleeper</asp:ListItem>
                                <asp:ListItem>First Class</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList ID="DropDownAdultMT" runat="server" OnSelectedIndexChanged="DropDownAdultMT_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropdownAdult" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownAdultCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Label ID="lblCoachPrice" runat="server" Text="0"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownAdultMT" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownAdultCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropdownAdult" runat="server" OnSelectedIndexChanged="DropdownAdult_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblTotalPrice" runat="server" Text="0"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropdownAdult" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownAdultMT" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownAdultCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="childs"></td>
                        <td>
                            <asp:DropDownList ID="DropDownChildrenCoachType" runat="server" OnSelectedIndexChanged="DropDownBabyCoachType_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>AC 1</asp:ListItem>
                                <asp:ListItem>Sleeper</asp:ListItem>
                                <asp:ListItem>First Class</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:DropDownList ID="DropDownChildrenMT" runat="server" OnSelectedIndexChanged="DropDownBabyMT_SelectedIndexChanged" AutoPostBack="True">
                                    </asp:DropDownList>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildren" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildrenCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:Label ID="lblChildrenCoachPrice" runat="server" Text="0"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildrenMT" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildrenCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownChildren" runat="server" OnSelectedIndexChanged="DropDownBaby_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:Label ID="lblChildrenTotalPrice" runat="server" Text="0"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildren" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildrenMT" />
                                    <asp:AsyncPostBackTrigger ControlID="DropDownChildrenCoachType" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <tr>
                        <td class="babys"></td>
                        <td></td>
                        <td></td>
                        <td>0</td>
                        <td>
                            <asp:DropDownList ID="DropDownBaby" runat="server" AutoPostBack="True">
                                <asp:ListItem>0</asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>7</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>9</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                            </asp:DropDownList></td>
                        <td>0</td>
                    </tr>
                </table>
                <asp:Panel runat="server" ID="TTTTKH" Wrap="True" Visible="False">
                    <h3 style="padding-bottom: 10px" class="infoReturn"></h3>
                    <table class="table-thanhtoan" cellspacing="0">
                        <tr>
                            <th class="passengerType"></th>
                            <th class="class"></th>
                            <th class="coachCode"></th>
                            <th class="price"></th>
                            <th class="number"></th>
                            <th class="money"></th>
                        </tr>
                        <tr>
                            <td class="adults"></td>
                            <td>
                                <asp:DropDownList ID="DropdownHKAdultCoachType" runat="server" OnSelectedIndexChanged="DropdownHKAdultCoachType_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>AC 1</asp:ListItem>
                                    <asp:ListItem>Sleeper</asp:ListItem>
                                    <asp:ListItem>First Class</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DropDownKHAdultMT" runat="server" OnSelectedIndexChanged="DropDownKHAdultMT_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKAdultCoachType" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownKHAdult" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblKHCoachPrice" runat="server" Text="0"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKAdultCoachType" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownKHAdultMT" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropdownKHAdult" runat="server" OnSelectedIndexChanged="DropdownKHAdult_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <asp:Label ID="lblKHTotalPrice" runat="server" Text="0"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropDownKHAdultMT" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownKHAdult" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKAdultCoachType" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="childs"></td>
                            <td>
                                <asp:DropDownList ID="DropdownHKChildrenCoachType" runat="server" OnSelectedIndexChanged="DropdownHKBabyCoachType_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>AC 1</asp:ListItem>
                                    <asp:ListItem>Sleeper</asp:ListItem>
                                    <asp:ListItem>First Class</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:DropDownList ID="DropDownKHChildrenMT" runat="server" OnSelectedIndexChanged="DropDownKHBabyMT_SelectedIndexChanged" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKChildrenCoachType" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKChildren" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblKHChildrenCoachPrice" runat="server" Text="0"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKChildrenCoachType" />
                                        <asp:AsyncPostBackTrigger ControlID="DropDownKHChildrenMT" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropdownHKChildren" runat="server" OnSelectedIndexChanged="DropdownHKBaby_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Label ID="lblKHChildrenTotalPrice" runat="server" Text="0"></asp:Label>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="DropDownKHChildrenMT" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKChildren" />
                                        <asp:AsyncPostBackTrigger ControlID="DropdownHKChildrenCoachType" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </td>
                        </tr>
                        <tr>
                            <td class="babys"></td>
                            <td></td>
                            <td></td>
                            <td>0</td>
                            <td>
                                <asp:DropDownList ID="DropdownKHBaby" runat="server" AutoPostBack="True">
                                    <asp:ListItem>0</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>0</td>
                        </tr>
                    </table>
                </asp:Panel>
                <p style="font-style: italic; padding-top: 10px;" class="unit"></p>
                <div class="tonggia">
                    <span style="float: left;" class="total"></span>
                    <span style="float: right">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Label ID="lblTotal" runat="server" Text="0"></asp:Label>
                                $
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="DropdownAdultMT" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownAdultCoachType" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownAdult" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownChildrenCoachType" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownChildren" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownChildrenMT" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownKHAdultMT" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownHKAdultCoachType" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownKHAdult" />
                                <asp:AsyncPostBackTrigger ControlID="DropDownKHChildrenMT" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownHKChildrenCoachType" />
                                <asp:AsyncPostBackTrigger ControlID="DropdownHKChildren" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </span>
                    <div style="clear: both"></div>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
</asp:Content>

