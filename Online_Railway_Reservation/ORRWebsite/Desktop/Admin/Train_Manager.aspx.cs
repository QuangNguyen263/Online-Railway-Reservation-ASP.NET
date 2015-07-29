using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Train_Manager : System.Web.UI.Page
{
    static int _train_id;
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
                    Binding_Datagrid();
                    Binding_Station();
                    btnAdd.Attributes["Onclick"] = "return confirm('Do you really want to add?')";
                    btnUpdate.Attributes["Onclick"] = "return confirm('Do you really want to update?')";
                    btnDelete.Attributes["Onclick"] = "return confirm('Do you really want to delete?')";  
                }
            }
            else
            {
                Response.Redirect("Admin_manager.aspx");
            }
        }
    }
    protected void Binding_Datagrid()
    {
        dgTrain.DataSource = new ServiceReference1.Service1Client().Get_All_Trains_v2();
        dgTrain.DataBind();
    }
    protected void Binding_Station()
    {
        List<ServiceReference1.getAll_Stations_Result> st = new List<ServiceReference1.getAll_Stations_Result>();
        var kq = new ServiceReference1.Service1Client().GetAll_Stations();
        foreach (var item in kq)
        {
            if (item.Status == "Active")
            {
                st.Add(item);
            }
        }
        ddl_station_destin.DataSource = st;
        ddl_station_destin.DataValueField = "station_id";
        ddl_station_destin.DataTextField = "station_name";
        ddl_station_destin.DataBind();
        ddl_station_origin.DataSource = st;
        ddl_station_origin.DataValueField = "station_id";
        ddl_station_origin.DataTextField = "station_name";
        ddl_station_origin.DataBind();
    }
    protected bool Check_Train_Name()
    {
        var stations = new ServiceReference1.Service1Client().Get_All_Trains_v2();
        foreach (var item in stations)
        {
            if (txttrain_name.Text == item.Train_Name)
            {
                return false;
            }
        }
        return true;
    }
    protected int Check_Train()
    {
        var kq = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
        int dem = 0;
        foreach (var item in kq)
        {
            if (item.Train_ID == _train_id && item.Status == "active" && item.Departure_Date > DateTime.Now.Date)
            {
                dem++;
            }
        }
        return dem;
    }
    public void Reset()
    {
        txttrain_name.Text = null;
        Binding_Station();
        btnAdd.Visible = true;
        btnCancel.Visible = false;
        btnUpdate.Visible = false;
        btnDelete.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Train train_info = new ServiceReference1.Train();
            train_info.Train_Name = txttrain_name.Text;
            train_info.Destination_Station_ID = int.Parse(ddl_station_destin.SelectedValue);
            train_info.Origin_Station_ID = int.Parse(ddl_station_origin.SelectedValue);
            if (rdActive.Checked)
            {
                train_info.Status = "Active";
            }
            if (rdBlock.Checked)
            {
                train_info.Status = "Block";
            }
            if (rdSpecial.Checked)
            {
                train_info.Train_Type = "Special";
            }
            if (rdDaily.Checked)
            {
                train_info.Train_Type = "Daily";
            }
            if (Check_Train_Name() == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('This train name has already existed. Try again !!!');", true);
            }
            else
            {
                if (ddl_station_destin.SelectedValue == ddl_station_origin.SelectedValue)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Destination station and Origin Station are the same !!!');", true);
                }
                else
                {
                    if (new ServiceReference1.Service1Client().Add_Trains(train_info) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add train successed !!!');", true);
                        Binding_Datagrid();
                        Reset();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add train failed !!!');", true);
                    }
                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Train train_info = new ServiceReference1.Train();
            train_info.Train_ID = _train_id;
            train_info.Train_Name = txttrain_name.Text;
            train_info.Destination_Station_ID = int.Parse(ddl_station_destin.SelectedValue);
            train_info.Origin_Station_ID = int.Parse(ddl_station_origin.SelectedValue);
            if (rdActive.Checked)
            {
                train_info.Status = "Active";
            }
            if (rdBlock.Checked)
            {
                train_info.Status = "Block";
            }
            if (rdSpecial.Checked)
            {
                train_info.Train_Type = "Special";
            }
            if (rdDaily.Checked)
            {
                train_info.Train_Type = "Daily";
            }
            if (train_info.Status == "Block" && Check_Train() > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Tickets for this train are still available. Can not Update. Please, try again !!!');", true);
            }
            else
            {
                if (new ServiceReference1.Service1Client().Update_Trains(train_info) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update train successed !!!');", true);
                    Binding_Datagrid();
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update train failed !!!');", true);
                }
            }
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (Check_Train() > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Tickets for this train are still available. Can not Delete. Please, try again !!!');", true);
            }
            else
            {
                if (new ServiceReference1.Service1Client().Delete_Trains(_train_id) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete train successed !!!');", true);
                    Binding_Datagrid();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete train failed !!!');", true);
                }
                Reset();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void dgTrain_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lbltrain_id = (Label)e.Item.FindControl("lbltrain_id");
        _train_id = int.Parse(lbltrain_id.Text);
        var train = new ServiceReference1.Service1Client().get_Train_By_ID(_train_id);
        txttrain_name.Text = train.Train_Name;
        txttrain_name.Enabled = false;
        ddl_station_destin.SelectedValue = train.Destination_Station_ID.ToString();
        ddl_station_origin.SelectedValue = train.Origin_Station_ID.ToString();
        if (train.Train_Type == "Special")
        {
            rdSpecial.Checked = true;
            rdDaily.Checked = false;
        }
        else
        {
            rdDaily.Checked = true;
            rdSpecial.Checked = false;
        }
        if (train.Status == "Active")
        {
            rdActive.Checked = true;
            rdBlock.Checked = false;
        }
        else
        {
            rdBlock.Checked = true;
            rdActive.Checked = false;
        }
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        btnCancel.Visible = true;
        btnAdd.Visible = false;
    }
}