using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class TimetablesDAL
    {
        public IEnumerable<getAll_Timetables_Result> GetAll_TimetablesDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Timetables())
                {
                    yield return item;
                }
            }
        }
        public IEnumerable<get_All_Timetables_v2_Result> GetAll_Timetables_v2DAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.get_All_Timetables_v2())
                {
                    yield return item;
                }
            }
        }

        public int Add_TimetablesDAL(Timetable t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Timetables(t.Departure_Date, t.Departure_Time, t.Arrival_Date, t.Arrival_Time, t.Distance, t.Train_ID);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_TimetablesDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Timetables(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_TimetablesDAL(Timetable t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Timetables(t.Timetable_ID, t.Departure_Date, t.Departure_Time, t.Arrival_Date, t.Arrival_Time, t.Distance, t.Train_ID);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public get_Timetable_By_ID_Result get_Timetable_By_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Timetable_By_ID(id).FirstOrDefault();
            }
        }

        public IEnumerable<Get_Timetable_By_Train_ID_Result> Get_Timetable_By_Train_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_Timetable_By_Train_ID(id))
                {
                    yield return item;
                }
            }
        }
    }
}
