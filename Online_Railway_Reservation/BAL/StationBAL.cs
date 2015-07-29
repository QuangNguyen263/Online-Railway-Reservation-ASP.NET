using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class StationBAL
    {
        public IEnumerable<getAll_Stations_Result> GetAll_StationsBAL()
        {
            StationDAL sdal = new StationDAL();
            return sdal.GetAll_StationsDAL();
        }

        public int Add_StationsBAL(Station s)
        {
            StationDAL sdal = new StationDAL();
            return sdal.Add_StationsDAL(s);
        }

        public int Delete_StationsBAL(int id)
        {
            StationDAL sdal = new StationDAL();
            return sdal.Delete_StationsDAL(id);
        }

        public int Update_StationsBAL(Station s)
        {
            StationDAL sdal = new StationDAL();
            return sdal.Update_StationsDAL(s);
        }

        public get_Station_By_ID_Result get_Station_By_IDBAL(int id)
        {
            StationDAL sdal = new StationDAL();
            return sdal.get_Station_By_IDDAL(id);
        }
        public IEnumerable<get_Station_By_Status_Result> Get_Station_By_StatusBAL()
        {
            StationDAL sdal = new StationDAL();
            return sdal.Get_Station_By_StatusDAL();
        }
        public Get_Station_By_Train_ID_Result Get_Station_By_Train_IDBAL(int Train_id)
        {
            return new StationDAL().Get_Station_By_Train_IDDAL(Train_id);
        }
    }
}
