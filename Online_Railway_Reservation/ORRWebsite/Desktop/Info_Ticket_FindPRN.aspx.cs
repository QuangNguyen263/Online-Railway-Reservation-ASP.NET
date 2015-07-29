using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Info_Ticket_FindPRN : System.Web.UI.Page
{
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
    protected void btnSearch_Command(object sender, CommandEventArgs e)
    {
        string gpnr = null;
        if (new ServiceReference1.Service1Client().Get_Passenger_By_Email(txtEmail.Text.Trim(), txtPN.Text.Trim()) == null)
        {
            lblKQ.Text = "Your Email Or Phone Number Incorrect";
        }
        else
        {
            int n1 = 0;
            foreach (var n in new ServiceReference1.Service1Client().Get_Passenger_By_Email(txtEmail.Text.Trim(), txtPN.Text.Trim()))
            {
                gpnr += (n.PNR + " <br/> ");
                n1 += 1;
            }
            if (n1 != 0)
            {
                lblKQ.Text = new CheckValidate.CheckDataValidate().send_Mail("Online Railway Reservation", txtEmail.Text.Trim(), "PRN Code", "Your PRN: <br/>" + gpnr + " Please Check Your Ticket In Website!");
            }
            else
            {
                lblKQ.Text = "Your Email Or Phone Number Incorrect";
            }
            
        } 
    }
}