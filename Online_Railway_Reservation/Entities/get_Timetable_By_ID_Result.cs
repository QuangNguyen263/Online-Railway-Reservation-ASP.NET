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
    
    public partial class get_Timetable_By_ID_Result
    {
        public int Timetable_ID { get; set; }
        public Nullable<System.DateTime> Departure_Date { get; set; }
        public Nullable<System.TimeSpan> Departure_Time { get; set; }
        public Nullable<System.DateTime> Arrival_Date { get; set; }
        public Nullable<System.TimeSpan> Arrival_Time { get; set; }
        public Nullable<double> Distance { get; set; }
        public Nullable<int> Train_ID { get; set; }
    }
}
