using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class RolesDAL
    {
        public IEnumerable<getAll_Roles_Result> GetAll_RolesDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.getAll_Roles())
                {
                    yield return item;
                }
            }
        }

        public int Add_RolesDAL(string rolename)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Roles(rolename);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_RolesDAL(int id)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Roles(id);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_RolesDAL(Role r)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Roles(r.Role_ID,r.Role_Name);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }
    }
}
