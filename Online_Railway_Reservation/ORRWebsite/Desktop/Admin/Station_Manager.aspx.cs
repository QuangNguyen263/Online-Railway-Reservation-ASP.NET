using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Station_Manager : System.Web.UI.Page
{
    static int ids;
    static double lo, la;
    static string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (int.Parse(Session["role"].ToString()) == 1)
            {
                if (!IsPostBack)
                {
                    Reset();
                    Button1.Attributes["Onclick"] = "return confirm('Do you really want to add?')";
                    Button2.Attributes["Onclick"] = "return confirm('Do you really want to update?')";
                    Button3.Attributes["Onclick"] = "return confirm('Do you really want to delete?')";  
                }
            }
            else
            {
                Response.Redirect("Admin_manager.aspx");
            }
        }

    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Station station = new ServiceReference1.Station();
            station.Station_Name = txtNamestation.Text;
            station.Longtitude = Convert.ToDouble(txtLong.Text);
            station.Latitude = Convert.ToDouble(txtLa.Text);
            if (rbtn1.Checked)
            {
                station.Status = rbtn1.Text;
            }
            else
            {
                station.Status = rbtn2.Text;
            }
            ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
            if (Check_Name() == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('This station has already existed. Please check the coordinate or the name of the station again !!!');", true);
            }
            else
            {
                if (sr.Add_Stations(station) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add successed !!!');", true);
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add failed !!!');", true);
                }
            }
        }
    }
    protected void btnUp_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Station station = new ServiceReference1.Station();
            station.Station_ID = ids;
            station.Station_Name = txtNamestation.Text;
            station.Longtitude = Convert.ToDouble(txtLong.Text);
            station.Latitude = Convert.ToDouble(txtLa.Text);
            if (rbtn1.Checked)
            {
                station.Status = "Active";
            }
            if (rbtn2.Checked)
            {
                station.Status = "Block";
            }
            if (Check_Location() == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('This station has already existed. Please check the coordinate or the name of the station again !!!');", true);
            }
            else
            {
                if (station.Status == "Block" && Check_Station() == false)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('There are still trains on this route. Can not Update. Please, try again !!!');", true);
                }
                else
                {
                    ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
                    if (sr.Update_Stations(station) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "thông báo", "alert('Update successed !!!');", true);
                        Reset();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "thông báo", "alert('Update failed !!!');", true);
                    }
                }
            }
        }
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Check_Station() == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('There are still trains on this route. Can not Delete. Please, try again !!!');", true);
            }
            else
            {
                ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
                if (sr.Delete_Stations(ids) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete sucessed !!!');", true);
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete failed !!!');", true);
                }
            }
        }
    }
    protected void dgStation_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lbl = (Label)e.Item.FindControl("lblIDs");
        ids = int.Parse(lbl.Text);
        ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
        ServiceReference1.get_Station_By_ID_Result station = sr.get_Station_By_ID(ids);
        txtNamestation.Text = station.Station_Name.ToString();
        txtLong.Text = station.Longtitude.Value.ToString();
        txtLa.Text = station.Latitude.ToString();
        lo = double.Parse(station.Longtitude.ToString());
        la = double.Parse(station.Latitude.ToString());
        name = station.Station_Name;
        if (station.Status.ToString() == "Active")
        {
            rbtn1.Checked = true;
            rbtn2.Checked = false;
        }
        else
        {
            rbtn1.Checked = false;
            rbtn2.Checked = true;
        }
        Button1.Visible = false;
        Button2.Visible = true;
        Button3.Visible = true;
        btnCancel.Visible = true;
        txtNamestation.ReadOnly = true;
    }
    protected void Reset()
    {
        ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
        dgStation.DataSource = sr.GetAll_Stations();
        dgStation.DataBind();
        txtNamestation.Text = null;
        txtLong.Text = null;
        txtLa.Text = null;
        Button1.Visible = true;
        Button2.Visible = false;
        Button3.Visible = false;
        btnCancel.Visible = false;
        txtNamestation.ReadOnly = false;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }

    protected bool Check_Name()
    {
        var stations = new ServiceReference1.Service1Client().GetAll_Stations();
        foreach (var item in stations)
        {
            if (txtNamestation.Text == item.Station_Name || double.Parse(txtLong.Text) == item.Longtitude || double.Parse(txtLa.Text) == item.Latitude)
            {
                return false;
            }
        }
        return true;
    }

    protected bool Check_Location()
    {
        var stations = new ServiceReference1.Service1Client().GetAll_Stations();
        foreach (var item in stations)
        {
            if (item.Station_Name != name && item.Latitude != la && item.Longtitude != lo)
            {
                if (txtNamestation.Text == item.Station_Name || double.Parse(txtLong.Text) == item.Longtitude || double.Parse(txtLa.Text) == item.Latitude)
                {
                    return false;
                }
            }
        }
        return true;
    }

    protected bool Check_Station()
    {
        var trains = new ServiceReference1.Service1Client().Get_All_Trains_v2();
        foreach (var item in trains)
        {
            if (ids == item.Origin_Station_ID || ids == item.Destination_Station_ID)
            {
                return false;
            }
        }
        return true;
    }

}