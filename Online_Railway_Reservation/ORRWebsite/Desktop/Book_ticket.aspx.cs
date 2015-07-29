using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Desktop_Book_Ticket : System.Web.UI.Page
{
    static DataTable tbBookingData = new DataTable();
    string pnr = null;
    int sldc = 0;
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
                tbBookingData = (DataTable)Session["BookingData"];
                if (Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString()) == 0)
                {
                    Response.Redirect("default.aspx");
                }
                else
                {
                    LoadData();
                }
            }
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
    public void LoadData()
    {
        tbBookingData = (DataTable)Session["BookingData"];
        lblStationFrom.Text = tbBookingData.Rows[0]["tbStationfrom"].ToString();
        lblStationTo.Text = tbBookingData.Rows[0]["tbStationto"].ToString();
        lblTrainID.Text = tbBookingData.Rows[0]["tbTrainFrom"].ToString();
        ServiceReference1.get_Timetable_By_ID_Result timetable = new ServiceReference1.Service1Client().get_Timetable_By_ID(int.Parse(tbBookingData.Rows[0]["tbTimeFrom"].ToString()));
        lblDeparture_Date.Text = timetable.Departure_Date.Value.ToShortDateString().ToString();
        lblDaparture_Time.Text = timetable.Departure_Time.ToString();
        lblArrival_Time.Text = timetable.Arrival_Time.ToString();
        DropdownAdult.SelectedValue = tbBookingData.Rows[0]["tbNumberOfAdult"].ToString();
        DropDownBaby.SelectedValue = tbBookingData.Rows[0]["tbNumberOfBaby"].ToString();
        DropDownChildren.SelectedValue = tbBookingData.Rows[0]["tbNumberOfChildren"].ToString();
        DropDownAdultMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString()), "AC 1");
        DropDownAdultMT.DataTextField = "Coach_ID";
        DropDownAdultMT.DataValueField = "Coach_ID";
        DropDownAdultMT.DataBind();
        DropDownChildrenMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString()), "AC 1");
        DropDownChildrenMT.DataTextField = "Coach_ID";
        DropDownChildrenMT.DataValueField = "Coach_ID";
        DropDownChildrenMT.DataBind();
        Set_Price_TotalPrice(lblCoachPrice, lblTotalPrice, DropDownAdultMT, DropdownAdult);
        Set_Price_TotalPrice(lblChildrenCoachPrice, lblChildrenTotalPrice, DropDownChildrenMT, DropDownChildren);
        if (tbBookingData.Rows[0]["tbTrainTo"].ToString() != "0" && tbBookingData.Rows[0]["tbTimeTo"].ToString() != "0")
        {
            pnCV.Visible = true;
            TTTTKH.Visible = true;
            lblKHStationFrom.Text = tbBookingData.Rows[0]["tbStationto"].ToString();
            lblKHStationTo.Text = tbBookingData.Rows[0]["tbStationfrom"].ToString();
            lblKHTrainID.Text = tbBookingData.Rows[0]["tbTrainTo"].ToString();
            ServiceReference1.get_Timetable_By_ID_Result timetable1 = new ServiceReference1.Service1Client().get_Timetable_By_ID(Convert.ToInt32(tbBookingData.Rows[0]["tbTimeTo"].ToString()));
            lblKHDeparture_Date.Text = timetable1.Departure_Date.Value.ToShortDateString().ToString();
            lblKHDeparture_Time.Text = timetable1.Departure_Time.ToString();
            lblKHArrival_Time.Text = timetable1.Arrival_Time.ToString();
            DropdownKHAdult.SelectedValue = tbBookingData.Rows[0]["tbNumberOfAdult"].ToString();
            DropdownKHBaby.SelectedValue = tbBookingData.Rows[0]["tbNumberOfBaby"].ToString();
            DropdownHKChildren.SelectedValue = tbBookingData.Rows[0]["tbNumberOfChildren"].ToString();
            DropDownKHAdultMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString()), "AC 1");
            DropDownKHAdultMT.DataTextField = "Coach_ID";
            DropDownKHAdultMT.DataValueField = "Coach_ID";
            DropDownKHAdultMT.DataBind();
            DropDownKHChildrenMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString()), "AC 1");
            DropDownKHChildrenMT.DataTextField = "Coach_ID";
            DropDownKHChildrenMT.DataValueField = "Coach_ID";
            DropDownKHChildrenMT.DataBind();
            Set_Price_TotalPrice(lblKHChildrenCoachPrice, lblKHChildrenTotalPrice, DropDownKHChildrenMT, DropdownHKChildren);
            Set_Price_TotalPrice(lblKHCoachPrice, lblKHTotalPrice, DropDownKHAdultMT, DropdownKHAdult);
        }
        Set_Total();
    }
    public void countsl(DropDownList dr, DropDownList drsl, string type)
    {
        if (dr.SelectedItem.Value == type)
        {
            sldc += Convert.ToInt32(drsl.SelectedItem.Value);
        }

    }
    public bool check_Seat(DropDownList drType1, DropDownList drTypesl1, DropDownList drType2, DropDownList drTypesl2, DropDownList drType3, DropDownList drTypesl3, string type, int trainid)
    {
        int sltk = 0;
        countsl(drType1, drTypesl1, type);
        countsl(drType2, drTypesl2, type);
        countsl(drType3, drTypesl3, type);
        int slghe = 0;
        if (new ServiceReference1.Service1Client().Search_Coach(trainid, type) != null)
        {
            foreach (var n in new ServiceReference1.Service1Client().Search_Coach(trainid, type))
            {
                slghe += Convert.ToInt32(n.Number_Of_Seats);
            }
            if (new ServiceReference1.Service1Client().Get_Ticket_By_Train_ID(trainid, type) != null)
            {
                foreach (var n in new ServiceReference1.Service1Client().Get_Ticket_By_Train_ID(trainid, type))
                {
                    if (n.Departure_Date == DateTime.Parse(lblDeparture_Date.Text.Trim()))
                    sltk += 1;
                }
            }
        } if (sltk + sldc <= slghe)
        {
            sldc = 0;
            return true;
        }
        else
        {
            sldc = 0;
            return false;
        }
    }
    public bool AddPersonInformation()
    {
        ServiceReference2.Person_Accounts ps = new ServiceReference2.Service1Client().GetData(txtUsername.Text.Trim(), txtPassword.Text.Trim(), txtCC.Text.Trim());
        if (ps != null)
        {
            if (!new CheckValidate.CheckDataValidate().checkAge(txtDOB.Text.Trim()))
            {
                if (ps.Total_Amount > Convert.ToDouble(lblTotalPrice.Text.Trim()))
                {
                    pnr = "T";
                    for (int i = 0; i < 2; i++)
                    {
                        int n = new Random().Next(100, 999);
                        pnr += n;
                    }
                    ServiceReference1.Passenger sp = new ServiceReference1.Passenger()
                    {
                        Passenger_Name = txtHo.Text.Trim() + " " + txtName.Text.Trim(),
                        Email = txtEmail.Text.Trim(),
                        Phone_Number = txtPhoneNumber.Text.Trim(),
                        Address = txtAddress.Text.Trim(),
                        Gender = DropDownGen.SelectedItem.Value,
                        Date_Of_Birth = DateTime.Parse(txtDOB.Text.Trim()).Date,
                        Card_Code = txtCC.Text.Trim(),
                        PNR = pnr
                    };
                    if (new ServiceReference1.Service1Client().Add_Passengers(sp) == 1)
                    {
                        return true;
                    }
                    else
                    {
                        lblKQ.Text = "Passenger Incorrect. Please Check Again";
                        return false;
                    }
                }
                else
                {
                    lblKQ.Text = "Your Amount Is Not Enough";
                    return false;
                }
            }
            else
            {
                lblKQ.Text = "Your Age Incorrect";
                return false;
            }
        }
        else
        {
            lblKQ.Text = "Bank Information Incorrect. Please Check Again";
            return false;
        }
    }
    public bool Addticket(string prn, string pt, int mt, int sl, DateTime date, TimeSpan time, string ct, float pr)
    {
        ServiceReference1.Service1Client sv = new ServiceReference1.Service1Client();
        Boolean n = true;
        for (int i = 0; i < sl; i++)
        {
            ServiceReference1.Ticket tc = new ServiceReference1.Ticket()
            {
                PNR = prn,
                Passenger_type = pt,
                Train_ID = mt,
                Departure_Date = date,
                Departure_Time = time,
                Status = "active",
                Coach_Type = ct,
                Price = pr
            };
            if (sv.Add_Tickets(tc) == 1)
            {
                n = true;
            }
            else
            {
                lblKQ.Text = "Add Ticket fail";
                n = false;
                break;
            }
        }
        return n;
    }
    public void Set_Price_TotalPrice(Label lblCoachPr, Label lblTotal, DropDownList DrMT, DropDownList DrSL)
    {
        try
        {
            if (DrMT == DropDownChildrenMT || DrMT == DropDownKHChildrenMT)
            {
                lblCoachPr.Text = (new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DrMT.SelectedItem.Value)).Price - ((new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DrMT.SelectedItem.Value)).Price) * 10 / 100)).ToString();
            }
            else
            {
                lblCoachPr.Text = new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DrMT.SelectedItem.Value)).Price + "";
            }
            lblTotal.Text = Convert.ToDouble(lblCoachPr.Text) * Convert.ToInt32(DrSL.SelectedItem.Value) + "";
        }
        catch (Exception)
        {
            lblCoachPr.Text = "0";
            lblTotal.Text = "0";
        }
    }
    public void Set_Total()
    {
        lblTotal.Text = Convert.ToDouble(lblTotalPrice.Text) + Convert.ToDouble(lblChildrenTotalPrice.Text) + Convert.ToDouble(lblKHChildrenTotalPrice.Text) + Convert.ToDouble(lblKHTotalPrice.Text) + "";
    }
    protected void DropdownHKBaby_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblKHChildrenCoachPrice, lblKHChildrenTotalPrice, DropDownKHChildrenMT, DropdownHKChildren);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropdownKHAdult_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblKHCoachPrice, lblKHTotalPrice, DropDownKHAdultMT, DropdownKHAdult);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownBaby_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblChildrenTotalPrice.Text = ((new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DropDownChildrenMT.SelectedItem.Value)).Price - ((new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DropDownChildrenMT.SelectedItem.Value)).Price) * 10 / 100)) * Convert.ToInt32(DropDownChildren.SelectedItem.Value)).ToString();
        Set_Total();
    }
    protected void DropdownAdult_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            lblTotalPrice.Text = new ServiceReference1.Service1Client().Get_Coach_By_ID(Convert.ToInt32(DropDownAdultMT.SelectedItem.Value)).Price * Convert.ToInt32(DropdownAdult.SelectedItem.Value) + "";
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownBabyCoachType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownChildrenMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString()), DropDownChildrenCoachType.SelectedItem.Value);
            DropDownChildrenMT.DataTextField = "Coach_ID";
            DropDownChildrenMT.DataBind();
            Set_Price_TotalPrice(lblChildrenCoachPrice, lblChildrenTotalPrice, DropDownChildrenMT, DropDownChildren);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownAdultCoachType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownAdultMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString()), DropDownAdultCoachType.SelectedItem.Value);
            DropDownAdultMT.DataTextField = "Coach_ID";
            DropDownAdultMT.DataBind();
            Set_Price_TotalPrice(lblCoachPrice, lblTotalPrice, DropDownAdultMT, DropdownAdult);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropdownHKAdultCoachType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownKHAdultMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString()), DropdownHKAdultCoachType.SelectedItem.Value);
            DropDownKHAdultMT.DataTextField = "Coach_ID";
            DropDownKHAdultMT.DataBind();
            Set_Price_TotalPrice(lblKHCoachPrice, lblKHTotalPrice, DropDownKHAdultMT, DropdownKHAdult);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropdownHKBabyCoachType_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            DropDownKHChildrenMT.DataSource = new ServiceReference1.Service1Client().Search_Coach(Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString()), DropdownHKChildrenCoachType.SelectedItem.Value);
            DropDownKHChildrenMT.DataTextField = "Coach_ID";
            DropDownKHChildrenMT.DataBind();
            Set_Price_TotalPrice(lblKHChildrenCoachPrice, lblKHChildrenTotalPrice, DropDownKHChildrenMT, DropdownHKChildren);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownAdultMT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblCoachPrice, lblTotalPrice, DropDownAdultMT, DropdownAdult);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownBabyMT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblChildrenCoachPrice, lblChildrenTotalPrice, DropDownChildrenMT, DropDownChildren);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownKHAdultMT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblKHCoachPrice, lblKHTotalPrice, DropDownKHAdultMT, DropdownKHAdult);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void DropDownKHBabyMT_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            Set_Price_TotalPrice(lblKHChildrenCoachPrice, lblKHChildrenTotalPrice, DropDownKHChildrenMT, DropdownHKChildren);
            Set_Total();
        }
        catch (Exception)
        {
        }
    }
    protected void btn_Dat_Command(object sender, CommandEventArgs e)
    {
        if (Convert.ToInt32(DropdownAdult.SelectedItem.Value) == 0)
        {
            lblKQ.Text = "Please Choose At Least One Adult";
        }
        else
        {
            if (Convert.ToDouble(lblTotal.Text.Trim()) == 0)
            {
                lblKQ.Text = "Please Choose At Least One Seat";
            }
            else
            {
                if (check_Seat(DropDownAdultCoachType, DropdownAdult, DropDownChildrenCoachType, DropDownChildren, DropDownAdultCoachType, DropDownChildren, "AC 1", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString())))
                {
                    if (check_Seat(DropDownAdultCoachType, DropdownAdult, DropDownChildrenCoachType, DropDownChildren, DropDownAdultCoachType, DropDownChildren, "Sleeper", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString())))
                    {
                        if (check_Seat(DropDownAdultCoachType, DropdownAdult, DropDownChildrenCoachType, DropDownChildren, DropDownAdultCoachType, DropDownChildren, "First Class", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainFrom"].ToString())))
                        {
                            if (tbBookingData.Rows[0]["tbTrainTo"].ToString() != "0" && tbBookingData.Rows[0]["tbTimeTo"].ToString() != "0")
                            {
                                if (check_Seat(DropdownHKAdultCoachType, DropdownKHAdult, DropdownHKChildrenCoachType, DropdownKHBaby, DropdownHKAdultCoachType, DropdownHKChildren, "AC 1", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString())))
                                {
                                    if (check_Seat(DropdownHKAdultCoachType, DropdownKHAdult, DropdownHKChildrenCoachType, DropdownKHBaby, DropdownHKAdultCoachType, DropdownHKChildren, "Sleeper", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString())))
                                    {
                                        if (check_Seat(DropdownHKAdultCoachType, DropdownKHAdult, DropdownHKChildrenCoachType, DropdownKHBaby, DropdownHKAdultCoachType, DropdownHKChildren, "First Class", Convert.ToInt32(tbBookingData.Rows[0]["tbTrainTo"].ToString())))
                                        {
                                            if (AddPersonInformation())
                                            {
                                                ServiceReference2.Service1Client sv2 = new ServiceReference2.Service1Client();
                                                if (sv2.TransferAmount(txtCC.Text.Trim(), float.Parse(lblTotal.Text.Trim()), "Trans") == 1){
                                                    sv2.TransferAmount("adm12345678910", float.Parse(lblTotal.Text.Trim()), "Add");
                                                    new CheckValidate.CheckDataValidate().send_Mail("Online Railway Reservation", txtEmail.Text.Trim(), "PRN Code", "Your PRN Is: " + pnr + " Please Check Your Ticket In Website!");
                                                    Addticket(pnr, "Adult", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropdownAdult.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), DropDownAdultCoachType.SelectedItem.Value, float.Parse(lblTotalPrice.Text));
                                                    if (Convert.ToInt32(DropDownChildren.SelectedItem.Value) > 0)
                                                    {
                                                        Addticket(pnr, "Children", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropDownChildren.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), DropDownChildrenCoachType.SelectedItem.Value, float.Parse(lblChildrenTotalPrice.Text));
                                                    }
                                                    if (Convert.ToInt32(DropDownBaby.SelectedItem.Value) > 0)
                                                    {
                                                        Addticket(pnr, "Baby", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropDownBaby.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), null, 0);
                                                    }
                                                    if (tbBookingData.Rows[0]["tbTrainTo"].ToString() != "0" && tbBookingData.Rows[0]["tbTimeTo"].ToString() != "0")
                                                    {
                                                        if (Convert.ToInt32(DropdownKHAdult.SelectedItem.Value) == 0)
                                                        {
                                                            lblKQ.Text = "Please Choose At Least One Adult In Destination Schedule";
                                                        }
                                                        else
                                                        {
                                                            if (DropDownKHAdultMT.SelectedItem.Value == null)
                                                            {
                                                                lblKQ.Text = "Please Choose Real Coach";
                                                            }
                                                            else
                                                            {
                                                                Addticket(pnr, "Adult", Convert.ToInt32(lblKHTrainID.Text), Convert.ToInt32(DropdownKHAdult.SelectedItem.Value), DateTime.Parse(lblKHDeparture_Date.Text.Trim()), TimeSpan.Parse(lblKHDeparture_Time.Text.Trim()), DropdownHKAdultCoachType.SelectedItem.Value, float.Parse(lblKHTotalPrice.Text));
                                                                if (Convert.ToInt32(DropdownHKChildren.SelectedItem.Value) > 0)
                                                                {
                                                                    Addticket(pnr, "Children", Convert.ToInt32(lblKHTrainID.Text), Convert.ToInt32(DropdownHKChildren.SelectedItem.Value), DateTime.Parse(lblKHDeparture_Date.Text.Trim()), TimeSpan.Parse(lblKHDeparture_Time.Text.Trim()), DropdownHKChildrenCoachType.SelectedItem.Value, float.Parse(lblKHChildrenTotalPrice.Text));
                                                                }
                                                                if (Convert.ToInt32(DropdownKHBaby.SelectedItem.Value) > 0)
                                                                {
                                                                    Addticket(pnr, "Baby", Convert.ToInt32(lblKHTrainID.Text), Convert.ToInt32(DropdownKHBaby.SelectedItem.Value), DateTime.Parse(lblKHDeparture_Date.Text.Trim()), TimeSpan.Parse(lblKHDeparture_Time.Text.Trim()), DropdownHKAdultCoachType.SelectedItem.Value, 0);
                                                                }
                                                                Response.Redirect("Done_Ticket.aspx");
                                                            }
                                                        }
                                                    }
                                                    else
                                                    {
                                                        Response.Redirect("Done_Ticket.aspx");
                                                    }
                                                }
                                                else
                                                {
                                                    lblKQ.Text = "failed transaction";
                                                }
                                            }
                                        }
                                        else
                                        {
                                            lblKQ.Text = "The First Class's Seats In DestinationSchedule Is Too Large";
                                        }
                                    }
                                    else
                                    {
                                        lblKQ.Text = "The Sleeper's Seats In DestinationSchedule Is Too Large";
                                    }
                                }
                                else
                                {
                                    lblKQ.Text = "The AC 1's Seat In DestinationSchedule Is Too Large";
                                }
                            }
                            else
                            {
                                if (AddPersonInformation())
                                {
                                    ServiceReference2.Service1Client sv2 = new ServiceReference2.Service1Client();
                                    if (sv2.TransferAmount(txtCC.Text.Trim(), float.Parse(lblTotal.Text.Trim()), "Trans") == 1)
                                    {
                                        sv2.TransferAmount("adm12345678910", float.Parse(lblTotal.Text.Trim()), "Add");
                                        new CheckValidate.CheckDataValidate().send_Mail("Online Railway Reservation", txtEmail.Text.Trim(), "PRN Code", "Your PRN Is: " + pnr + " Please Check Your Ticket In Website!");
                                        Addticket(pnr, "Adult", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropdownAdult.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), DropDownAdultCoachType.SelectedItem.Value, float.Parse(lblTotalPrice.Text));
                                        if (Convert.ToInt32(DropDownChildren.SelectedItem.Value) > 0)
                                        {
                                            Addticket(pnr, "Children", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropDownChildren.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), DropDownChildrenCoachType.SelectedItem.Value, float.Parse(lblChildrenTotalPrice.Text));
                                        }
                                        if (Convert.ToInt32(DropDownBaby.SelectedItem.Value) > 0)
                                        {
                                            Addticket(pnr, "Baby", Convert.ToInt32(lblTrainID.Text), Convert.ToInt32(DropDownBaby.SelectedItem.Value), DateTime.Parse(lblDeparture_Date.Text.Trim()), TimeSpan.Parse(lblDaparture_Time.Text.Trim()), null, 0);
                                        }
                                        Response.Redirect("Done_Ticket.aspx");
                                    }
                                    else
                                    {
                                        lblKQ.Text = "failed transaction";
                                    }
                                }
                            }
                        }
                        else
                        {
                            lblKQ.Text = "The First Class's Seats Is Too Large";
                        }
                    }
                    else
                    {
                        lblKQ.Text = "The Sleeper's Seats Is Too Large";
                    }
                }
                else
                {
                    lblKQ.Text = "The AC 1's Seat Is Too Large";
                }
            }
        }
    }
}