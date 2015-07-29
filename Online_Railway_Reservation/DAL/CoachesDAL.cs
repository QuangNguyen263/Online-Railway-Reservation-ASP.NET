using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class CoachesDAL
    {
        public IEnumerable<getAll_Coaches_Result> GetAll_CoachesDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Coaches())
                {
                    yield return item;
                }
            }
        }

        public IEnumerable<Get_All_Coaches_Result> GetAll_Coaches_v2DAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_All_Coaches())
                {
                    yield return item;
                }
            }
        }

        public IEnumerable<Get_Coach_By_Train_ID_Result> GetCoachByTrainIDDAL(int trainid)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_Coach_By_Train_ID(trainid))
                {
                    yield return item;
                }
            }
        }

        //public IEnumerable<Get_Coach_By_Train_ID_Result> Get_Coach_By_TrainDAL(int idtrain)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        orr.Configuration.ProxyCreationEnabled = false;
        //        foreach (var item in orr.Get_Coach_By_Train_ID(idtrain))
        //        {
        //            yield return item;
        //        }
        //    }
        //}

        public IEnumerable<Search_Coach_Type_Result> Search_CoachDAL(int trainid, string coachtype)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Search_Coach_Type(trainid,coachtype))
                {
                    yield return item;
                }
            }
        }

        public int Add_CoachesDAL(Coach c)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Coaches(c.Coach_Type,c.Train_ID,c.Number_Of_Seats,c.Price,c.Status);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_CoachesDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Coaches(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_CoachesDAL(Coach c)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Coaches(c.Coach_ID, c.Coach_Type,c.Train_ID,c.Number_Of_Seats,c.Price,c.Status);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public get_Coach_By_ID_Result Get_Coach_By_IDDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.get_Coach_By_ID(id).FirstOrDefault();
            }
        }

        public IEnumerable<Get_Coach_By_Train_Result> Get_Coach_By_TrainDAL(int id)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_Coach_By_Train(id))
                {
                    yield return item;
                }
            }
        }

        //public IEnumerable<get_Coach_By_Train_ID_Result> Get_Coach_By_Train_IDDAL(int id)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        //orr.Configuration.ProxyCreationEnabled = false;
        //        foreach (var item in orr.get_Coach_By_Train_ID(id))
        //        {
        //            yield return item;
        //        }
        //    }
        //}
        
        //public get_Coach_By_ID_Result Get_Coach_By_IDDAL(int id)
        //{
        //    using (var orr = new Online_Railway_reservation_systemEntities())
        //    {
        //        orr.Configuration.ProxyCreationEnabled = false;
        //        return orr.get_Coach_By_ID(id).First<get_Coach_By_ID_Result>();
        //    }
        //}
    }
}
