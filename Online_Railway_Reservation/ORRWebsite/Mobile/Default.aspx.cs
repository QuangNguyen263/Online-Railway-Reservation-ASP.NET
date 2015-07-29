using CheckValidate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Mobile_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbBookingData.Rows.Clear();
            tbBookingData.Columns.Clear();
            tbBookingData.Columns.Add("tbFrom", typeof(int));
            tbBookingData.Columns.Add("tbTo", typeof(int));
            tbBookingData.Columns.Add("tbTrainFrom", typeof(int));
            tbBookingData.Columns.Add("tbTrainTo", typeof(int));
            tbBookingData.Columns.Add("tbTimeFrom", typeof(int));
            tbBookingData.Columns.Add("tbTimeTo", typeof(int));
            tbBookingData.Columns.Add("tbStationfrom", typeof(string));
            tbBookingData.Columns.Add("tbStationto", typeof(string));
            tbBookingData.Columns.Add("tbDatefrom", typeof(string));
            tbBookingData.Columns.Add("tbDateto", typeof(string));
            tbBookingData.Columns.Add("tbNumberOfAdult", typeof(int));
            tbBookingData.Columns.Add("tbNumberOfBaby", typeof(int));
            tbBookingData.Columns.Add("tbNumberOfChildren", typeof(int));
            LoadData();
        }
    }
    //Default page
    static DataTable tbBookingData = new DataTable();
    string StringFrom, StringTo, DFrom, DTo;
    int SFrom, STo;
    protected void Unnamed_Command(object sender, CommandEventArgs e)
    {
        //if (!IsPostBack)
        //{
           
          
        //}
    }
    public void LoadData()
    {
        DropDownFrom.DataSource = new ServiceReference1.Service1Client().GetAll_Stations();
        DropDownFrom.DataTextField = "Station_Name";
        DropDownFrom.DataValueField = "Station_ID";
        DropDownFrom.DataBind();
        DropDownTo.DataSource = new ServiceReference1.Service1Client().GetAll_Stations();
        DropDownTo.DataTextField = "Station_Name";
        DropDownTo.DataValueField = "Station_ID";
        DropDownTo.DataBind();
    }
    protected void btnSearch_Command(object sender, CommandEventArgs e)
    {
        if (!new CheckDataValidate().CheckStations(DropDownFrom.SelectedItem.ToString().Trim(), DropDownTo.SelectedItem.ToString().Trim()))
        {
            lblCheckStations.Visible = true;
            lblCheckStations.Text = "Origin Station And Destination Station Incorrect";
            //Response.Redirect("default.aspx#page2");
        }
        else
        {
            SFrom = Convert.ToInt32(DropDownFrom.SelectedItem.Value);
            STo = Convert.ToInt32(DropDownTo.SelectedItem.Value);
            StringFrom = DropDownFrom.SelectedItem.ToString();
            StringTo = DropDownTo.SelectedItem.ToString();
            if (!new CheckDataValidate().CheckRealDate(datefrom.Text.Trim()))
            {
                lblCheckStations.Visible = true;
                lblCheckStations.Text = "Please Choose Real Time";
                //btnSearch.PostBackUrl = "#page2";
            }
            else
            {
                DFrom = datefrom.Text.Trim();
                //if (dateto.Text.Trim() == "")
                //{
                    DTo = null;
                    tbBookingData.Rows.Add(SFrom, STo, 0, 0, 0, 0, StringFrom, StringTo, DFrom, null, Convert.ToInt32(DropDownAdult.SelectedItem.Value), Convert.ToInt32(DropDownBaby.SelectedItem.Value), Convert.ToInt32(DropDownChildren.SelectedItem.Value));
                    Session["BookingData"] = tbBookingData;
                    lblFrom.Text = StringFrom;
                    lblTo.Text = StringTo;
                    lblOrtime.Text = DFrom;
                    lblAdultNumber.Text = Convert.ToInt32(DropDownAdult.SelectedItem.Value) + "";
                    lblBabyNumber.Text = Convert.ToInt32(DropDownBaby.SelectedItem.Value) + "";
                    lblChildrenNumber.Text = Convert.ToInt32(DropDownChildren.SelectedItem.Value) + "";
                    btnSearch.PostBackUrl = "#page5";
                    //Response.Redirect("Choose_ticket.aspx");
                //}
                //else
                //{
                //    if (!new CheckDataValidate().Compare2Date(datefrom.Text.Trim(), dateto.Text.Trim()))
                //    {
                //        lblCheckStations.Visible = true;
                //        lblCheckStations.Text = "Destination Date Incorrect";
                //        //btnSearch.PostBackUrl = "#page2";
                //    }
                //    else
                //    {
                //        DTo = dateto.Text.Trim();
                //        lblCheckStations.Visible = false;
                //        tbBookingData.Rows.Add(SFrom, STo, 0, 0, 0, 0, StringFrom, StringTo, DFrom, DTo, Convert.ToInt32(DropDownAdult.SelectedItem.Value), Convert.ToInt32(DropDownBaby.SelectedItem.Value), Convert.ToInt32(DropDownChildren.SelectedItem.Value));
                //        Session["BookingData"] = tbBookingData;
                //        //Response.Redirect("Choose_ticket.aspx");
                //        btnSearch.PostBackUrl = "#page5";
                        
                //    }

                //}
            }
        }
    }
}