using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class CoachesBAL
    {
        public IEnumerable<getAll_Coaches_Result> GetAll_CoachesBAL()
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.GetAll_CoachesDAL();
        }

        public int Add_CoachesBAL(Coach c)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.Add_CoachesDAL(c);
        }

        public int Delete_CoachesBAL(int id)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.Delete_CoachesDAL(id);
        }

        public int Update_CoachesBAL(Coach c)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.Update_CoachesDAL(c);
        }
        public get_Coach_By_ID_Result Get_Coach_By_IDBAL(int id)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.Get_Coach_By_IDDAL(id);
        }
        public IEnumerable<Get_Coach_By_Train_ID_Result> GetCoachByTrainIDBAL(int trainid)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.GetCoachByTrainIDDAL(trainid);
        }
        public IEnumerable<Search_Coach_Type_Result> Search_CoachBAL(int trainid, string coachtype)
        {
            CoachesDAL cdal = new CoachesDAL();
            return cdal.Search_CoachDAL(trainid,coachtype);
        }
       
        public IEnumerable<Get_All_Coaches_Result> GetAll_Coaches_v2BAL()
        {
            return new CoachesDAL().GetAll_Coaches_v2DAL();
        }

        public IEnumerable<Get_Coach_By_Train_Result> Get_Coach_By_TrainBAL(int id)
        {
            return new CoachesDAL().Get_Coach_By_TrainDAL(id);
        }
       
    }
}
