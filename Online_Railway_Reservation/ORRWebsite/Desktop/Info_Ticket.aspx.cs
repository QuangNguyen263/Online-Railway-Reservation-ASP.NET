using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Info_Ticket : System.Web.UI.Page
{
    static ServiceReference1.get_Passenger_By_PNR_Result gb;
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void Page_PreInit(object sender, EventArgs e)
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
    public void data()
    {
        gb = new ServiceReference1.Service1Client().Get_Passenger_By_PNR(txtInput.Text.Trim());
        if (gb != null)
        {
            if (gb.Email == txtEmailIP.Text.Trim() && gb.Phone_Number == txtPhoneNumberIP.Text.Trim())
            {
                lblKQ.Text = "";
                pnShow.Visible = true;
                txtHoTen.Text = gb.Passenger_Name;
                txtPNR.Text = gb.PNR;
                txtEmail.Text = gb.Email;
                txtPhoneNumber.Text = gb.Phone_Number;
                txtDOB.Text = gb.Date_Of_Birth.Value.ToShortDateString();
                txtAddress.Text = gb.Address;
                if (new ServiceReference1.Service1Client().get_Ticket_By_PNR(gb.PNR) != null)
                {
                    rpTo.DataSource = new ServiceReference1.Service1Client().get_Ticket_By_PNR(gb.PNR);
                    rpTo.DataBind();
                }
            }
            else
            {
                lblKQ.Text = "Passenger Information Incorrect.Please Try Again!";
            }
           
        }
        else
        {
            lblKQ.Text = "PNR Code Incorrect.Please Try Again!";
        }
    }
    protected void btnS_Command(object sender, CommandEventArgs e)
    {
        data();
    }
    protected void btnChonKH_Command(object sender, CommandEventArgs e)
    {
        int n = Convert.ToInt32(e.CommandArgument);
        foreach (RepeaterItem it in rpTo.Items)
        {
            Label lbltkid = (Label)it.FindControl("lblTKID");
            Label lbltkpr = (Label)it.FindControl("lblTKPR");
            if (n == Convert.ToInt32(lbltkid.Text))
            {
                float nn = float.Parse(lbltkpr.Text.Trim());
                ServiceReference2.Service1Client sv2 = new ServiceReference2.Service1Client();
                if (sv2.TransferAmount("adm12345678910", nn - (nn * 10 / 100), "Trans") == 1)
                {
                    sv2.TransferAmount(gb.Card_Code, nn - (nn * 10 / 100), "Add");
                    if (new ServiceReference1.Service1Client().Cancel_Ticket(n, "Block") == 1)
                    {
                        data();
                    }
                    else
                    {
                      
                    }
                }
                else
                {

                }
                break;
            }
        }
    }
}