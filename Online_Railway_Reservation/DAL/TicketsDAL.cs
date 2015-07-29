using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class TicketsDAL
    {
        public IEnumerable<getAll_Tickets_Result> GetAll_TicketsDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Tickets())
                {
                    yield return item;
                }
            }
        }

        public int Add_TicketsDAL(Ticket t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Tickets(t.PNR,t.Passenger_type,t.Status,t.Train_ID,t.Departure_Date,t.Departure_Time,t.Coach_Type,t.Price);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_TicketsDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Tickets(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public int Update_TicketsDAL(Ticket t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Tickets(t.Ticket_ID, t.PNR, t.Passenger_type, t.Status, t.Train_ID,t.Departure_Date,t.Departure_Time,t.Coach_Type,t.Price);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        //bị trùng
        public Get_Ticket_By_ID_v2_Result get_Ticket_By_ID2DAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.Get_Ticket_By_ID_v2(id).FirstOrDefault();
            }
        }
        public IEnumerable<Search_Ticket_By_PNR_Result> Search_Ticket_By_PNRDAL(string pnr)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Search_Ticket_By_PNR(pnr))
                {
                    yield return item;
                }
            }
        }
        //bị trùng
        public get_Ticket_By_ID_Result get_Ticket_By_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Ticket_By_ID(id).FirstOrDefault();
            }
        }
        public IEnumerable<Get_All_Ticket_v2_Result> GetAll_Tickets_v2_DAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_All_Ticket_v2())
                {
                    yield return item;
                }
            }
        }
        public IEnumerable<get_Ticket_By_PNR_Result> get_Ticket_By_PNRDAL(string pnr)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.get_Ticket_By_PNR(pnr))
                {
                    yield return item;
                }
            }
        }
        public int Cancel_TicketDAL(int id, string status)
        {
            try 
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    return orr.Cancel_Ticket(id, status);
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public IEnumerable<get_Ticket_By_TrainID_Result> Get_Ticket_By_Train_IDDAL(int trainid, string ct)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.get_Ticket_By_TrainID(trainid,ct))
                {
                    yield return item;
                }
            }
        }
    }
}
