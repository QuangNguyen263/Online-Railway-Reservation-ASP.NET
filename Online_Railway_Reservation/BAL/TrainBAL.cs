using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class TrainBAL
    {
        public IEnumerable<getAll_Trains_Result> GetAll_TrainsBAL()
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.GetAll_TrainsDAL();
        }

        public int Add_TrainsBAL(Train t)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.Add_TrainsDAL(t);
        }

        public int Delete_TrainsBAL(int id)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.Delete_TrainsDAL(id);
        }

        public int Update_TrainsBAL(Train t)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.Update_TrainsDAL(t);
        }

        public get_Train_By_ID_Result get_Train_By_IDBAL(int id)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.get_Train_By_IDDAL(id);
        }
        public IEnumerable<Get_All_Train_v2_Result> Get_All_Trains_v2_BAL()
        {
            return new TrainDAL().Get_All_Trains_v2_DAL();
        }
        public IEnumerable<Search_Train_TimeTable_Result> search_Train_By_StatinIDBAL(int OSID, int DSID, DateTime DD)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.search_Train_By_StatinIDDAL(OSID, DSID, DD);
        }
        public Search_Train_By_Train_id_Result Search_Train_By_Train_id_BAL(int id)
        {
            TrainDAL traindal = new TrainDAL();
            return traindal.Search_Train_By_Train_id_DAL(id);
        }

        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DesStIDBAL(int id)
        //{
        //    return new TrainDAL().Search_Train_By_DestSTDAL(id);
        //}

        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DestBAL(int id, string dt)
        //{
        //    return new TrainDAL().Search_Train_By_DestDAL(id,dt);
        //}
        //public IEnumerable<Get_Train_Des_Result> Get_Train_DesBAL(int id, DateTime dt)
        //{
        //    return new TrainDAL().Get_Train_DesDAL(id, dt);
        //}
        public IEnumerable<Get_Train_Des2_Result> Get_Train_Des2BAL(int id, DateTime dt)
        {
            return new TrainDAL().Get_Train_Des2DAL(id, dt);
        }
        //public IEnumerable<Get_Train_Des_Schedule_Result> Get_Train_Des_ScheduleBAL(int id, DateTime dt)
        //{
        //    return new TrainDAL().Get_Train_Des_ScheduleDAL(id, dt);
        //}
        public IEnumerable<Get_train_By_OS_Result> Get_Train_OSBAL(int id)
        {
            return new TrainDAL().Get_Train_OSDAL(id);
        }
        public IEnumerable<Get_Train_By_Time_Sche2_Result> Get_Train_Time_ScheBAL(int id, DateTime dt)
        {
            return new TrainDAL().Get_Train_Time_ScheDAL(id, dt);
        }
    }
}
