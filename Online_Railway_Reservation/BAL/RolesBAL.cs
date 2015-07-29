using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class RolesBAL
    {
        public IEnumerable<getAll_Roles_Result> GetAll_RolesBAL()
        {
            RolesDAL rdal = new RolesDAL();
            return rdal.GetAll_RolesDAL();
        }

        public int Add_RolesBAL(string rolename)
        {
            RolesDAL rdal = new RolesDAL();
            return rdal.Add_RolesDAL(rolename);
        }

        public int Delete_RolesBAL(int id)
        {
            RolesDAL rdal = new RolesDAL();
            return rdal.Delete_RolesDAL(id);
        }

        public int Update_RolesBAL(Role r)
        {
            RolesDAL rdal = new RolesDAL();
            return rdal.Update_RolesDAL(r);
        }
    }
}
