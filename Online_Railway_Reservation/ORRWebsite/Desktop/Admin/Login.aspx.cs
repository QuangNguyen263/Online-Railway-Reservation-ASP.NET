using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] != null)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string pass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtpass.Text, "SHA1");
        var a = new ServiceReference1.Service1Client().Login(txtusername.Text, pass);
        if (a == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Username or Password are incorrect!!!');", true);
            txtusername.Text = null;
            txtpass.Text = null;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Login success !!!');", true);
            Session["username"] = txtusername.Text;
            Session["role"] = a.Role_ID;
           
            Response.Redirect("Admin_manager.aspx");
        }
    }
}