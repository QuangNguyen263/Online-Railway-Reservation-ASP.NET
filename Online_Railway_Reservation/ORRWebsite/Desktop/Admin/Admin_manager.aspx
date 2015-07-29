<%@ Page Title="" Language="C#" MasterPageFile="~/Desktop/MasterPage.master" AutoEventWireup="true" CodeFile="Admin_manager.aspx.cs" Inherits="Desktop_Admin_Admin_Manager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="item-group">
        <div class="tientrinh">
            <h1>ADMIN MANAGEMENT</h1>
        </div>
        <asp:UpdatePanel runat="server" ID="up1">
            <ContentTemplate>
                <div class="div-manager-left" style="margin-left: 10px">
                    <asp:HyperLink ID="station" runat="server" NavigateUrl="Station_Manager.aspx"><div class="manager-item manager-item-left"><i class="fa fa-map-marker" style="padding-right:20px"></i>Stations Management</div></asp:HyperLink>
                    <asp:HyperLink ID="train" runat="server" NavigateUrl="Train_Manager.aspx"><div class="manager-item manager-item-left"><i class="fa fa-subway" style="padding-right:20px"></i> Trains Management</div></asp:HyperLink>
                    <asp:HyperLink ID="coach" runat="server" NavigateUrl="Coaches_Manager.aspx"><div class="manager-item manager-item-left"><i class="fa fa-dashcube" style="padding-right:20px"></i>Coaches Management</div></asp:HyperLink>
                    <asp:HyperLink ID="schedule" runat="server" NavigateUrl="Schedule_Manager.aspx"><div class="manager-item manager-item-left"><i class="fa fa-calendar" style="padding-right:20px"></i>Schedules Management</div></asp:HyperLink>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server" ID="up2">
            <ContentTemplate>
                <div class="div-manager-right">
                    <asp:HyperLink ID="passenger" runat="server" NavigateUrl="Passenger_Manager.aspx"><div class="manager-item manager-item-right">Passengers Management<i class="fa fa-users" style="padding-left:20px"></i></div></asp:HyperLink>
                    <asp:HyperLink ID="ticket" runat="server" NavigateUrl="Ticket_Manager.aspx"><div class="manager-item manager-item-right">Tickets Management<i class="fa fa-ticket" style="padding-left:20px"></i></div></asp:HyperLink>
                    <asp:HyperLink ID="user" runat="server" NavigateUrl="User_Manager.aspx"><div class="manager-item manager-item-right">Users Management<i class="fa fa-user" style="padding-left:20px"></i></div></asp:HyperLink>
                    <asp:HyperLink ID="change" runat="server" NavigateUrl="Changeinfo_user.aspx"><div class="manager-item manager-item-right">Change Information<i class="fa fa-file-text-o" style="padding-left:20px"></i></div></asp:HyperLink>
                    
                </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="clear: both"></div>
    </div>
</asp:Content>

