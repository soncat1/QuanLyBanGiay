using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;
namespace QuanLyBanGiay.Controllers
{
    public class KhachHangController : Controller
    {
        QLGEntities db = new QLGEntities();
        //
        // GET: /KhachHang/
        public String tangtudong()
        {
            String matudong = "KH000";
            int dem = 0;
            List<KHACHHANG> cthh = db.KHACHHANGs.ToList();
            if (cthh.Count == 0)
            {
                dem++;
                matudong += "1";
            }
            else
            {
                if (cthh.Count < 9)
                {
                    dem = cthh.Count + 1;
                    matudong += dem.ToString();
                }
                else
                {
                    if (cthh.Count >= 9 && cthh.Count < 99)
                    {
                        matudong = "KH0";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();

                    }
                    else
                    {
                        matudong = "KH";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();
                    }
                }
            }
            return matudong;
        }
        public ActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        public ActionResult DangKy(FormCollection f)
        {     
            string sGioiTinh = f["txtgioitinh"].ToString();
            KHACHHANG khachhang = new KHACHHANG();
            khachhang.IDKH = tangtudong();
            khachhang.tenkhachhang = f["txttendangnhap"].ToString();
            if (sGioiTinh == "Nam")
                khachhang.gioitinh = true;
            else
                khachhang.gioitinh = false;
            khachhang.diachi = f["txtdiachi"].ToString();
            khachhang.sodienthoai = f["txtsodienthoai"].ToString();
            khachhang.email = f["txtemail"].ToString();
            db.KHACHHANGs.Add(khachhang);
            db.SaveChanges();
            return RedirectToAction("DatHang","GioHang");
        }

	}
}