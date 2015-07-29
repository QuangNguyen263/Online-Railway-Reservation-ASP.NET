using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class PassengersBAL
    {
        public IEnumerable<getAll_Passengers_Result> GetAll_PassengersBAL()
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.GetAll_PassengersDAL();
        }

        public int Add_PassengersBAL(Passenger p)
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.Add_PassengersDAL(p);
        }

        public int Delete_PassengersBAL(string pnr)
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.Delete_PassengersDAL(pnr);
        }

        public int Update_PassengersBAL(Passenger p)
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.Update_PassengersDAL(p);
        }

        public get_Passenger_By_PNR_Result Get_Passenger_By_PNRBAL(string pnr)
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.Get_Passenger_By_PNRDAL(pnr);
        }
        public IEnumerable<get_Passenger_By_Email_Result> Get_Passenger_By_EmailBAL(string email, string phonenumber)
        {
            PassengersDAL pdal = new PassengersDAL();
            return pdal.Get_Passenger_By_EmailDAL(email, phonenumber);
        }
    }
}
