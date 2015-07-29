using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
namespace DAL
{
    public class UsersDAL
    {
        public IEnumerable<Get_All_User_v2_Result> GetAll_UsersDAL()
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                foreach (var item in orr.Get_All_User_v2())
                {
                    yield return item;
                }
            }
        }

        public int Add_UsersDAL(User u)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Add_Users(u.Username, u.Password, u.Email, u.Phone_Number, u.Gender, u.Security_Code, u.Role_ID);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Delete_UsersDAL(string username)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Delete_Users(username);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public int Update_UsersDAL(User u)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Users(u.Username, u.Password, u.Email, u.Phone_Number, u.Gender, u.Security_Code, u.Role_ID);
                    return 1;
                }
            }
            catch (Exception)
            {
                return 0;
            }
        }

        public Get_User_By_UserName_v2_Result Get_User_By_UserNameDAL(string username)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.Get_User_By_UserName_v2(username).FirstOrDefault();
            }
        }

        public int Search_UsernameDAL(User user)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Search_Username_By_ID(user.Username);
                    return 1;
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int Update_PasswordDAL(User user)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Password(user.Username, user.Password);
                    return 1;
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public int Update_InfoDAL(User user)
        {
            try
            {
                using (var orr = new Online_Railway_reservation_systemEntities())
                {
                    orr.Configuration.ProxyCreationEnabled = false;
                    orr.Update_Info(user.Username, user.Email, user.Phone_Number, user.Gender);
                    return 1;
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public login_Result LoginDAL(string username, string pass)
        {
            using (var orr = new Online_Railway_reservation_systemEntities())
            {
                orr.Configuration.ProxyCreationEnabled = false;
                return orr.login(username, pass).FirstOrDefault();
            }
        }
    }
}
