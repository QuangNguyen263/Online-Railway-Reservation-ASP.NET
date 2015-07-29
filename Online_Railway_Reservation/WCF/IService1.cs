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
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        //Table User
        [OperationContract]
        IEnumerable<Get_All_User_v2_Result> GetAll_Users();
        [OperationContract]
        int Add_Users(User u);
        [OperationContract]
        int Delete_Users(string username);
        [OperationContract]
        int Update_Users(User u);
        //[OperationContract]
        //IEnumerable<Get_All_User_v2_Result> GetAll_Users();
        [OperationContract]
        Get_User_By_UserName_v2_Result Get_User_By_UserName_v2(string username);
        [OperationContract]
        int Search_Username(User user);
        [OperationContract]
        int Update_Info(User user);
        //Table train
        [OperationContract]
        IEnumerable<getAll_Trains_Result> GetAll_Trains();
        [OperationContract]
        int Add_Trains(Train t);
        [OperationContract]
        int Delete_Trains(int id);
        [OperationContract]
        int Update_Trains(Train t);
        [OperationContract]
        get_Train_By_ID_Result get_Train_By_ID(int id);
        [OperationContract]
        IEnumerable<Get_All_Train_v2_Result> Get_All_Trains_v2();
        [OperationContract]
        Search_Train_By_Train_id_Result Search_Train_By_Train_id(int id);
        //[OperationContract]
        //IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_DesStID(int id);
        //[OperationContract]
        //IEnumerable<Search_Train_By_DestST_Result> Search_Train_By_Dest(int id,string dt);
        //[OperationContract]
        //IEnumerable<Get_Train_Des_Result> Get_Train_Des(int id, DateTime dt);
        //[OperationContract]
        //IEnumerable<Get_Train_Des2_Result> Get_Train_Des2(int id, DateTime dt);
        //Table Timetables
        [OperationContract]
        IEnumerable<getAll_Timetables_Result> GetAll_Timetables();
        [OperationContract]
        IEnumerable<get_All_Timetables_v2_Result> GetAll_Timetables_v2();
        [OperationContract]
        int Add_Timetables(Timetable t);
        [OperationContract]
        int Delete_Timetables(int id);
        [OperationContract]
        int Update_Timetables(Timetable t);
        [OperationContract]
        get_Timetable_By_ID_Result get_Timetable_By_ID(int id);
        [OperationContract]
        IEnumerable<Get_Timetable_By_Train_ID_Result> Get_Timetable_By_Train_ID(int id);
        //Table  Ticket
        [OperationContract]
        IEnumerable<getAll_Tickets_Result> GetAll_Tickets();
        [OperationContract]
        int Add_Tickets(Ticket t);
        [OperationContract]
        int Delete_Tickets(int id);
        [OperationContract]
        int Update_Tickets(Ticket t);
        [OperationContract]
        Get_Ticket_By_ID_v2_Result get_Ticket_By_ID2(int id);
        [OperationContract]
        IEnumerable<Search_Ticket_By_PNR_Result> Search_Ticket_By_PNR(string pnr);
        [OperationContract]
        IEnumerable<Get_All_Ticket_v2_Result> GetAll_Tickets_v2();
        [OperationContract]
        login_Result Login(string username, string pass);
        //Table Station
        [OperationContract]
        IEnumerable<getAll_Stations_Result> GetAll_Stations();
        [OperationContract]
        int Add_Stations(Station s);
        [OperationContract]
        int Delete_Stations(int id);
        [OperationContract]
        int Update_Stations(Station s);
        [OperationContract]
        get_Station_By_ID_Result get_Station_By_ID(int id);
        [OperationContract]
        Get_Station_By_Train_ID_Result get_Station_By_Train_ID(int Train_ID);

        //Table Roles
        [OperationContract]
        IEnumerable<getAll_Roles_Result> GetAll_Roles();
        [OperationContract]
        int Add_Roles(string rolename);
        [OperationContract]
        int Delete_Roles(int id);
        [OperationContract]
        int Update_Roles(Role r);
        //Table Passengers
        [OperationContract]
        IEnumerable<getAll_Passengers_Result> GetAll_Passengers();
        [OperationContract]
        int Add_Passengers(Passenger p);
        [OperationContract]
        int Delete_Passengers(string prn);
        [OperationContract]
        int Update_Passengers(Passenger p);
        [OperationContract]
        get_Passenger_By_PNR_Result Get_Passenger_By_PNR(string pnr);

        //Table Coachs
        [OperationContract]
        IEnumerable<getAll_Coaches_Result> GetAll_Coaches();
        [OperationContract]
        IEnumerable<Get_All_Coaches_Result> GetAll_Coaches_v2();
        [OperationContract]
        int Add_Coaches(Coach c);
        [OperationContract]
        int Delete_Coaches(int id);
        [OperationContract]
        int Update_Coaches(Coach c);
        [OperationContract]
        get_Coach_By_ID_Result Get_Coach_By_ID(int id);      
        [OperationContract]
        IEnumerable<Search_Train_TimeTable_Result> search_Train_By_StatinID(int OSID, int DSID, DateTime DD);
        [OperationContract]
        get_Ticket_By_ID_Result get_Ticket_By_ID(int id);
        [OperationContract]
        IEnumerable<Get_Coach_By_Train_ID_Result> GetCoachByTrainID(int trainid);
        [OperationContract]
        IEnumerable<Search_Coach_Type_Result> Search_Coach(int trainid, string coachtype);
        [OperationContract]
        IEnumerable<get_Passenger_By_Email_Result> Get_Passenger_By_Email(string email, string phonenumber);
        [OperationContract]
        IEnumerable<get_Ticket_By_PNR_Result> get_Ticket_By_PNR(string pnr);
        [OperationContract]
        int Update_Password(User user);
        [OperationContract]
        int Cancel_Ticket(int id, string status);
        [OperationContract]
        IEnumerable<get_Ticket_By_TrainID_Result> Get_Ticket_By_Train_ID(int trainid, string ct);
        [OperationContract]
        IEnumerable<get_Station_By_Status_Result> GetStationByStatus();
        [OperationContract]
        IEnumerable<Get_Coach_By_Train_Result> Get_Coach_By_Train(int idtrain);
        //[OperationContract]
        //IEnumerable<Get_Train_Des_Schedule_Result> Get_Train_Des_Schedule(int id, DateTime dt);
        [OperationContract]
        IEnumerable<Get_train_By_OS_Result> Get_Train_OS(int id);
        [OperationContract]
        IEnumerable<Get_Train_By_Time_Sche2_Result> Get_Train_Time_Sche(int id, DateTime dt);

        // TODO: Add your service operations here
    }


    // Use a data contract as illustrated in the sample below to add composite types to service operations.

}

