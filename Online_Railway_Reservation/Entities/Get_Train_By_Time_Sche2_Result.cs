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
    
    public partial class Get_Train_By_Time_Sche2_Result
    {
        public int Train_ID { get; set; }
        public string Train_Name { get; set; }
        public string Train_Type { get; set; }
        public int Timetable_ID { get; set; }
        public Nullable<System.DateTime> Departure_Date { get; set; }
        public Nullable<System.TimeSpan> Departure_Time { get; set; }
        public Nullable<double> Distance { get; set; }
        public int Station_ID { get; set; }
        public string Station_Name { get; set; }
    }
}
