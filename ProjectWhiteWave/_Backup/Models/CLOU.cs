//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ProjectWhiteWave.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class CLOU
    {
        public int Id { get; set; }
        public System.DateTime Year { get; set; }
        public byte[] Text { get; set; }
        public int EmployeeId { get; set; }
    
        public virtual Employee Employee { get; set; }
    }
}
