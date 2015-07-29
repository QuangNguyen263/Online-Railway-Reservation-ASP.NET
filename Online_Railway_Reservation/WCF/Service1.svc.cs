using BAL;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {

        //public IEnumerable<Get_All_User_v2_Result> GetAll_Users()
        //{
        //    UsersBAL usersBal = new UsersBAL();
        //    return usersBal.GetAll_UsersBAL();
        //}
        public IEnumerable<Get_All_User_v2_Result> GetAll_Users()
        {
            return new UsersBAL().GetAll_UsersBAL();
        }

        public int Add_Users(User u)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Add_UsersBAL(u);
        }

        public int Delete_Users(string username)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Delete_UsersBAL(username);
        }

        public int Update_Users(User u)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Update_UsersBAL(u);
        }
        public int Search_Username(User user)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Search_UsernameBAL(user);
        }
        public int Update_Password(User user)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Update_PasswordBAL(user);
        }
        public int Update_Info(User user)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Update_InfoBAL(user);
        }

        public IEnumerable<getAll_Trains_Result> GetAll_Trains()
        {
            TrainBAL trainsBal = new TrainBAL();
            return trainsBal.GetAll_TrainsBAL();
        }

        public int Add_Trains(Train t)
        {
            TrainBAL trainsBal = new TrainBAL();
            return trainsBal.Add_TrainsBAL(t);
        }

        public int Delete_Trains(int id)
        {
            TrainBAL trainsBal = new TrainBAL();
            return trainsBal.Delete_TrainsBAL(id);
        }

        public int Update_Trains(Train t)
        {
            TrainBAL trainsBal = new TrainBAL();
            return trainsBal.Update_TrainsBAL(t);
        }

        public IEnumerable<getAll_Timetables_Result> GetAll_Timetables()
        {
            TimetablesBAL timetablesBal = new TimetablesBAL();
            return timetablesBal.GetAll_TimetablesBAL();
        }

        public int Add_Timetables(Timetable t)
        {
            TimetablesBAL timetablesBal = new TimetablesBAL();
            return timetablesBal.Add_TimetablesBAL(t);
        }

        public int Delete_Timetables(int id)
        {
            TimetablesBAL timetablesBal = new TimetablesBAL();
            return timetablesBal.Delete_TimetablesBAL(id);
        }

        public int Update_Timetables(Timetable t)
        {
            TimetablesBAL timetablesBal = new TimetablesBAL();
            return timetablesBal.Update_TimetablesBAL(t);
        }

        public IEnumerable<getAll_Tickets_Result> GetAll_Tickets()
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.GetAll_TicketsBAL();
        }

        public int Add_Tickets(Ticket t)
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.Add_TicketsBAL(t);
        }

        public int Delete_Tickets(int id)
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.Delete_TicketsBAL(id);
        }

        public int Update_Tickets(Ticket t)
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.Update_TicketsBAL(t);
        }

        public IEnumerable<getAll_Stations_Result> GetAll_Stations()
        {
            StationBAL stationBal = new StationBAL();
            return stationBal.GetAll_StationsBAL();
        }

        public int Add_Stations(Station s)
        {
            StationBAL stationBal = new StationBAL();
            return stationBal.Add_StationsBAL(s);
        }

        public int Delete_Stations(int id)
        {
            StationBAL stationBal = new StationBAL();
            return stationBal.Delete_StationsBAL(id);
        }

        public int Update_Stations(Station s)
        {
            StationBAL stationBal = new StationBAL();
            return stationBal.Update_StationsBAL(s);
        }

        public IEnumerable<getAll_Roles_Result> GetAll_Roles()
        {
            RolesBAL rolesBal = new RolesBAL();
            return rolesBal.GetAll_RolesBAL();
        }

        public int Add_Roles(string rolename)
        {
            RolesBAL rolesBal = new RolesBAL();
            return rolesBal.Add_RolesBAL(rolename);
        }

        public int Delete_Roles(int id)
        {
            RolesBAL rolesBal = new RolesBAL();
            return rolesBal.Delete_RolesBAL(id);
        }

        public int Update_Roles(Role r)
        {
            RolesBAL rolesBal = new RolesBAL();
            return rolesBal.Update_RolesBAL(r);
        }

        public IEnumerable<getAll_Passengers_Result> GetAll_Passengers()
        {
            PassengersBAL passengersBal = new PassengersBAL();
            return passengersBal.GetAll_PassengersBAL();
        }

        public int Add_Passengers(Passenger p)
        {
            PassengersBAL passengersBal = new PassengersBAL();
            return passengersBal.Add_PassengersBAL(p);
        }

        public int Delete_Passengers(string prn)
        {
            PassengersBAL passengersBal = new PassengersBAL();
            return passengersBal.Delete_PassengersBAL(prn);
        }

        public int Update_Passengers(Passenger p)
        {
            PassengersBAL passengersBal = new PassengersBAL();
            return passengersBal.Update_PassengersBAL(p);
        }

        public IEnumerable<getAll_Coaches_Result> GetAll_Coaches()
        {
            return new CoachesBAL().GetAll_CoachesBAL();
        }

        public int Add_Coaches(Coach c)
        {
            CoachesBAL coachesBal = new CoachesBAL();
            return coachesBal.Add_CoachesBAL(c);
        }

        public int Delete_Coaches(int id)
        {
            CoachesBAL coachesBal = new CoachesBAL();
            return coachesBal.Delete_CoachesBAL(id);
        }

        public int Update_Coaches(Coach c)
        {
            CoachesBAL coachesBal = new CoachesBAL();
            return coachesBal.Update_CoachesBAL(c);
        }
        public get_Train_By_ID_Result get_Train_By_ID(int id)
        {
            TrainBAL trainBal = new TrainBAL();
            return trainBal.get_Train_By_IDBAL(id);
        }
        public get_Timetable_By_ID_Result get_Timetable_By_ID(int id)
        {
            TimetablesBAL timetablesBal = new TimetablesBAL();
            return timetablesBal.get_Timetable_By_IDBAL(id);
        }
        public Get_Ticket_By_ID_v2_Result get_Ticket_By_ID2(int id)
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.get_Ticket_By_ID2BAL(id);
        }
        public IEnumerable<Search_Train_TimeTable_Result> search_Train_By_StatinID(int OSID, int DSID, DateTime DD)
        {
            TrainBAL trainbal = new TrainBAL();
            return trainbal.search_Train_By_StatinIDBAL(OSID, DSID, DD);
        }

        //public get_Timetable_By_ID_Result get_Timetable_By_ID(int id)
        //{
        //    TimetablesBAL timetablesBal = new TimetablesBAL();
        //    return timetablesBal.get_Timetable_By_IDBAL(id);
        //}

        public get_Ticket_By_ID_Result get_Ticket_By_ID(int id)
        {
            TicketsBAL ticketsBal = new TicketsBAL();
            return ticketsBal.get_Ticket_By_IDBAL(id);
        }

        public get_Station_By_ID_Result get_Station_By_ID(int id)
        {
            StationBAL stationBal = new StationBAL();
            return stationBal.get_Station_By_IDBAL(id);
        }

        public get_Passenger_By_PNR_Result Get_Passenger_By_PNR(string pnr)
        {
            PassengersBAL passengersBal = new PassengersBAL();
            return passengersBal.Get_Passenger_By_PNRBAL(pnr);
        }

        public get_Coach_By_ID_Result Get_Coach_By_ID(int id)
        {
            CoachesBAL coachesBal = new CoachesBAL();
            return coachesBal.Get_Coach_By_IDBAL(id);
        }
        public IEnumerable<Get_Coach_By_Train_ID_Result> GetCoachByTrainID(int trainid)
        {
            CoachesBAL cbal = new CoachesBAL();
            return cbal.GetCoachByTrainIDBAL(trainid);
        }
        public IEnumerable<Search_Coach_Type_Result> Search_Coach(int trainid, string coachtype)
        {
            CoachesBAL cdal = new CoachesBAL();
            return cdal.Search_CoachBAL(trainid, coachtype);
        }
     
        public Get_User_By_UserName_v2_Result Get_User_By_UserName_v2(string username)
        {
            UsersBAL usersBal = new UsersBAL();
            return usersBal.Get_User_By_UserNameBAL(username);
        }
        public IEnumerable<get_Passenger_By_Email_Result> Get_Passenger_By_Email(string email, string phonenumber)
        {
            PassengersBAL pbal = new PassengersBAL();
            return pbal.Get_Passenger_By_EmailBAL(email, phonenumber);
        }
        public IEnumerable<get_All_Timetables_v2_Result> GetAll_Timetables_v2()
        {
            return new TimetablesBAL().GetAll_Timetables_v2BAL();
        }
        public IEnumerable<get_Ticket_By_PNR_Result> get_Ticket_By_PNR(string pnr)
        {
            TicketsBAL ticketsdal = new TicketsBAL();
            return ticketsdal.get_Ticket_By_PNRBAL(pnr);
        }
        public int Cancel_Ticket(int id, string status)
        {
            TicketsBAL ticketsdal = new TicketsBAL();
            return ticketsdal.Cancel_TicketBAL(id, status);
        }
        public IEnumerable<get_Ticket_By_TrainID_Result> Get_Ticket_By_Train_ID(int trainid, string ct)
        {
            TicketsBAL ticketsbal = new TicketsBAL();
            return ticketsbal.Get_Ticket_By_Train_IDBAL(trainid, ct);
        }
        public Get_Station_By_Train_ID_Result get_Station_By_Train_ID(int Train_ID)
        {
            return new StationBAL().Get_Station_By_Train_IDBAL(Train_ID);
        }
        public IEnumerable<Get_All_Train_v2_Result> Get_All_Trains_v2()
        {
            return new TrainBAL().Get_All_Trains_v2_BAL();
        }
        public Search_Train_By_Train_id_Result Search_Train_By_Train_id(int id)
        {
            return new TrainBAL().Search_Train_By_Train_id_BAL(id);
        }
        public IEnumerable<Get_All_Ticket_v2_Result> GetAll_Tickets_v2()
        {
            return new TicketsBAL().GetAll_Tickets_v2_BAL();
        }
        public IEnumerable<get_Station_By_Status_Result> GetStationByStatus()
        {
            StationBAL sbal = new StationBAL();
            return sbal.Get_Station_By_StatusBAL();
        }
        IEnumerable<Search_Ticket_By_PNR_Result> IService1.Search_Ticket_By_PNR(string pnr)
        {
            return new TicketsBAL().Search_Ticket_By_PNRBAL(pnr);
        }


        IEnumerable<Get_Timetable_By_Train_ID_Result> IService1.Get_Timetable_By_Train_ID(int id)
        {
            return new TimetablesBAL().Get_Timetable_By_Train_IDBAL(id);
        }

        public login_Result Login(string username, string pass)
        {
            return new UsersBAL().LoginBAL(username, pass);
        }


        public IEnumerable<Get_All_Coaches_Result> GetAll_Coaches_v2()
        {
            return new CoachesBAL().GetAll_Coaches_v2BAL();
        }


        public IEnumerable<Get_Coach_By_Train_Result> Get_Coach_By_Train(int idtrain)
        {
            return new CoachesBAL().Get_Coach_By_TrainBAL(idtrain);
        }


        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DesStID(int id)
        //{
        //    return new TrainBAL().Search_Train_By_DesStIDBAL(id);
        //}


        //public IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_Dest(int id,string dt)
        //{
        //    return new TrainBAL().Search_Train_By_DestBAL(id,dt);
        //}
        //public IEnumerable<Get_Train_Des_Result> Get_Train_Des(int id, DateTime dt)
        //{
        //    return new TrainBAL().Get_Train_DesBAL(id, dt);
        //}
        //public IEnumerable<Get_Train_Des2_Result> Get_Train_Des2(int id, DateTime dt)
        //{
        //    return new TrainBAL().Get_Train_Des2BAL(id, dt);
        //}
        //public IEnumerable<Get_Train_Des_Schedule_Result> Get_Train_Des_Schedule(int id, DateTime dt)
        //{
        //    return new TrainBAL().Get_Train_Des_ScheduleBAL(id, dt);
        //}
        public IEnumerable<Get_train_By_OS_Result> Get_Train_OS(int id)
        {
            return new TrainBAL().Get_Train_OSBAL(id);
        }
        public IEnumerable<Get_Train_By_Time_Sche2_Result> Get_Train_Time_Sche(int id, DateTime dt)
        {
            return new TrainBAL().Get_Train_Time_ScheBAL(id, dt);
        }
    }
}
