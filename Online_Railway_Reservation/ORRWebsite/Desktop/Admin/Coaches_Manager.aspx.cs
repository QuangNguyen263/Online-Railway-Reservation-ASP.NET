using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Coaches_Manager : System.Web.UI.Page
{
    static int id, _train_id;

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
                    BindingData_Table();
                    BindingData_TrainName();
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

    protected void BindingData_Table()
    {
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        dgCoaches.DataSource = sv.GetAll_Coaches_v2();
        dgCoaches.DataBind();
    }

    protected void BindingData_TrainName()
    {
        List<ServiceReference1.getAll_Trains_Result> lst = new List<ServiceReference1.getAll_Trains_Result>();
        var kq = new ServiceReference1.Service1Client().GetAll_Trains();
        foreach (var item in kq)
        {
            if (item.Status == "Active")
            {
                lst.Add(item);
            }
        }

        ddlTrainName.DataSource = lst;
        ddlTrainName.DataTextField = "Train_Name";
        ddlTrainName.DataValueField = "Train_ID";
        ddlTrainName.DataBind();
    }
    protected void dgCoaches_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lbl = (Label)e.Item.FindControl("lblid");
        id = int.Parse(lbl.Text);
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        ServiceReference1.get_Coach_By_ID_Result coaches = sv.Get_Coach_By_ID(id);
        // get train name
        string trainname = sv.get_Train_By_ID(int.Parse(coaches.Train_ID.ToString())).Train_Name;
        // show data
        ddlTrainName.SelectedValue = coaches.Train_ID.ToString();
        ddlCoachesType.SelectedItem.Text = coaches.Coach_Type;
        txtSeats.Text = coaches.Number_Of_Seats.ToString();
        _train_id = int.Parse(coaches.Train_ID.ToString());
        txtPrices.Text = coaches.Price.ToString();
        if (coaches.Status.ToString() == "Active")
        {
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
        }
        else
        {
            RadioButton2.Checked = true;
            RadioButton1.Checked = false;
        }

        ddlTrainName.Enabled = false;
        ddlCoachesType.Enabled = false;
        btnUpdate.Visible = true;
        btnDelete.Visible = true;
        btnCancel.Visible = true;
        btnAdd.Visible = false;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Coach coach = new ServiceReference1.Coach();
            coach.Train_ID = int.Parse(ddlTrainName.SelectedValue);
            coach.Coach_Type = ddlCoachesType.SelectedItem.Text;
            coach.Number_Of_Seats = int.Parse(txtSeats.Text);
            coach.Price = double.Parse(txtPrices.Text);
            if (RadioButton1.Checked)
            {
                coach.Status = RadioButton1.Text;
            }
            else
            {
                coach.Status = RadioButton2.Text;
            }

            ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
            if (sv.Add_Coaches(coach) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add coach successed !!!');", true);
                BindingData_Table();
                BindingData_TrainName();
                Reset();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add coach failed !!!');", true);
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Coach coach = new ServiceReference1.Coach();
            coach.Coach_ID = id;
            coach.Train_ID = int.Parse(ddlTrainName.SelectedValue);
            coach.Coach_Type = ddlCoachesType.SelectedItem.Text;
            coach.Number_Of_Seats = int.Parse(txtSeats.Text);
            coach.Price = double.Parse(txtPrices.Text);
            if (RadioButton1.Checked)
            {
                coach.Status = RadioButton1.Text;
            }
            else
            {
                coach.Status = RadioButton2.Text;
            }
            if (coach.Status == "Block")
            {
                var a = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
                int dem = 0;
                foreach (var item in a)
                {
                    if (item.Train_ID == _train_id && item.Departure_Date > DateTime.Now.Date)
                    {
                        dem++;
                    }
                }
                if (dem > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Tickets of this coach still exist. Can not Block. Please, try again !!!');", true);
                }
                else
                {
                    ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
                    if (sv.Update_Coaches(coach) == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update coach successed !!!');", true);
                        BindingData_Table();
                        BindingData_TrainName();
                        Reset();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update coach failed !!!');", true);
                    }
                }
            }

        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
            var a = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
            int dem = 0;
            foreach (var item in a)
            {
                if (item.Train_ID == _train_id && item.Departure_Date > DateTime.Now.Date)
                {
                    dem++;
                }
            }
            if (dem > 0)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Tickets of this coach still exist. Can not Delete. Please, try again !!!');", true);
            }
            else
            {
                if (sv.Delete_Coaches(id) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete coach successed !!!');", true);
                    BindingData_Table();
                    BindingData_TrainName();
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete coach failed !!!');", true);
                }
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void btnSearchCoach_Click(object sender, EventArgs e)
    {
        int TrainID = int.Parse(ddlTrainName.SelectedValue);
        var kq = new ServiceReference1.Service1Client().Get_Coach_By_Train(TrainID);

        if (kq.Count() != 0)
        {
            dgCoaches.DataSource = kq;
            DataBind();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('No result found. Try again !!!');", true);
        }
    }

    protected void Reset()
    {
        txtPrices.Text = null;
        txtSeats.Text = null;

        ddlCoachesType.Enabled = true;
        ddlTrainName.Enabled = true;

        string[] coach_type = { "AC 1", "AC 2", "Sleeper", "First Class" };
        ddlCoachesType.DataSource = coach_type;
        ddlCoachesType.DataBind();

        btnAdd.Visible = true;
        btnUpdate.Visible = false;
        btnDelete.Visible = false;
        btnCancel.Visible = false;
    }
}