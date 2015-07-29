using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Schedule : System.Web.UI.Page
{
    static DataTable tbBookingData = new DataTable();
    int vl = 0;
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
            tbBookingData.Columns.Add("tbNumberOfChildren", typeof(int));
            tbBookingData.Columns.Add("tbNumberOfBaby", typeof(int));
        }

    }

    void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["lang"] == null)
        {
            Session["lang"] = "en";
        }
        if (Request.QueryString["lang"] != null)
        {
            if (Request.QueryString["lang"] == "en")
            {
                Session["lang"] = "en";
            }
            if (Request.QueryString["lang"] == "vi")
            {
                Session["lang"] = "vi";
            }
        }
        Page.Theme = Session["lang"].ToString();
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        getStation();
    }
    public void getStation()
    {
        string Lati = null;
        string Longi = null;
        string StationID = null;
        int SLST = 0;
        foreach (var n in new ServiceReference1.Service1Client().GetStationByStatus())
        {
            Lati += n.Latitude + " ";
            Longi += n.Longtitude + " ";
            StationID += n.Station_ID + " ";
            SLST += 1;
        }
        ValueStationLatitude.Value = Lati;
        ValueStationLongitude.Value = Longi;
        ValueStationID.Value = StationID;
        ValueStationSL.Value = SLST + "";
    }
    public void loadData(int oid)
    {
        List<int> lint = new List<int>();
        if (new ServiceReference1.Service1Client().Get_Train_OS(oid)!= null)
        {
            DataTable Data = new DataTable();
            Data.Rows.Clear();
            Data.Columns.Clear();
            Data.Columns.Add("Timetable_ID", typeof(int));
            Data.Columns.Add("Train_ID", typeof(int));
            Data.Columns.Add("Train_Name", typeof(string));
            Data.Columns.Add("Departure_Date", typeof(string));
            Data.Columns.Add("Departure_Time", typeof(string));
            Data.Columns.Add("Station_Name", typeof(string));
            Data.Columns.Add("Train_Type", typeof(string));
            foreach (var i in new ServiceReference1.Service1Client().Get_Train_OS(oid))
            {
                foreach (var n in new ServiceReference1.Service1Client().Get_Train_Time_Sche(i.Train_ID, DateTime.Now))
                {
                    string x = n.Departure_Date.Value.ToShortDateString();
                    Data.Rows.Add(n.Timetable_ID, n.Train_ID, n.Train_Name, x , n.Departure_Time, n.Station_Name, n.Train_Type);
                }
            }
            if (Data == null)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Notice:", "alert('They Hasn't Schedule For This Station!!!');", true);
            }
            else
            {
                rpTo.DataSource = Data;
                rpTo.DataBind(); 
            }
         
        }
    }
    protected void btnok_Click(object sender, EventArgs e)
    {
        try
        {
            vl = Convert.ToInt32(StaIDField.Value);
            loadData(vl);
        }
        catch (Exception)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Notice:", "alert('They Hasn't Schedule For This Station!!!');", true);
        }
    }
    protected void btnChonKH_Command(object sender, CommandEventArgs e)
    {
        int n = Convert.ToInt32(e.CommandArgument);
        int nn= 0;
        string st = null;
        string sf1 = null;
        string df = null;
        foreach (RepeaterItem it in rpTo.Items)
        {
            Label ttID = (Label)it.FindControl("lbltimetableToID");
            Label lblTID = (Label)it.FindControl("lblTToID");
            Label lblStTo = (Label)it.FindControl("lblStTo");
            Label lblDF = (Label)it.FindControl("lblDF");
            if (n == Convert.ToInt32(lblTID.Text))
            {
               nn = int.Parse(ttID.Text);
                st = lblStTo.Text.ToString();
                df = lblDF.Text.ToString();
            }
        }
        tbBookingData.Rows.Add(0, 0, n, 0, nn, 0, null, st, df, null, 0, 0, 0);
        Session["BookingData"] = tbBookingData;
        ScriptManager.RegisterStartupScript(this, GetType(), "Notice:", "alert('You Just Choose A Schedule !!!');", true);
    }
    protected void btn_Dat_Command(object sender, CommandEventArgs e)
    {
        if (Session["BookingData"] == null || (Session["BookingData"] as DataTable).Rows.Count == 0)
        {
          
            lblCheckValidate.Text = "Please Choose A Schedule!";
        }
        else
        {
            Response.Redirect("book_ticket.aspx");
        }
        
    }
}