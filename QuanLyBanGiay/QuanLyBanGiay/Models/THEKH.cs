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
    
    public partial class THEKH
    {
        public string MaThe { get; set; }
        public string IDKH { get; set; }
        public string MaLoai { get; set; }
        public Nullable<System.DateTime> Ngaycap { get; set; }
    
        public virtual KHACHHANG KHACHHANG { get; set; }
        public virtual LOAITHE LOAITHE { get; set; }
    }
}
