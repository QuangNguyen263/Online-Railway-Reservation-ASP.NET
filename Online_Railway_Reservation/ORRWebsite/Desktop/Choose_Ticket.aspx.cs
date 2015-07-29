using CheckValidate;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Choose_Ticket : System.Web.UI.Page
{
    static DataTable tbBookingData = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["BookingData"] == null || (Session["BookingData"] as DataTable).Rows.Count == 0)
            {
                Response.Redirect("default.aspx");
            }
            else
            {
                LoadData();
            }
        }
    }

    public void LoadData()
    {
        tbBookingData = (DataTable)Session["BookingData"];
        lblFrom.Text = tbBookingData.Rows[0]["tbStationfrom"].ToString();
        lblTo.Text = tbBookingData.Rows[0]["tbStationto"].ToString();
        lblDesFrom.Text = tbBookingData.Rows[0]["tbStationto"].ToString();
        lblDesTo.Text = tbBookingData.Rows[0]["tbStationfrom"].ToString();
        if (new ServiceReference1.Service1Client().search_Train_By_StatinID(Convert.ToInt32(tbBookingData.Rows[0]["tbfrom"].ToString()), Convert.ToInt32(tbBookingData.Rows[0]["tbto"].ToString()), DateTime.Parse(tbBookingData.Rows[0]["tbDatefrom"].ToString())) == null)
        {
            Response.Redirect("default.aspx");
        }
        else
        {
            rpFrom.DataSource = new ServiceReference1.Service1Client().search_Train_By_StatinID(Convert.ToInt32(tbBookingData.Rows[0]["tbfrom"].ToString()), Convert.ToInt32(tbBookingData.Rows[0]["tbto"].ToString()), DateTime.Parse(tbBookingData.Rows[0]["tbDatefrom"].ToString()));
            rpFrom.DataBind();
            datefrom.Text = tbBookingData.Rows[0]["tbDatefrom"].ToString();
        }
        if (tbBookingData.Rows[0]["tbDateto"].ToString().Trim() != "")
        {
            rpTo.DataSource = new ServiceReference1.Service1Client().search_Train_By_StatinID(Convert.ToInt32(tbBookingData.Rows[0]["tbto"].ToString()), Convert.ToInt32(tbBookingData.Rows[0]["tbfrom"].ToString()), DateTime.Parse(tbBookingData.Rows[0]["tbDateto"].ToString()));
            rpTo.DataBind();
            dateto.Text = tbBookingData.Rows[0]["tbDateto"].ToString();
        }
    }
    protected void dateto_TextChanged(object sender, EventArgs e)
    {
        try
        {
            tbBookingData.Rows[0]["tbTrainTo"] = 0;
            tbBookingData.Rows[0]["tbTimeTo"] = 0;
            rpTo.DataSource = new ServiceReference1.Service1Client().search_Train_By_StatinID(Convert.ToInt32(tbBookingData.Rows[0]["tbto"].ToString()), Convert.ToInt32(tbBookingData.Rows[0]["tbfrom"].ToString()), DateTime.Parse(dateto.Text.Trim()));
            rpTo.DataBind();
            

        }
        catch (Exception)
        {
        }
    }
    protected void datefrom_TextChanged(object sender, EventArgs e)
    {
        try
        {
            tbBookingData.Rows[0]["tbTrainFrom"] = 0;
            tbBookingData.Rows[0]["tbTimeFrom"] = 0;
            rpFrom.DataSource = new ServiceReference1.Service1Client().search_Train_By_StatinID(Convert.ToInt32(tbBookingData.Rows[0]["tbfrom"].ToString()), Convert.ToInt32(tbBookingData.Rows[0]["tbto"].ToString()), DateTime.Parse(datefrom.Text.Trim()));
            rpFrom.DataBind();
            
        }
        catch (Exception)
        {
        }
    }
    protected void btn_Dat_Command(object sender, CommandEventArgs e)
    {

        if (!new CheckDataValidate().CheckRealDate(datefrom.Text.Trim()))
        {
            lblCheckValidate.Visible = true;
            lblCheckValidate.Text = "Please Choose Real Time";
        }
        else
        {
            if (dateto.Text.Trim() != "")
            {
                if (!new CheckDataValidate().Compare2Date(datefrom.Text.Trim(), dateto.Text.Trim()))
                {
                    lblCheckValidate.Visible = true;
                    lblCheckValidate.Text = "Destination Time Incorrect";
                }
                else
                {
                    if (Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"]) == 0)
                    {
                        lblCheckValidate.Visible = true;
                        lblCheckValidate.Text = "Please Choose Some Schedule";
                    }
                    else
                    {
                        Session["BookingData"] = tbBookingData;
                        Response.Redirect("book_ticket.aspx");
                    }
                }
            }
            else
            {
                if (Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"]) == 0)
                {
                    lblCheckValidate.Visible = true;
                    lblCheckValidate.Text = "Please Choose Some Schedule";
                }
                else
                {
                    Session["BookingData"] = tbBookingData;
                    Response.Redirect("book_ticket.aspx");
                }
            }
        }
    }
    protected void btnChon_Command(object sender, CommandEventArgs e)
    {
        int n = Convert.ToInt32(e.CommandArgument);
        foreach (RepeaterItem it in rpFrom.Items)
        {
       
            Label ttID = (Label)it.FindControl("lbltimetableID");
            Label lblTID = (Label)it.FindControl("lblTID");
            if (n == Convert.ToInt32(lblTID.Text))
            {
                int nn = int.Parse(ttID.Text);
                tbBookingData.Rows[0]["tbTimeFrom"] = nn;
            }
            
        }
        tbBookingData.Rows[0]["tbTrainFrom"] = n;
        ScriptManager.RegisterStartupScript(this, GetType(), "Notice:", "alert('You Just Choose A Schedule !!!');", true);
    }
    protected void btnChonKH_Command(object sender, CommandEventArgs e)
    {
        int n1 = Convert.ToInt32(e.CommandArgument);
        foreach (RepeaterItem it in rpTo.Items)
        {

            Label ttID = (Label)it.FindControl("lbltimetableToID");
            Label lblTToID = (Label)it.FindControl("lblTToID");
            if (n1 == Convert.ToInt32(lblTToID.Text))
            {
                int nn = int.Parse(ttID.Text);
                tbBookingData.Rows[0]["tbTimeto"] = nn;
            }

        }
        tbBookingData.Rows[0]["tbTrainTo"] = n1;
        ScriptManager.RegisterStartupScript(this, GetType(), "Notice:", "alert('You Just Choose A Schedule !!!');", true);
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
}