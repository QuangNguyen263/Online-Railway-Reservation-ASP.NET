using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class TimetablesBAL
    {
        public IEnumerable<getAll_Timetables_Result> GetAll_TimetablesBAL()
        {
            TimetablesDAL timetablesdal = new TimetablesDAL();
            return timetablesdal.GetAll_TimetablesDAL();
        }
        public IEnumerable<get_All_Timetables_v2_Result> GetAll_Timetables_v2BAL()
        {
            return new TimetablesDAL().GetAll_Timetables_v2DAL();
        }

        public int Add_TimetablesBAL(Timetable t)
        {
            TimetablesDAL timetablesdal = new TimetablesDAL();
            return timetablesdal.Add_TimetablesDAL(t);
        }

        public int Delete_TimetablesBAL(int id)
        {
            TimetablesDAL timetablesdal = new TimetablesDAL();
            return timetablesdal.Delete_TimetablesDAL(id);
        }

        public int Update_TimetablesBAL(Timetable t)
        {
            TimetablesDAL timetablesdal = new TimetablesDAL();
            return timetablesdal.Update_TimetablesDAL(t);
        }

        public get_Timetable_By_ID_Result get_Timetable_By_IDBAL(int id)
        {
            TimetablesDAL timetablesdal = new TimetablesDAL();
            return timetablesdal.get_Timetable_By_IDDAL(id);
        }
        public IEnumerable<Get_Timetable_By_Train_ID_Result> Get_Timetable_By_Train_IDBAL(int id)
        {
            return new TimetablesDAL().Get_Timetable_By_Train_IDDAL(id);
        }
    }
}
