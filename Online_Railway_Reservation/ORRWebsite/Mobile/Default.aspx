<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Mobile_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Online Railway Reservation System</title>
    <link href="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="http://code.jquery.com/mobile/1.0/jquery.mobile-1.0.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="css/style.css" type="text/css" />
    <link href="css/font-awesome.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function MM_jumpMenu(targ, selObj, restore) { //v3.0
            eval(targ + ".location='" + selObj.options[selObj.selectedIndex].value + "'");
            if (restore) selObj.selectedIndex = 0;
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div>
            <div data-role="page" id="page">
                <div data-role="header" class="header">
                    <p class="logo">
                        <a href="#page">
                            <img src="images/LOGO_n.png" height="80" /></a>
                    </p>
                    <h1>Hệ thống đặt vé tàu trực tuyến</h1>
                </div>
                <div data-role="content" class="bg-content">
                    <ul data-role="listview">
                        <li>
                            <asp:LinkButton PostBackUrl="#page2" Text="Find Ticket" runat="server" OnCommand="Unnamed_Command" />
                        </li>
                        <li><a href="#page3">Thông tin đặt chỗ</a></li>
                        <li><a href="#page4">Giờ tàu</a></li>
                        <li><a href="#page5">Quy định</a></li>
                        <li><a href="#page6">Contact</a></li>
                    </ul>
                </div>
                <div data-role="footer" class="footer">
                    <h4><i class="fa fa-copyright"></i>AA HCM - C1309G NVQD</h4>
                </div>
            </div>

            <!-- Tìm vé -->
            <div data-role="page" id="page2">
                <div data-role="header" class="header">
                    <p class="logo">
                        <a href="#page">
                            <img src="images/LOGO_n.png" height="80" /></a>
                    </p>
                    <h1>Hệ thống đặt vé tàu trực tuyến</h1>
                </div>
                <div data-role="content" class="content">
                    <h2 class="page-title">Tìm Vé Tàu</h2>
                    <div class="form-item">
                        <h3 class="main-title">Bước 1: Chọn hành trình</h3>
                    </div>
                    <div class="form-item form-title"><i class="fa fa-map-marker"></i>Ga đi</div>
                    <div class="form-item">
                        <asp:DropDownList ID="DropDownFrom" runat="server" CssClass="dll"></asp:DropDownList>
                        <%--<select class="dll">
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="mercedes">Mercedes</option>
        <option value="audi">Audi</option>
      </select>--%>
                    </div>
                    <div class="form-item form-title"><i class="fa fa-map-marker"></i>Ga đến</div>
                    <div class="form-item">
                        <%--<form name="form" id="form">--%>
                        <asp:DropDownList name="jumpMenu" ID="DropDownTo" runat="server" CssClass="dll"></asp:DropDownList>
                        <%-- <select name="jumpMenu" id="jumpMenu" onChange="MM_jumpMenu('parent',this,0)" class="dll">
          <option selected>Hà Nội</option>
          <option>Hà Nội</option>
        </select>--%>
                        <%--</form>--%>
                    </div>
                    <div class="form-item">
                        <h3 class="main-title">Bước 2: Chọn giờ đi</h3>
                    </div>
                    <div class="form-item form-title"><i class="fa fa-calendar"></i>Ngày đi</div>
                    <%--<div class="form-item">--%>
                    <%--<form name="form" id="form">--%>
                    <%--<select name="jumpMenu" id="jumpMenu" onChange="MM_jumpMenu('parent',this,0)" class="dll">
          <option selected>28/06/2015 - 07H30</option>
          <option>28/06/2015 - 09H30</option>
        </select>--%>
                    <%--</form>--%>
                    <%--</div>--%>
                    <div class="form-item">
                        <asp:TextBox ID="datefrom" class="ddl" runat="server" placeholder="MM/dd/yyyy"></asp:TextBox>
                        <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="datefrom" TargetControlID="datefrom" ViewStateMode="Disabled" />
                        <asp:RegularExpressionValidator ID="reCalendaTo" runat="server" ErrorMessage="Destination Date Incorrect" ControlToValidate="datefrom" ValidationGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                    <%--<div class="form-item form-title"><i class="fa fa-calendar"></i>Ngày về</div>--%>
                    <%--<div class="form-item">
                        <form name="form" id="form">
                            <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="dll">
                                <option selected>28/06/2015 - 07H30</option>
                                <option>28/06/2015 - 09H30</option>
                            </select>
                        </form>
                    </div>--%>
                   <%-- <div class="form-item">
                        <asp:TextBox ID="dateto" class="ddl" runat="server" placeholder="MM/dd/yyyy"></asp:TextBox>
                        <cc1:CalendarExtender runat="server" Format="M/d/yyyy" PopupButtonID="dateto" TargetControlID="dateto" ViewStateMode="Disabled" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Destination Date Incorrect" ControlToValidate="dateto" ValidationGroup="checkData" ValidationExpression="^([1-9]|1[012])[- /.]([1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d$" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>--%>
                    <div class="form-item">
                        <h3 class="main-title">Bước 3: Chọn số lượng vé</h3>
                    </div>
                    <div class="form-sl">
                        <div class="form-item dll2">
                            <p class="form-title2">Người lớn</p>
                            <p class="sub-title">(Trên 12 tuổi)</p>
                        </div>
                        <div class="form-item dll2">
                            <p class="form-title2">Trẻ em</p>
                            <p class="sub-title">(Từ 2- 12 tuổi)</p>
                        </div>
                        <div class="form-item dll2">
                            <p class="form-title2">Em bé</p>
                            <p class="sub-title">(Dưới 2 tuổi)</p>
                        </div>
                    </div>
                    <div class="form-sl">
                        <div class="dll2">
                            <%-- <form name="form" id="form">
                                <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="dll">
                                    <option selected>1</option>
                                    <option>2</option>
                                </select>
                            </form>--%>
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
                        <div class="dll2">
                            <%--   <form name="form" id="form">
                                <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="dll">
                                    <option selected>1</option>
                                    <option>2</option>
                                </select>
                            </form>--%>
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
                        <div class=" dll2">
                            <%-- <form name="form" id="form">
                                <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="dll">
                                    <option selected>1</option>
                                    <option>2</option>
                                </select>
                            </form>--%>
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
                    </div>
                    <div class="form-item">
                        <h3 class="main-title" style="visibility: hidden;">uhaiuhiee</h3>
                        <div style="border-top: 1px solid #fff !important; border-bottom: 1px solid #fff !important; padding: 5px 0">                     
                                 <asp:Button ID="btnSearch" style="text-decoration: none; font-size: 16px;" ValidationGroup="checkData" Text="Search" OnCommand="btnSearch_Command" runat="server" /><br />
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>   
                                    <asp:Label ID="lblCheckStations" Text="" runat="server" Visible="False" />     
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                                </Triggers>
                            </asp:UpdatePanel>   
                             
                        </div>
                    </div>
                </div>
                <div data-role="footer" class="footer">
                    <h4><i class="fa fa-copyright"></i>AA HCM - C1309G NVQD</h4>
                </div>
            </div>
            <!-- end tim ve -->

            <!-- Thông tin đặt chỗ -->
            <div data-role="page" id="page3">
                <div data-role="header">
                    <p class="logo">
                        <img src="images/LOGO_n.png" height="80" />
                    </p>
                    <h1>Hệ thống đặt vé tàu trực tuyến</h1>
                </div>
                <div data-role="content">
                    <h2>Tìm Vé Tàu</h2>
                </div>
                <div data-role="footer">
                    <h4><i class="fa fa-copyright"></i>Aprotrain Aptech HCM - C1309G NVQD</h4>
                </div>
            </div>
            <!-- end Thông tin đặt chổ -->

            <!---- Giờ tàu ----->
            <div data-role="page" id="page4">
                <div data-role="header">
                    <h1>Page Three</h1>
                </div>
                <div data-role="content">Content </div>
                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
            </div>
            <!-- end Giờ tàu -->

            <!-- Thông tin lịch trình đã chọn -->
            <div data-role="page" id="page5">
                <div data-role="header" class="header">
                    <p class="logo">
                        <a href="#page">
                            <img src="images/LOGO_n.png" height="80" /></a>
                    </p>
                    <h1>Hệ thống đặt vé tàu trực tuyến</h1>
                </div>
                <div data-role="content" class="bg-content content">
                    <h2 class="page-title">Thông tin vé</h2>
                    <h3>Chiều đi:</h3>
                    <div style="border: 1px solid #cdcdcd; height: auto; padding: 10px">
                        <div style="border-bottom: 1px solid #cdcdcd; padding: 10px 0">
                            <span style="float: left"><i class="fa fa-map-marker"></i>
                                <asp:Label ID="lblFrom" Text="" runat="server" /></span> <span style="float: right"><i class="fa fa-map-marker"></i>
                                    <asp:Label ID="lblTo" Text="" runat="server" /></span>
                            <div style="clear: both"></div>
                        </div>
                        <p>
                            <span style="float: left"><i class="fa fa-calendar"></i>Origin Date:</span>
                            <span style="float: right; font-weight: bold">
                                <asp:Label ID="lblOrtime" Text="" runat="server" /></span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-barcode"></i>Train ID:</span>
                            <span style="float: right; font-weight: bold"><asp:DropDownList ID="DropDownTrainID" runat="server"></asp:DropDownList></span>
                            <div style="clear: both"></div>
                        </p>
                         <p>
                            <span style="float: left"><i class="fa fa-subway"></i>Coach Type:</span>
                            <span style="float: right; font-weight: bold">
                                <asp:DropDownList ID="DropDownCoachType" runat="server">
                                    <asp:ListItem>AC1</asp:ListItem>
                                    <asp:ListItem>Sleeper</asp:ListItem>
                                    <asp:ListItem>First Class</asp:ListItem>
                                </asp:DropDownList></span>
                            <div style="clear: both"></div>
                        </p>
                            <p>
                            <span style="float: left"><i class="fa fa-subway"></i>Coach ID:</span>
                            <span style="float: right; font-weight: bold">
                                <asp:DropDownList ID="DropDownMT" runat="server"></asp:DropDownList></span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-clock-o"></i>Origin Time:</span>
                            <span style="float: right; font-weight: bold">
                                <asp:Label ID="lblTime" Text="" runat="server" /></span>
                            <div style="clear: both"></div>
                        </p>
                    <%--    <p>
                            <span style="float: left"><i class="fa fa-clock-o"></i>Giờ đến:</span>
                            <span style="float: right; font-weight: bold">23:05</span>
                            <div style="clear: both"></div>
                        </p>--%>
                    </div>

                    <!-- Chi tiết giá vé -->
                    <div style="border: 1px solid #cdcdcd; height: auto; padding: 10px">
                        <h4>Price Detail:</h4>
                        <p>
                            <span style="float: left"><i class="fa fa-male"></i>Adult:</span>
                            <span style="text-align: center">
                                <asp:Label ID="lblAdultNumber" Text="0" runat="server" /> x</span>
                            <span style="float: right; font-weight: bold">
                                <asp:Label ID="txtAdultPr" Text="" runat="server" /></span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-user"></i>Baby:</span>
                            <span style="text-align: center">
                                <asp:Label ID="lblBabyNumber" Text="0" runat="server" /> x</span>
                            <span style="float: right; font-weight: bold">
                                <asp:Label ID="lblBabyPr" Text="" runat="server" /></span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-user-plus"></i>Children:</span>
                            <span style="text-align: center">
                                <asp:Label ID="lblChildrenNumber" Text="0" runat="server" /> x</span>
                            <span style="float: right; font-weight: bold">0</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-calculator"></i>Total:</span>
                            <h2 style="float: right">
                                <asp:Label ID="lblTotal" Text="0" runat="server" /></h2>
                            <div style="clear: both"></div>
                        </p>

                    </div>
                   <%-- <h3>Chiều về:</h3>
                    <div style="border: 1px solid #cdcdcd; height: auto; padding: 10px">
                        <div style="border-bottom: 1px solid #cdcdcd; padding: 10px 0">
                            <span style="float: left"><i class="fa fa-map-marker"></i>Hà Nội</span> <span style="float: right"><i class="fa fa-map-marker"></i>Hồ Chí Minh</span>
                            <div style="clear: both"></div>
                        </div>
                        <p>
                            <span style="float: left"><i class="fa fa-calendar"></i>Ngày đi:</span>
                            <span style="float: right; font-weight: bold">Chủ nhật, 28/06/2015</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-clock-o"></i>Giờ khởi hành:</span>
                            <span style="float: right; font-weight: bold">21:05</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-clock-o"></i>Giờ đến:</span>
                            <span style="float: right; font-weight: bold">23:05</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-barcode"></i>Mã số chuyến:</span>
                            <span style="float: right; font-weight: bold">HN7575HCM</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-subway"></i>Mã số tàu:</span>
                            <span style="float: right; font-weight: bold">THG865432</span>
                            <div style="clear: both"></div>
                        </p>
                    </div>--%>

                    <!-- Chi tiết giá vé -->
                    <%--<div style="border: 1px solid #cdcdcd; height: auto; padding: 10px">
                        <h4>Chi tiết giá vé</h4>
                        <p>
                            <span style="float: left"><i class="fa fa-male"></i>Người lớn:</span>
                            <span style="text-align: center">1 x</span>
                            <span style="float: right; font-weight: bold">1.050.000 VND</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-user"></i>Trẻ em:</span>
                            <span style="text-align: center">1 x</span>
                            <span style="float: right; font-weight: bold">950.000 VND</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-user-plus"></i>Em bé:</span>
                            <span style="text-align: center">1 x</span>
                            <span style="float: right; font-weight: bold">0 VND</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-plus-square"></i>Thuế:</span>
                            <span style="float: right; font-weight: bold">10%</span>
                            <div style="clear: both"></div>
                        </p>
                        <p>
                            <span style="float: left"><i class="fa fa-calculator"></i>Tổng giá vé:</span>
                            <h2 style="float: right">2.100.000 VND</h2>
                            <div style="clear: both"></div>
                        </p>

                    </div>--%>
                    <div class="form-item">

                        <div style="margin-top: 20px; border-top: 1px solid #fff !important; border-bottom: 1px solid #fff !important; padding: 5px 0">
                            <a href="#" style="text-decoration: none; font-size: 16px;">
                                <button>Tiếp theo</button></a>
                            <a href="#page2" style="text-decoration: none 1!important; font-size: 16px;">
                                <button>Chọn vé khác</button></a>
                        </div>
                    </div>
                </div>
                <div data-role="footer" class="footer">
                    <h4><i class="fa fa-copyright"></i>AA HCM - C1309G NVQD</h4>
                </div>
            </div>
            <!-- end thông tin lịch trình -->

            <div data-role="page" id="page6">
                <div data-role="header">
                    <h1>Page Four</h1>
                </div>
                <div data-role="content">Content </div>
                <div data-role="footer">
                    <h4>Page Footer</h4>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
