using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Passenger_Manager : System.Web.UI.Page
{
    static string pnr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (int.Parse(Session["role"].ToString()) == 2)
            {
                if (!IsPostBack)
                {
                    dgPass.DataSource = new ServiceReference1.Service1Client().GetAll_Passengers();
                    dgPass.DataBind();
                    btnU.Attributes["Onclick"] = "return confirm('Do you really want to update?')";
                    btnD.Attributes["Onclick"] = "return confirm('Do you really want to delete?')";
                    Recycle();
                }
            }
            else
            {
                Response.Redirect("Admin_manager.aspx");
            }
        }
    }

    protected void Recycle()
    {
        var a = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
        foreach (var item in a)
        {
            if (item.Status == "Active" && item.Departure_Date < DateTime.Now.Date)
            {
                item.Status = "Block";
            }
        }
    }
    protected void dgPass_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lbl = (Label)e.Item.FindControl("lblPNR");
        pnr = lbl.Text;
        ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
        ServiceReference1.get_Passenger_By_PNR_Result pass = sr.Get_Passenger_By_PNR(pnr);
        txtPNR.Text = pass.PNR.ToString();
        txtName.Text = pass.Passenger_Name.ToString();
        txtBirth.Text = pass.Date_Of_Birth.Value.Date.ToShortDateString();
        txtE.Text = pass.Email.ToString();
        txtPhone.Text = pass.Phone_Number.ToString();
        btnC.Visible = true;
        btnU.Visible = true;
        btnD.Visible = true;
        txtPNR.ReadOnly = true;
    }
    protected void btnU_Click(object sender, EventArgs e)
    {
        ServiceReference1.Passenger passenger = new ServiceReference1.Passenger();
        passenger.PNR = pnr;
        passenger.Passenger_Name = txtName.Text;
        passenger.Date_Of_Birth = DateTime.Parse(txtBirth.Text);
        passenger.Phone_Number = txtPhone.Text;
        passenger.Email = txtE.Text;
        ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
        if (sr.Update_Passengers(passenger) == 1)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update successed !!!');", true);
            dgPass.DataSource = sr.GetAll_Passengers();
            dgPass.DataBind();
            Reset();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update failed !!!');", true);
        }
        
    }
    protected void btnD_Click(object sender, EventArgs e)
    {
        ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
        var a = sr.Search_Ticket_By_PNR(pnr);
        int d = 0;
        foreach (var item in sr.Search_Ticket_By_PNR(pnr))
        {
            if (item.Status == "active" && item.Departure_Date > DateTime.Now.Date) {
                d++;
            }
        }
        if (d>0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('PNR tickets still exist. Can not Delete. Please, try again !!!');", true);
        }
        else
        {
            if (sr.Delete_Passengers(pnr) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete passenger successed !!!');", true);
                dgPass.DataSource = sr.GetAll_Passengers();
                dgPass.DataBind();
                Reset();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete passenger failed !!!');", true);
            }
        }
    }

    protected void Reset()
    {
        txtName.Text = null;
        txtBirth.Text = null;
        txtE.Text = null;
        txtPhone.Text = null;
        txtPNR.Text = null;
        txtPNR.ReadOnly = false;
        btnD.Visible = false;
        btnC.Visible = false;
        btnU.Visible = false;
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        pnr = txtPNR.Text;
        ServiceReference1.get_Passenger_By_PNR_Result pass = new ServiceReference1.Service1Client().Get_Passenger_By_PNR(pnr);
        if (pass == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('No result found. Try again !!!');", true);
            Reset();
        }
        else
        {
            txtName.Text = pass.Passenger_Name.ToString();
            txtBirth.Text = pass.Date_Of_Birth.ToString();
            txtE.Text = pass.Email.ToString();
            txtPhone.Text = pass.Phone_Number.ToString();
            btnD.Visible = true;
            btnC.Visible = true;
            btnU.Visible = true;
        }

    }
    protected void btnC_Click(object sender, EventArgs e)
    {
        Reset();
    }
}