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
    
    public partial class CTHDB
    {
        public string IDB { get; set; }
        public string MaHDB { get; set; }
        public string IDGIAY { get; set; }
        public string Donvi { get; set; }
        public Nullable<int> DongiaB { get; set; }
        public Nullable<int> Soluong { get; set; }
        public Nullable<int> Thanhtien { get; set; }
    
        public virtual GIAY GIAY { get; set; }
        public virtual HDB HDB { get; set; }
    }
}
