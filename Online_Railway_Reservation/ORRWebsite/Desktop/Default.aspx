<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Desktop_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- begin Content -->
    <div id="content-bg">
        <div id="form-content">
            <div class="form-head"></div>
            <%--<h3 class="form-head">Tìm vé tàu</h3>--%>
            <div id="c-form1">
                <p class="form-main-title form1"></p>
                <%--   <div class="form-item">
                    <asp:RadioButton ID="rbtnKH" runat="server" GroupName="rdg" OnCheckedChanged="rbtnKH_CheckedChanged1" AutoPostBack="True" Checked="True" />
                    Vé khứ hồi
                </div>--%>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-map-marker depature"></i></p>
                    <asp:DropDownList ID="DropDownFrom" runat="server" CssClass="ddl"></asp:DropDownList>
                </div>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-calendar depaturedate"></i></p>
                    <asp:TextBox ID="datefrom" class="ddl" runat="server" placeholder="MM/dd/yyyy" TextMode="SingleLine"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="datefrom" TargetControlID="datefrom" ViewStateMode="Disabled" />
                    <asp:RegularExpressionValidator ID="reCalendarFrom" runat="server" ErrorMessage="Origination Date Incorrect" ControlToValidate="datefrom" ValidaonGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="rfCalendarFrom" runat="server" ErrorMessage="Origination Date Is Empty" ControlToValidate="datefrom" ValidationGroup="checkData" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>
                <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Label ID="lblCheckStations" Text="" runat="server" Visible="False" />
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                        </Triggers>
                    </asp:UpdatePanel>
            </div>
            <div id="c-form2">
                <p class="form-main-title2">2. Fake fake</p>
                <%--  <div class="form-item">
                    <asp:RadioButton ID="rbtnMC" runat="server" GroupName="rdg" AutoPostBack="True" OnCheckedChanged="rbtnMC_CheckedChanged" />
                    Vé một chiều
                </div>--%>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-map-marker arrival"></i></p>
                    <asp:DropDownList ID="DropDownTo" runat="server" CssClass="ddl"></asp:DropDownList>
                </div>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-calendar returndate"></i></p>
                    <asp:TextBox ID="dateto" class="ddl" runat="server" placeholder="MM/dd/yyyy"></asp:TextBox>
                    <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="dateto" TargetControlID="dateto" ViewStateMode="Disabled" />
                    <asp:RegularExpressionValidator ID="reCalendaTo" runat="server" ErrorMessage="Destination Date Incorrect" ControlToValidate="dateto" ValidationGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>
                </div>
            </div>
                    
            <div id="o-c-form" class="o-c-form">
                <p class="form-main-title form2"></p>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-user adult"></i></p>
                    <asp:DropDownList ID="DropDownAdult" runat="server" CssClass="ddl2">
                        <asp:ListItem Text="0"></asp:ListItem>
                        <asp:ListItem Text="1"></asp:ListItem>
                        <asp:ListItem Text="2"></asp:ListItem>
                        <asp:ListItem Text="3"></asp:ListItem>
                        <asp:ListItem Text="4"></asp:ListItem>
                        <asp:ListItem Text="5"></asp:ListItem>
                        <asp:ListItem Text="6"></asp:ListItem>
                        <asp:ListItem Text="7"></asp:ListItem>
                        <asp:ListItem Text="8"></asp:ListItem>
                        <asp:ListItem Text="9"></asp:ListItem>
                        <asp:ListItem Text="10"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-male child"></i></p>
                    <asp:DropDownList ID="DropDownChildren" runat="server" CssClass="ddl2">
                        <asp:ListItem Text="0"></asp:ListItem>
                        <asp:ListItem Text="1"></asp:ListItem>
                        <asp:ListItem Text="2"></asp:ListItem>
                        <asp:ListItem Text="3"></asp:ListItem>
                        <asp:ListItem Text="4"></asp:ListItem>
                        <asp:ListItem Text="5"></asp:ListItem>
                        <asp:ListItem Text="6"></asp:ListItem>
                        <asp:ListItem Text="7"></asp:ListItem>
                        <asp:ListItem Text="8"></asp:ListItem>
                        <asp:ListItem Text="9"></asp:ListItem>
                        <asp:ListItem Text="10"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-item">
                    <p class="form-title"><i class="fa fa-user-plus baby"></i></p>
                    <asp:DropDownList ID="DropDownBaby" runat="server" CssClass="ddl2">
                        <asp:ListItem Text="0"></asp:ListItem>
                        <asp:ListItem Text="1"></asp:ListItem>
                        <asp:ListItem Text="2"></asp:ListItem>
                        <asp:ListItem Text="3"></asp:ListItem>
                        <asp:ListItem Text="4"></asp:ListItem>
                        <asp:ListItem Text="5"></asp:ListItem>
                        <asp:ListItem Text="6"></asp:ListItem>
                        <asp:ListItem Text="7"></asp:ListItem>
                        <asp:ListItem Text="8"></asp:ListItem>
                        <asp:ListItem Text="9"></asp:ListItem>
                        <asp:ListItem Text="10"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <asp:Button Text="Tìm kiếm" SkinID="btnSearch" runat="server" ID="btnSearch" ValidationGroup="checkData" CssClass="btnSearch" OnCommand="btnSearch_Command" />
            <br />
            <br />
            <div id="form-footer">
                <a href="Rule.aspx">
                    <p><i class="fa fa-info-circle"></i><span class="form-info"></span></p>
                </a>
            </div>
        </div>
    </div>

    <!-- end Content -->

    <!-- begin Auto -->

    <%-- <div id="auto">
        <div id="auto-left" style="float: left;">
            <img src="images/station.png" height="35" />
        </div>
        <div id="auto-cent" style="float: left; overflow:hidden">
            <marquee behavior="alternate"> 
                <img src="images/train-5-256.png" height="35" />
                <img src="images/11696689_887012111345285_607302743_n.jpg" height="35" />
                <img src="images/11696689_887012111345285_607302743_n.jpg" height="35" />
                <img src="images/11696689_887012111345285_607302743_n.jpg" height="35" />
                <img src="images/train-5-256p.png" height="35" />
            </marquee>
        </div>
        <div id="auto-right" style="float: right">
            <img src="images/stationp.png" height="35" />
        </div>
    </div>--%>

    <!-- end Auto -->
</asp:Content>

