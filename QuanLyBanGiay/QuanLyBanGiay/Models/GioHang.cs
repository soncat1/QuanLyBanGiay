using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace QuanLyBanGiay.Models
{
    public class GioHang
    {
        QLGEntities db = new QLGEntities();
        public string IDGiay{ get; set; }
        public string TenGiay{get;set;}
        public string Anh { get; set; }
        public double DonGiaB { get; set; }
        public int SoLuong { get; set; }
        public double ThanhTien {
            get { return SoLuong * DonGiaB; }
        }
        //Hàm tạo cho giỏ hàng
        public GioHang(string iIDGiay)
        {
          IDGiay = iIDGiay;
          GIAY giay = db.GIAYs.Single(n =>n.IDGIAY==IDGiay);
          TenGiay = giay.Tengiay;
          Anh = giay.Anh;
          DonGiaB = double.Parse(giay.DongiaB.ToString());
          SoLuong = 1;

        }

    }
}