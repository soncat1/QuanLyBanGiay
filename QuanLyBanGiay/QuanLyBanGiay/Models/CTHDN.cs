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
    
    public partial class CTHDN
    {
        public string IDN { get; set; }
        public string MaHDN { get; set; }
        public string IDGIAY { get; set; }
        public string Donvi { get; set; }
        public Nullable<int> DongiaN { get; set; }
        public Nullable<int> Soluong { get; set; }
        public Nullable<int> Thanhtien { get; set; }
    
        public virtual GIAY GIAY { get; set; }
        public virtual HDN HDN { get; set; }
    }
}
