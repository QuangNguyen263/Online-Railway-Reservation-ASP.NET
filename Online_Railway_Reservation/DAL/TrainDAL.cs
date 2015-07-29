using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class TrainDAL
    {
        public IEnumerable<getAll_Trains_Result> GetAll_TrainsDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Trains())
                {
                    yield return item;
                }
            }
        }
        public int Add_TrainsDAL(Train t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Trains(t.Train_Name, t.Origin_Station_ID, t.Destination_Station_ID, t.Status, t.Train_Type);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public int Delete_TrainsDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Trains(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public int Update_TrainsDAL(Train t)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Trains(t.Train_ID, t.Train_Name, t.Origin_Station_ID, t.Destination_Station_ID, t.Status, t.Train_Type);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
        public get_Train_By_ID_Result get_Train_By_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Train_By_ID(id).FirstOrDefault();
            }
        }
        public IEnumerable<Get_All_Train_v2_Result> Get_All_Trains_v2_DAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_All_Train_v2())
                {
                    yield return item;
                }
            }
        }
        public IEnumerable<Search_Train_TimeTable_Result> search_Train_By_StatinIDDAL(int OSID, int DSID, DateTime DD)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Search_Train_TimeTable(OSID, DSID, DD))
                {
                    yield return item;
                }
            }
        }
        public Search_Train_By_Train_id_Result Search_Train_By_Train_id_DAL(int train_id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.Search_Train_By_Train_id(train_id).FirstOrDefault();
            }
        }

        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DestSTDAL(int id)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        orr.Configuration.ProxyCreationEnabled = false;
        //        foreach (var item in orr.Search_Train_By_DestST(id,DateTime.Now.Date))
        //        {
        //            yield return item;
        //        }
        //    }
        //}

        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DestDAL(int id, string dt)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        orr.Configuration.ProxyCreationEnabled = false;
        //        foreach (var item in orr.Search_Train_By_DestST(id,DateTime.Parse(dt)))
        //        {
        //            yield return item;
        //        }
        //    }
        //}
        //public IEnumerable<Get_Train_Des_Result> Get_Train_DesDAL(int id, DateTime dt)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        //orr.Configuration.ProxyCreationEnabled = false;
        //        //orr.Configuration.LazyLoadingEnabled = false;
        //        //orr.Configuration.AutoDetectChangesEnabled = false;
        //        //orr.Configuration.UseDatabaseNullSemantics = false;
        //        //orr.Configuration.ValidateOnSaveEnabled = false;
        //        //orr.ChangeTracker.DetectChanges();
        //        foreach(var item in orr.Get_Train_Des(id,dt)){
        //            yield return item;
        //        }
        //    }
        //}
        //public IEnumerable<Get_Train_Des_Schedule_Result> Get_Train_Des_ScheduleDAL(int id, DateTime dt)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        orr.Configuration.ProxyCreationEnabled = false;
        //        //orr.Configuration.LazyLoadingEnabled = false;
        //        //orr.Configuration.AutoDetectChangesEnabled = false;
        //        //orr.Configuration.UseDatabaseNullSemantics = false;
        //        //orr.Configuration.ValidateOnSaveEnabled = false;
        //        //orr.ChangeTracker.DetectChanges();
        //        foreach (var item in orr.Get_Train_Des_Schedule(id, dt.Date))
        //        {
        //            yield return item;
        //        }
        //    }
        //}
        public IEnumerable<Get_Train_Des2_Result> Get_Train_Des2DAL(int id, DateTime dt)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_Train_Des2(id, dt))
                {
                    yield return item;
                }
            }
        }
        public IEnumerable<Get_train_By_OS_Result> Get_Train_OSDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_train_By_OS(id))
                {
                    yield return item;
                }
            }
        }
        public IEnumerable<Get_Train_By_Time_Sche2_Result> Get_Train_Time_ScheDAL(int id,DateTime dt)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_Train_By_Time_Sche2(id,dt))
                {
                    yield return item;
                }
            }
        }


    }
}
