//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Entities
{
    using System;
    
    public partial class get_Ticket_By_PNR_Result
    {
        public int Ticket_ID { get; set; }
        public string PNR { get; set; }
        public string Passenger_type { get; set; }
        public string Status { get; set; }
        public Nullable<int> Train_ID { get; set; }
        public Nullable<System.DateTime> Departure_Date { get; set; }
        public Nullable<System.TimeSpan> Departure_Time { get; set; }
        public string Coach_Type { get; set; }
        public Nullable<double> Price { get; set; }
        public string Train_Name { get; set; }
        public string Destination_Station { get; set; }
        public string Origin_Station { get; set; }
    }
}
