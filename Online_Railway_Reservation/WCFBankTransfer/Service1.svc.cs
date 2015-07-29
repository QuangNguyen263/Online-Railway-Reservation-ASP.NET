using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WCFBankTransfer
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public Person_Accounts GetData(string username, string password, string cc)
        {
            using (Bank_AccountsEntities1 ba = new Bank_AccountsEntities1())
            {
                return ba.Person_Accounts.Where(i => i.Username == username).Where(i => i.Password == password).Where(i => i.Card_Code == cc).SingleOrDefault();
            }
        }
        public int TransferAmount(string cc, float am, string option)
        {
            try
            {
                using (Bank_AccountsEntities1 ba = new Bank_AccountsEntities1())
                {
                    var n = ba.Person_Accounts.Where(i => i.Card_Code == cc).SingleOrDefault();
                    switch (option)
                    {
                        case "Add":
                            n.Total_Amount = n.Total_Amount + am;
                            break;
                        case "Trans":
                            n.Total_Amount = n.Total_Amount - am;
                            break;
                        default:
                            break;
                    }
                    ba.SaveChanges();
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
