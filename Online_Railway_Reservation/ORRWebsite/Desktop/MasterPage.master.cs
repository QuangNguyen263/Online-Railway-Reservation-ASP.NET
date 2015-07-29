using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            btnLogin.Visible = false;
            btnLogout.Visible = true;
            lblManager.Visible = true;
        }
        else
        {
            btnLogin.Visible = true;
            btnLogout.Visible = false;
            lblManager.Visible = false;
        }
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
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Desktop/Admin/Login.aspx");
    }
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Session["role"] = null;
        Response.Redirect("/Desktop/Default.aspx");
    }
}
