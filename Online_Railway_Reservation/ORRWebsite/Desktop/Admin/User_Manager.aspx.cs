using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_User_Manager : System.Web.UI.Page
{
    static string username, pass, security_code; // declare variable to store temporary data.
    static int role;
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
                    BindingData_RoleType();
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
    protected void BindingData_Table() // binding data to datagrid users
    {
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        dgUser.DataSource = sv.GetAll_Users();
        dgUser.DataBind();
    }
    protected void BindingData_RoleType() // binding data to dropdownlist Role Type
    {
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        ddlUserType.DataSource = sv.GetAll_Roles();
        ddlUserType.DataTextField = "Role_Name";
        ddlUserType.DataValueField = "Role_ID";
        ddlUserType.DataBind();
    }
    protected void Reset()
    {
        txtUsername.Text = null;
        txtEmail.Text = null;
        txtPhone.Text = null;
        ddlUserType.Enabled = true;
        txtUsername.Enabled = true;
        btnCancel.Visible = false;
        btnDelete.Visible = false;
        btnUpdate.Visible = false;
        btnAdd.Visible = true;
        BindingData_RoleType();
    }
    protected string Checking_Gender()
    {
        if (rdMale.Checked)
        {
            return rdMale.Text;
        }
        else if (rdFemale.Checked)
        {
            return rdFemale.Text;
        }
        else
        {
            return rdOther.Text;
        }
    }
    protected void Search_User(string user_name)
    {
        ServiceReference1.Get_User_By_UserName_v2_Result user = new ServiceReference1.Service1Client().Get_User_By_UserName_v2(user_name);
        username = user.Username;
        pass = user.Password;
        security_code = user.Security_Code;
        txtUsername.Text = user.Username;
        txtEmail.Text = user.Email;
        txtPhone.Text = user.Phone_Number;
        switch (user.Gender)
        {
            case "Male": rdMale.Checked = true;
                break;
            case "Female": rdFemale.Checked = true;
                break;
            case "Other": rdOther.Checked = true;
                break;
        }
        ddlUserType.SelectedValue = user.Role_ID.ToString();
        if (user.Role_Name == "Admin")
        {
            ddlUserType.Enabled = false;
            btnDelete.Visible = false;
        }
        else
        {
            ddlUserType.Enabled = true;
            btnDelete.Visible = true;
        }
        txtUsername.Enabled = false;
        btnAdd.Visible = false;
        btnUpdate.Visible = true;
        btnCancel.Visible = true;
    }
    protected bool Check_username(string username)
    {
        var kq = new ServiceReference1.Service1Client().GetAll_Users();
        foreach (var i in kq)
        {
            if (txtUsername.Text == i.Username)
            {
                return false;
            }
        }
        return true;
    }
    protected string RandomString()
    {
        StringBuilder sb = new StringBuilder();
        char c;
        Random rand = new Random();
        for (int i = 0; i < 3; i++)
        {
            c = Convert.ToChar(Convert.ToInt32(rand.Next(48, 57)));
            sb.Append(c);
        }
        for (int i = 0; i < 3; i++)
        {
            c = Convert.ToChar(Convert.ToInt32(rand.Next(65, 90)));
            sb.Append(c);
        }
        for (int i = 0; i < 3; i++)
        {
            c = Convert.ToChar(Convert.ToInt32(rand.Next(48, 57)));
            sb.Append(c);
        }
        return sb.ToString();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.User user = new ServiceReference1.User();
            user.Username = txtUsername.Text;
            user.Email = txtEmail.Text;
            user.Phone_Number = txtPhone.Text;
            user.Gender = Checking_Gender();
            user.Role_ID = int.Parse(ddlUserType.SelectedValue);
            string pass_tusinh = RandomString();
            string pass = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pass_tusinh, "SHA1"); // encrypt password
            user.Password = pass;
            user.Security_Code = pass;
            if (Check_username(user.Username) == false)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Username already exist !!!');", true);
            }
            else
            {
                if (new ServiceReference1.Service1Client().Add_Users(user) == 1)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add user successed !!!');", true);
                    BindingData_Table();
                    try
                    {
                        //clsEmail _cls = new clsEmail();
                        new CheckValidate.CheckDataValidate().send_Mail(user.Username,txtEmail.Text.Trim(),"Message from ONLINE RAILWAY RESERVATION SYSTEM","<h2 style='color:#0091d4; text-align:center'>ONLINE RAILWAY RESERVATION SYSTEM</h2><br/> " + "<h3 style='text-align:center; font-weight:bold'>YOUR ACCOUNT</h3><br/><br/>" + "Username: " + user.Username + "<br/>" + "Password: " + pass_tusinh);
                        //string returnCode = _cls.send_Mail(txtEmail.Text, "Message from ONLINE RAILWAY RESERVATION SYSTEM", );
                    }
                    catch (Exception)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Can not send mail !!!');", true);
                    }
                    Reset();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Add coach failed !!!');", true);
                }
            }
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            ServiceReference1.User user = new ServiceReference1.User();
            user.Username = username;
            user.Email = txtEmail.Text;
            user.Phone_Number = txtPhone.Text;
            user.Gender = Checking_Gender();
            user.Role_ID = int.Parse(ddlUserType.SelectedValue);
            user.Password = pass;
            user.Security_Code = security_code;

            if (new ServiceReference1.Service1Client().Update_Users(user) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update user successed !!!');", true);
                BindingData_Table();
                Reset();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Update coach failed !!!');", true);
            }
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (new ServiceReference1.Service1Client().Delete_Users(username) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete user successed !!!');", true);
                BindingData_Table();
                Reset();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete coach failed !!!');", true);
            }

        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Reset();
    }
    protected void dgUser_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lblUsername = (Label)e.Item.FindControl("lblUsername");
        Search_User(lblUsername.Text);
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        if (sv.Get_User_By_UserName_v2(txtUsername.Text) == null)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('No result found. Try again !!!');", true);
        }
        else
        {
            Search_User(txtUsername.Text);
        }
    }

}