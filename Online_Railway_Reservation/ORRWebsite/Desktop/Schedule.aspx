<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Schedule.aspx.cs" Inherits="Desktop_Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="item-group">
        <asp:HiddenField ID="ValueStationLatitude" runat="server" />
        <asp:HiddenField ID="ValueStationLongitude" runat="server" />
        <asp:HiddenField ID="ValueStationID" runat="server" />
        <asp:HiddenField ID="ValueStationSL" runat="server" />
        
        <div class="div-left">
            <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
            <section id="result"></section>
            <section id="gMap">
            </section>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
            <script>
                $(document).ready(function () {
                    var StLa = document.getElementById("<%=ValueStationLatitude.ClientID%>").value;
                    var StLo = document.getElementById("<%= ValueStationLongitude.ClientID%>").value;
                    var StID = document.getElementById("<%= ValueStationID.ClientID%>").value;
                    var StatSL = document.getElementById("<%= ValueStationSL.ClientID%>").value;
                    var result = document.querySelector('#result');
                    var statid = document.querySelector('#stid');
                    navigator.geolocation.getCurrentPosition(geoFunc, errFunc);
                    function geoFunc(e) {
                        console.log(e);
                        var x = parseInt(StatSL);
                        var gtid = null;
                        var mangStLa = StLa.split(' ');
                        var mangStLo = StLo.split(' ');
                        var mangStID = StID.split(' ');
                        var lati = e.coords.latitude;
                        var loti = e.coords.longitude;
                        var accu = e.coords.accuracy;
                        result.innerHTML += 'Latitude: ' + lati + '<br>Longitude: ' + loti + '<br>';
                        // Google Map
                        var mapcanvas = document.createElement('div');
                        mapcanvas.id = 'mapcontainer';
                        mapcanvas.style.height = '500px';
                        mapcanvas.style.width = '100%';
                        document.querySelector('#gMap').appendChild(mapcanvas);
                        var coords = new google.maps.LatLng(lati, loti);
                        var options = {
                            zoom: 15,
                            center: coords,
                            mapTypeControl: true,
                            navigationControlOptions: {
                                style: google.maps.NavigationControlStyle.SMALL
                            },
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        };
                        var map = new google.maps.Map(document.getElementById("mapcontainer"), options);
                        var distance = 0;
                        var rendererOptions = { map: map };
                        directionsDisplay = new google.maps.DirectionsRenderer(rendererOptions);
                        // Begin route
                        var xx1 = parseFloat(mangStLa[0]);
                        var xx2 = parseFloat(mangStLo[0]);
                        //var dest_point = new google.maps.LatLng(xx1, xx2);
                        //var kd1 =  loti - xx2;
                        //var vd1 =  lati - xx1;
                        //var a1 = ((Math.sin(vd1 / 2)) * (Math.sin(vd1 / 2))) + Math.cos(lati) * Math.cos(xx1) * ((Math.sin(kd1 / 2)) * (Math.sin(kd1 / 2)));
                        //var c1 = 2 * Math.atan2(Math.sqrt(a1), Math.sqrt(1 - a1));
                        //var Dt = (6371 * c1) * Math.PI / 180;
                        //var kd1 = xx2 - loti;
                        //var vd1 = xx1 - lati;
                        var Dt = 0;
                        //var Dt = Math.sqrt((kd1 * kd1) + (vd1 * vd1));
                        var pkd = 0;
                        var pvd = 0;
                        for (i = 0; i < x; i++) {
                            var x1 = parseFloat(mangStLa[i]);
                            var x2 = parseFloat(mangStLo[i]);
                            var kd = loti - x2;
                            var vd = lati - x1;
                            var a = ((Math.sin(vd / 2)) * (Math.sin(vd / 2))) + Math.cos(lati) * Math.cos(x1) * ((Math.sin(kd / 2)) * (Math.sin(kd / 2)));
                            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
                            var distance = (6371 * c) * Math.PI / 180;
                            if (i == 0) {
                                Dt = distance;
                            }
                            if (distance - Dt <= 0) {
                                Dt = distance;
                                pkd = x2;
                                pvd = x1;
                                gtid = mangStID[i];
                            }
                        }
                        var start_point = new google.maps.LatLng(lati, loti);
                        var dest_point = new google.maps.LatLng(pvd, pkd);
                        var request = {
                            origin: dest_point,
                            destination: start_point,
                            travelMode: google.maps.DirectionsTravelMode.DRIVING
                        };
                        directionsService = new google.maps.DirectionsService();
                        directionsService.route(request, function (response, status) {
                            console.log(response);
                            if (status == google.maps.DirectionsStatus.OK) {
                                directionsDisplay.setDirections(response);
                                console.log(response);
                                distance = response.routes[0].legs[0].distance;

                            } else {
                                console.log('failed to get directions');
                            }
                        });

                        result.innerHTML += 'Your nearest train station: ' + (Dt * 1.609).toFixed(2) + " KM";
                        document.getElementById("<%=StaIDField.ClientID%>").value = gtid;
                    }
                    function errFunc(e) {
                        console.log(e);
                        PERMISSION_DENIED: 1
                        POSITION_UNAVAILABLE: 2
                        TIMEOUT: 3
                    }
                });
            </script>
            <asp:HiddenField ID="StaIDField"  runat="server"/>
        </div>
        <asp:Label ID="stid" runat="server" />
        <div class="div-right">
            <div class="div-head">
                <div class="div-chieudi oneway"></div>
                <div class="div-tentuyen">
                    <asp:Button ID="btnok"  Text="Get Schedule" Cssclass="btnSimple" runat="server" OnClick="btnok_Click"/>
                </div>
            </div>
            <div class="div-list">
                <div class="form-item">
                </div>
                <asp:UpdatePanel runat="server">
                        <ContentTemplate>   
                <table style="width: 100%; font-size: 16px !important;text-align:center">
                    <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                        <td style="width: 20%; padding-left: 10px" class="trainName"></td>
                        <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">Time
                        </td>
                        <td style="width: 15%; ">To</td>
                        <td style="width: 25%;  font-weight: bold; color: #ff6a00; font-size: 18px;">Train Type
                        </td>
                        <td style="width: 15%; "></td>
                    </tr>
                    <asp:Repeater runat="server" ID="rpTo">
                        <ItemTemplate>
                            <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                <tr style="border-radius: 10px; border: 1px solid #cdcdcd !important">
                                    <td style="width: 20%; padding-left: 10px">
                                        <asp:Label ID="lbltimetableToID" Text='<%#Eval("Timetable_ID").ToString() %>' runat="server" Visible="false" />
                                        <asp:Label ID="lblTToID" Text='<%#Eval("Train_ID").ToString() %>' runat="server" Visible="false" />
                                        <asp:Label Text='<%#Eval("Train_Name") %>' runat="server" /></td>
                                    <td style="width: 25%; font-weight: bold; color: #1977ea; font-size: 18px;">
                                        <asp:Label ID="lblDF" Text='<%#Eval("Departure_Date").ToString() %>' runat="server" />

                                        <asp:Label Text='<%#Eval("Departure_Time").ToString() %>' runat="server" Style="color: #ff6a00" />

                                    </td>
                                    <td style="width: 15%; text-align: right">
                                        <asp:Label ID="lblStTo" Text='<%#Eval("Station_Name").ToString() %>' runat="server" /></td>
                                    <td style="width: 25%; font-weight: bold; color: #ff6a00; font-size: 18px;">
                                        <asp:Label Text='<%#Eval("Train_Type").ToString() %>' runat="server" />
                                    </td>
                                    <td style="width: 15%; text-align: right">
                                        <asp:Button Text="Choose" runat="server" ID="btnChonKH" CssClass="btnChon" CommandArgument='<%#Eval("Train_ID").ToString() %>' OnCommand="btnChonKH_Command" /></td>
                                </tr>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                             </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnok" />
                        </Triggers>
                    </asp:UpdatePanel>

            </div>
        </div>
        <div style="clear: both"></div>
        <div class="div-btn">
            <p style="text-align: center">
                <asp:Button Text="Book Ticket" SkinID="btnbookTieck" runat="server" ID="btn_Dat" class="btnSimple" ValidationGroup="checkData" OnCommand="btn_Dat_Command" />
            </p>
            <br />
            <asp:UpdatePanel runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:Label ID="lblCheckValidate" style="text-align:center" Text="" runat="server" />
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btn_Dat" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </div>
</asp:Content>



