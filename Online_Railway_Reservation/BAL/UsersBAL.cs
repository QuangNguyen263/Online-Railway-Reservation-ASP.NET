using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class UsersBAL
    {
        public IEnumerable<Get_All_User_v2_Result> GetAll_UsersBAL()
        {
            return new UsersDAL().GetAll_UsersDAL();
        }

        public int Add_UsersBAL(User u)
        {
            UsersDAL usersdal = new UsersDAL();
            return usersdal.Add_UsersDAL(u);
        }

        public int Delete_UsersBAL(string username)
        {
            UsersDAL usersdal = new UsersDAL();
            return usersdal.Delete_UsersDAL(username);
        }

        public int Update_UsersBAL(User u)
        {
            UsersDAL usersdal = new UsersDAL();
            return usersdal.Update_UsersDAL(u);
        }
        public Get_User_By_UserName_v2_Result Get_User_By_UserNameBAL(string username)
        {
            return new UsersDAL().Get_User_By_UserNameDAL(username);
        }

        public int Search_UsernameBAL(User user)
        {
            return new UsersDAL().Search_UsernameDAL(user);
        }

        public int Update_PasswordBAL(User user)
        {
            return new UsersDAL().Update_PasswordDAL(user);
        }

        public int Update_InfoBAL(User user)
        {
            return new UsersDAL().Update_InfoDAL(user);
        }

        public login_Result LoginBAL(string username, string pass)
        {
            return new UsersDAL().LoginDAL(username, pass);
        }

    }
}
