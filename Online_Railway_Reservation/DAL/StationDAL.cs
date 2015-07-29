using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;

namespace DAL
{
    public class StationDAL
    {
        public IEnumerable<getAll_Stations_Result> GetAll_StationsDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Stations())
                {
                    yield return item;
                }
            }
        }

        public int Add_StationsDAL(Station s)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Stations(s.Station_Name,s.Latitude,s.Longtitude,s.Status);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_StationsDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Stations(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_StationsDAL(Station s)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Stations(s.Station_ID,s.Station_Name,s.Latitude,s.Longtitude,s.Status);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public get_Station_By_ID_Result get_Station_By_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Station_By_ID(id).FirstOrDefault();
            }
        }
        public IEnumerable<get_Station_By_Status_Result> Get_Station_By_StatusDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.get_Station_By_Status("Active"))
                {
                    yield return item;
                }
            }
        }
        public Get_Station_By_Train_ID_Result Get_Station_By_Train_IDDAL(int Train_id)
        {
            using (var oor = new Online_Railway_reservation_systemEntities())
            {
                oor.Configuration.ProxyCreationEnabled = false;
                return oor.Get_Station_By_Train_ID(Train_id).FirstOrDefault<Get_Station_By_Train_ID_Result>();
            }
        }
    }
}
