//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyBanGiay.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class HDB
    {
        public HDB()
        {
            this.CTHDBs = new HashSet<CTHDB>();
            this.DOITRAs = new HashSet<DOITRA>();
        }
    
        public string MaHDB { get; set; }
        public Nullable<System.DateTime> Ngaylap { get; set; }
        public string MaThe { get; set; }
        public string IDKH { get; set; }
        public Nullable<int> Chietkhau { get; set; }
        public Nullable<int> Thanhtien { get; set; }
    
        public virtual ICollection<CTHDB> CTHDBs { get; set; }
        public virtual ICollection<DOITRA> DOITRAs { get; set; }
    }
}
