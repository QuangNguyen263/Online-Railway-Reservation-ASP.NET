using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Forget_pass : System.Web.UI.Page
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
        var user = new ServiceReference1.Service1Client().Get_User_By_UserName_v2(txtusername.Text);
        if (user != null && txtmail.Text == user.Email)
        {
            try
            {
                new CheckValidate.CheckDataValidate().send_Mail(user.Username, user.Email, "Message from ONLINE RAILWAY RESERVATION SYSTEM", "<h2 style='color:#0091d4; text-align:center'>ONLINE RAILWAY RESERVATION SYSTEM</h2><br/> " + "<h3 style='text-align:center; font-weight:bold'>YOUR NEW PASSWORD</h3><br/><br/>" + "Username: " + user.Username + "<br/>" + "Password: " + user.Security_Code);
                string pass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(user.Security_Code, "SHA1"); // encrypt password
                ServiceReference1.User u = new ServiceReference1.User();
                u.Username = user.Username;
                u.Password = pass;
                if(new ServiceReference1.Service1Client().Update_Password(u) == 1){
                    lblkq.Text = "Check mail to receive new password";
                }
            }
            catch (Exception)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Can not send mail !!!');", true);
            }
        }
        else
        {
            lblkq.Text = "Username or email are incorrect";
        }
    }
}