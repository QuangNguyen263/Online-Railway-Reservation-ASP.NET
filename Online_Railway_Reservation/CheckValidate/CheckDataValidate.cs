using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace CheckValidate
{
    public class CheckDataValidate
    {
        public bool CheckStations(string stationFrom, string stationTo)
        {
            try
            {
                if (stationFrom != stationTo)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool CheckRealDate(string date)
        {
            try
            {

                if (DateTime.Parse(date).Date >= DateTime.Now.Date)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public bool Compare2Date(string DateFrom, string DateTo)
        {
            try
            {
                if (DateTime.Parse(DateFrom).Date <= DateTime.Parse(DateTo).Date)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }
        public string send_Mail(string Name, string mailto, string Subject, string Contents)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("<html><head>");
                sb.Append("<link rel='stylesheet' type='text/css' href='theme.css' />");
                sb.Append("</head>");
                sb.Append("<body>");
                sb.Append("<table>");
                sb.Append("<tr><td>" + Contents + "</td></tr>");
                sb.Append("<tr><td>--------------------------------------------------------------------------------</td></tr>");
                sb.Append("<tr><td>© Copyright © 2015 - Online Railway Reservation</td></tr>");
                sb.Append("</table>");
                sb.Append("</body>");
                sb.Append("</html>");
                System.Net.Mail.MailMessage msg = new System.Net.Mail.MailMessage();
                msg.From = new MailAddress("quang.nguyen26395@gmail.com", Name, System.Text.Encoding.UTF8);
                msg.Subject = Subject;
                msg.To.Add(mailto);
                msg.Body = sb.ToString();
                msg.BodyEncoding = System.Text.Encoding.UTF8;
                msg.IsBodyHtml = true;
                msg.Priority = MailPriority.High;
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("quang.nguyen26395@gmail.com", "15935789");
                client.Port = 587; //gmail port
                client.Host = "smtp.gmail.com";//gmail host
                client.EnableSsl = true;
                client.Send(msg);
                //return true;
                return "Successful";
            }
            catch (Exception ms)
            {
                return ms.Message;
            }
        }
        public bool checkAge(string dob)
        {
            if (DateTime.Now.Year - DateTime.Parse(dob).Year < 16)
            {
                return true;
            }
            else
            {
                if (DateTime.Now.Year - DateTime.Parse(dob).Year > 80)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
    }
}
