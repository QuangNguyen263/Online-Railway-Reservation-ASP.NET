using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Admin_Manager : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            switch (int.Parse(Session["role"].ToString()))
            {
                case 1: 
                    schedule.Enabled = false;
                    passenger.Enabled = false;
                    ticket.Enabled = false;
                    break;
                case 2: 
                    schedule.Enabled = false;
                    station.Enabled = false;
                    train.Enabled = false;
                    coach.Enabled = false;
                    user.Enabled = false;
                    break;
                case 3: 
                    passenger.Enabled = false;
                    ticket.Enabled = false;
                    station.Enabled = false;
                    train.Enabled = false;
                    coach.Enabled = false;
                    user.Enabled = false;
                    break;
            }
        }
    }

}