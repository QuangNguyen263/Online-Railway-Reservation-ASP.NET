using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Admin_Ticket_Manager : System.Web.UI.Page
{
    static int _ticket_id;
    static GridView gv;
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
                    Binding_Datagrid();
                    btnxoa.Attributes["Onclick"] = "return confirm('Do you really want to delete?')";  
                }
            }
            else
            {
                Response.Redirect("Admin_manager.aspx");
            }
        }
    }
    DataTable dt;
    protected void Binding_Datagrid()
    {
        dgticket.DataSource = new ServiceReference1.Service1Client().GetAll_Tickets_v2();
        dgticket.DataBind();
        dt = new DataTable("Table1");
            dt.Columns.Add("Ticket_ID", typeof(Int32));
            dt.Columns.Add("PNR", typeof(string));
            dt.Columns.Add("Passenger_type", typeof(string));
            dt.Columns.Add("Status", typeof(string));
            dt.Columns.Add("Train_ID", typeof(Int32));
            dt.Columns.Add("Departure_Date", typeof(DateTime));
            dt.Columns.Add("Departure_Time", typeof(TimeSpan));
            dt.Columns.Add("Coach_Type", typeof(string));
            dt.Columns.Add("Price", typeof(float));
            foreach (var i in new ServiceReference1.Service1Client().GetAll_Tickets_v2())
            {
                dt.Rows.Add(i.Ticket_ID, i.PNR, i.Passenger_type, i.Status, i.Train_ID, i.Departure_Date, i.Departure_Time, i.Coach_Type,i.Price);
            }
        gv = new GridView();
        gv.DataSource = dt;
        gv.DataBind();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        var tickets = new ServiceReference1.Service1Client().Search_Ticket_By_PNR(txtpnr.Text);
        if (tickets.Count() != 0)
        {
            dgticket.DataSource = tickets;
            dgticket.DataBind();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('No result found. Try again !!!');", true);
        }
    }
  
    protected void btnxoa_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (new ServiceReference1.Service1Client().Delete_Tickets(_ticket_id) == 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete ticket successed !!!');", true);
                Binding_Datagrid();
                reset();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "Thông báo", "alert('Delete ticket failed !!!');", true);
            }
        }
    }

    protected void dgticket_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        Label lbl_ticketid = (Label)e.Item.FindControl("lblid");
        _ticket_id = int.Parse(lbl_ticketid.Text);
        var ticket = new ServiceReference1.Service1Client().get_Ticket_By_ID2(_ticket_id);
        txtpnr.Text = ticket.PNR;
        txttickttype.Text = ticket.Passenger_type;
        txttrainname.Text = ticket.Train_Name;
        if (ticket.Status == "active")
        {
            RadioButton1.Checked = true;
            RadioButton2.Checked = false;
        }
        else
        {
            RadioButton2.Checked = true;
            RadioButton1.Checked = false;
        }
        txtdate.Text = ticket.Departure_Date.ToString();
        txttime.Text = ticket.Departure_Time.ToString();
        txtcoachtype.Text = ticket.Coach_Type;
        txtprice.Text = ticket.Price.ToString();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        reset();
        Binding_Datagrid();
    }
    protected void reset()
    {
        txtpnr.Text = null;
        txttickttype.Text = null;
        txttrainname.Text = null;
        txtdate.Text = null;
        txttime.Text = null;
        txtcoachtype.Text = null;
        txtprice.Text = null;
        _ticket_id = 0;
        
    }
protected void btnXuat_Click(object sender, EventArgs e)
{
    Response.ClearContent();
    Response.Buffer = true;
    Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "TenFile.xls"));
    Response.ContentType = "application/ms-excel";
    StringWriter sw = new StringWriter();
    HtmlTextWriter htw = new HtmlTextWriter(sw);
    gv.RenderControl(htw);
    Response.Write(sw.ToString());
    Response.End();
}
}
