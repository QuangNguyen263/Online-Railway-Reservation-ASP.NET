using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;
namespace BAL
{
    public class TicketsBAL
    {
        public IEnumerable<getAll_Tickets_Result> GetAll_TicketsBAL()
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.GetAll_TicketsDAL();
        }

        public int Add_TicketsBAL(Ticket t)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.Add_TicketsDAL(t);
        }

        public int Delete_TicketsBAL(int id)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.Delete_TicketsDAL(id);
        }

        public int Update_TicketsBAL(Ticket t)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.Update_TicketsDAL(t);
        }
        //bị trùng
        public Get_Ticket_By_ID_v2_Result get_Ticket_By_ID2BAL(int id)
        {
            return new TicketsDAL().get_Ticket_By_ID2DAL(id);
        }

        public get_Ticket_By_ID_Result get_Ticket_By_IDBAL(int id)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.get_Ticket_By_IDDAL(id);
        }
        public IEnumerable<get_Ticket_By_PNR_Result> get_Ticket_By_PNRBAL(string pnr)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.get_Ticket_By_PNRDAL(pnr);
        }
        public IEnumerable<Search_Ticket_By_PNR_Result> Search_Ticket_By_PNRBAL(string pnr)
        {
            return new TicketsDAL().Search_Ticket_By_PNRDAL(pnr);
        }
        public int Cancel_TicketBAL(int id, string status)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.Cancel_TicketDAL(id, status);
        }
        public IEnumerable<get_Ticket_By_TrainID_Result> Get_Ticket_By_Train_IDBAL(int trainid, string ct)
        {
            TicketsDAL ticketsdal = new TicketsDAL();
            return ticketsdal.Get_Ticket_By_Train_IDDAL(trainid, ct);
        }
        public IEnumerable<Get_All_Ticket_v2_Result> GetAll_Tickets_v2_BAL()
        {
            return new TicketsDAL().GetAll_Tickets_v2_DAL();
        }
    }
}
