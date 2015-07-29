using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Desktop_Admin_Schedule_Manager : System.Web.UI.Page
{
    static int _timetable, _train_id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (int.Parse(Session["role"].ToString()) == 3)
            {
                if (!IsPostBack)
                {
                    Binding_DataGrid();
                    Binding_TrainName();
                    Binding_Station(int.Parse(ddl_train_name.SelectedValue));
                    btnAdd.Attributes["Onclick"] = "return confirm('Do you really want to add?')";
                    btnDelete.Attributes["Onclick"] = "return confirm('Do you really want to delete?')";
                }
            }
            else
            {
                Response.Redirect("Admin_manager.aspx");
            }

        }
    }
    protected void Binding_DataGrid()
    {
        dgTimeTable.DataSource = new ServiceReference1.Service1Client().GetAll_Timetables_v2();
        dgTimeTable.DataBind();
    }
    protected void Binding_TrainName()
    {
        ddl_train_name.DataSource = new ServiceReference1.Service1Client().GetAll_Trains();
        ddl_train_name.DataValueField = "Train_ID";
        ddl_train_name.DataTextField = "Train_name";
        ddl_train_name.DataBind();
    }
    protected void Binding_Station(int Train_id)
    {
        var station = new ServiceReference1.Service1Client().get_Station_By_Train_ID(Train_id);
        txt_origin_station.Text = station.Origin_name;
        txt_destin_station.Text = station.Destin_name;
    }
    protected void Reset()
    {
        txt_date_depart.Text = null;
        txt_date_arrival.Text = null;
        ddl_hour_arrival.SelectedIndex = 0;
        ddl_hour_depart.SelectedIndex = 0;
        ddl_minute_arrival.SelectedIndex = 0;
        ddl_minute_depart.SelectedIndex = 0;
        txtDistance.Text = null;
        btnCancel.Visible = false;
        btnDelete.Visible = false;
        btnAdd.Visible = true;
        txt_date_arrival.ReadOnly = false;
        txt_date_depart.ReadOnly = false;
        ddl_hour_arrival.Enabled = true;
        ddl_hour_depart.Enabled = true;
        ddl_minute_arrival.Enabled = true;
        ddl_minute_depart.Enabled = true;
        txtDistance.ReadOnly = false;

    }
    protected int Check_Ticket()
    {
        int dem = 0;
        var kq = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
        foreach (var item in kq)
        {
            if (item.Train_ID == _train_id && item.Departure_Date > DateTime.Now.Date)
            {
                dem++;
            }
        }
        return dem;
    }
    protected void ddl_train_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        var station = new ServiceReference1.Service1Client().get_Station_By_Train_ID(int.Parse(ddl_train_name.SelectedValue));
        txt_origin_station.Text = station.Origin_name;
        txt_destin_station.Text = station.Destin_name;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Timetable timetable = new ServiceReference1.Timetable();
            timetable.Train_ID = int.Parse(ddl_train_name.SelectedValue);
            timetable.Departure_Date = DateTime.Parse(txt_date_depart.Text).Date;
            timetable.Departure_Time = TimeSpan.Parse(ddl_hour_depart.SelectedItem.Text + ":" + ddl_minute_depart.SelectedItem.Text);
            timetable.Arrival_Date = DateTime.Parse(txt_date_arrival.Text).Date;
            timetable.Arrival_Time = TimeSpan.Parse(ddl_hour_arrival.SelectedItem.Text + ":" + ddl_minute_arrival.SelectedItem.Text);
            timetable.Distance = int.Parse(txtDistance.Text);
            if (timetable.Departure_Date <= DateTime.Now.Date || timetable.Arrival_Date <= DateTime.Now.Date || timetable.Arrival_Date<timetable.Departure_Date)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Choose date error !!!');", true);
            }
            else
            {
                if (timetable.Departure_Date == timetable.Arrival_Date)
                {
                    if (timetable.Departure_Time >= timetable.Arrival_Time)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Choose hour error !!!');", true);
                    }
                    else
                    {
                        if (new ServiceReference1.Service1Client().Add_Timetables(timetable) == 1)
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add timetable successed !!!');", true);
                            Binding_DataGrid();
                            Reset();
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add timetable failed !!!');", true);
                        }
                    }
                }
                else
                {
                    if (new ServiceReference1.Service1Client().Add_Timetables(timetable) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add timetable successed !!!');", true);
                        Binding_DataGrid();
                        Reset();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add timetable failed !!!');", true);
                    }
                }

            }
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Check_Ticket() > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Schedule tickets still exist. Can not Delete. Please, try again !!!');", true);
            }
            else
            {
                if (new ServiceReference1.Service1Client().Delete_Timetables(_timetable) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete timetable successed !!!');", true);
                    Binding_DataGrid();
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete timetable failed !!!');", true);
                }
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void dgTimeTable_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lblid = (Label)e.Item.FindControl("lblid");
        _timetable = int.Parse(lblid.Text);
        var timetable = new ServiceReference1.Service1Client().get_Timetable_By_ID(_timetable);
        _train_id = int.Parse(timetable.Train_ID.ToString());
        ddl_train_name.SelectedValue = timetable.Train_ID.ToString();
        Binding_Station(int.Parse(timetable.Train_ID.ToString()));
        txt_date_depart.Text = timetable.Departure_Date.Value.Date.ToString();
        txt_date_arrival.Text = timetable.Arrival_Date.Value.Date.ToString();
        ddl_hour_depart.SelectedItem.Text = timetable.Departure_Time.Value.Hours.ToString();
        ddl_hour_arrival.SelectedItem.Text = timetable.Arrival_Time.Value.Hours.ToString();
        ddl_minute_depart.SelectedItem.Text = timetable.Departure_Time.Value.Minutes.ToString();
        ddl_minute_arrival.SelectedItem.Text = timetable.Arrival_Time.Value.Minutes.ToString();
        txtDistance.Text = timetable.Distance.ToString();
        btnAdd.Visible = false;
        btnDelete.Visible = true;
        btnCancel.Visible = true;
        txt_date_arrival.ReadOnly = true;
        txt_date_depart.ReadOnly = true;
        ddl_hour_arrival.Enabled = false;
        ddl_hour_depart.Enabled = false;
        ddl_minute_arrival.Enabled = false;
        ddl_minute_depart.Enabled = false;
        txtDistance.ReadOnly = true;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        var schedule = new ServiceReference1.Service1Client().Get_Timetable_By_Train_ID(int.Parse(ddl_train_name.SelectedValue));
        if (schedule.Count() > 0)
        {
            dgTimeTable.DataSource = schedule;
            dgTimeTable.DataBind();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('No result found. Try again !!!');", true);
        }
    }
}