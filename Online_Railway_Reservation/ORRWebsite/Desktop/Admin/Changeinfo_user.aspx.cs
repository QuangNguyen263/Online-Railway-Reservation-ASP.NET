using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Changeinfo_user : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                Binding_data();
                btnAccess.Attributes["Onclick"] = "return confirm('Do you really want to change?')";
                btnSave.Attributes["Onclick"] = "return confirm('Do you really want to change?')";
            }
        }
    }
    protected void btnAccess_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string opass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtCpass.Text, "SHA1");
            var oldpass = new ServiceReference1.Service1Client().Get_User_By_UserName_v2(Session["username"].ToString()).Password;
            if (opass != oldpass)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Current Password is incorrect !!!');", true);
            }
            else
            {
                ServiceReference1.User user = new ServiceReference1.User();
                user.Username = Session["username"].ToString();
                string pass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtNpass.Text, "SHA1");
                user.Password = pass;
                ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
                if (sr.Update_Password(user) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Change successed !!!');", true);
                    Binding_data();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Error: Try again !!!');", true);
                }
            }
        }        
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.User user = new ServiceReference1.User();
            user.Username = Session["username"].ToString();
            user.Email = txtEmail.Text;
            user.Phone_Number = txtPhone.Text;
            user.Gender = ddlGender.SelectedItem.Text;
            ServiceReference1.Service1Client sr = new ServiceReference1.Service1Client();
            if (sr.Update_Info(user) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Successed !!!');", true);
                Binding_data();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Error: Try again !!!');", true);
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Binding_data();
    }

    protected void Binding_data()
    {
        var user = new ServiceReference1.Service1Client().Get_User_By_UserName_v2(Session["username"].ToString());
        txtUser.Text = user.Username;
        txtRole.Text = user.Role_Name;
        txtEmail.Text = user.Email;
        txtPhone.Text = user.Phone_Number;
        ddlGender.SelectedValue = user.Gender;
    }
}