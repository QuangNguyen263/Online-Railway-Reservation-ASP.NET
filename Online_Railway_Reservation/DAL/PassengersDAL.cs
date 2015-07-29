using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class PassengersDAL
    {
        public IEnumerable<getAll_Passengers_Result> GetAll_PassengersDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Passengers())
                {
                    yield return item;
                }
            }
        }

        public int Add_PassengersDAL(Passenger p)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Passengers(p.PNR,p.Passenger_Name,p.Date_Of_Birth,p.Card_Code,p.Gender,p.Email,p.Phone_Number,p.Address);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_PassengersDAL(string pnr)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Passengers(pnr);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_PassengersDAL(Passenger p)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Passengers(p.PNR, p.Passenger_Name, p.Date_Of_Birth, p.Card_Code, p.Gender, p.Email, p.Phone_Number, p.Address);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public get_Passenger_By_PNR_Result Get_Passenger_By_PNRDAL(string pnr)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Passenger_By_PNR(pnr).FirstOrDefault();
            }
        }
        public IEnumerable<get_Passenger_By_Email_Result> Get_Passenger_By_EmailDAL(string email, string phonenumber)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.get_Passenger_By_Email(email, phonenumber))
                {
                    yield return item;
                }
            }
        }
    }
}
