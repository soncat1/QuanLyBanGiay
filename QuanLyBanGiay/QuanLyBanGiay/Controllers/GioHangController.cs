using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;

namespace QuanLyBanGiay.Controllers
{
    public class GioHangController : Controller
    {
        #region Giỏ hàng
        QLGEntities db = new QLGEntities();
       //sinh ma tu dong
        public String tangtudong()
        {
            String matudong = "HDB000";
            int dem = 0;
            List<HDB> cthh = db.HDBs.ToList();
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
                        matudong = "HDB0";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();

                    }
                    else
                    {
                        matudong = "HDB";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();
                    }
                }
            }
            return matudong;
        }
        public String tangtudong1()
        {
            String matudong = "IDB000";
            int dem = 0;
            List<HDB> cthh = db.HDBs.ToList();
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
                        matudong = "IDB0";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();

                    }
                    else
                    {
                        matudong = "IDB";
                        dem = cthh.Count + 1;
                        matudong += dem.ToString();
                    }
                }
            }
            return matudong;
        }
       //Lấy giỏ hàng
        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if(lstGioHang==null)
            {
                //Nếu giỏ hàng chưa tồn tại thì tiến hành khởi tạo list giỏ hàng(sessionGioHang)
                lstGioHang = new List<GioHang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }
        //Thêm giỏ hàng
        public ActionResult ThemGioHang(string IDGiay,string strURL)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGiay);
            if(giay==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //Lấy ra sessionGioHang
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra giày tồn tại trong session[giohang] chưa
            GioHang sanpham = lstGioHang.Find(n => n.IDGiay == IDGiay);
            if(sanpham==null)
            {
                sanpham = new GioHang(IDGiay);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.SoLuong++;
                return Redirect(strURL);
            }
        }
        //Cập nhật giỏ hàng
        public ActionResult CapNhatGioHang(string IDGiay,FormCollection f)
        {
            //Kiểm tra idgiay
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGiay);
            if(giay==null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            //Kiểm tra sp có tồn tại trong sesion["GioHang"]
            GioHang sanpham = lstGioHang.Find(n => n.IDGiay == IDGiay);
            if(sanpham!=null)
            {
                sanpham.SoLuong = int.Parse(f["txtSoLuong"].ToString());
            }
            return RedirectToAction("GioHang");
        }
        //Xóa giỏ hàng
        public ActionResult XoaGioHang(string IDGiay)
        {
            //Kiểm tra idgiay
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGiay);
            if (giay == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            List<GioHang> lstGioHang = LayGioHang();
            GioHang sanpham = lstGioHang.Find(n => n.IDGiay == IDGiay);
            if(sanpham!=null)
            {
                lstGioHang.RemoveAll(n=>n.IDGiay== IDGiay);
            }
            if(lstGioHang.Count==0)
            {
                return RedirectToAction("Index","Home");
            }
            return RedirectToAction("GioHang");
        }
        //Xây dựng trang giỏ hàng
        public ActionResult GioHang()
        {
            if(Session["GioHang"]==null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        //Tính tổng số lượng và thành tiền
        //Tính tổng số lượng
        private int TongSoLuong()
        {
            int TongSoLuong = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if(lstGioHang!=null)
            {
                TongSoLuong = lstGioHang.Sum(n => n.SoLuong);
            }
            return TongSoLuong;
        }
        //Tính tổng thành tiền
        private double TongTien()
        {
            double TongTien = 0;
            List<GioHang> lstGioHang = Session["GioHang"] as List<GioHang>;
            if (lstGioHang != null)
            {
                TongTien = lstGioHang.Sum(n => n.ThanhTien);
            }
            return TongTien;
        }
        public ActionResult GioHangPartial()
        {
            if(TongSoLuong()==0)
            {
                return PartialView();
            }
            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return PartialView();
        }
        //Xây dựng 1 view cho ng dùng sửa giỏ hàng
        public ActionResult SuaGioHang()
        {
            if (Session["GioHang"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            List<GioHang> lstGioHang = LayGioHang();
            return View(lstGioHang);
        }
        #endregion
        #region Đặt hàng
        //Xây dựng chức năng đặt hàng
        public ActionResult DatHang()
        {
            //Kiểm tra giỏ hàng
            if (Session["GioHang"] == null)
            {
                RedirectToAction("Index", "Home");
            }
            //Thêm hóa đơn bán
            HDB hdb = new HDB();
            KHACHHANG kh = new KHACHHANG();
            string idkh = db.KHACHHANGs.Max(x => x.IDKH);
            List<GioHang> gh = LayGioHang();
            
            hdb.IDKH = idkh;
            hdb.MaHDB =tangtudong();
            hdb.MaThe = "MT001";
            hdb.Ngaylap = DateTime.Now;
            hdb.Chietkhau = 0;
            hdb.Thanhtien = (int)TongTien();
            db.HDBs.Add(hdb);
            db.SaveChanges();
            //Thêm chi tiết hóa đơn bán

            foreach (var item in gh)
            {
                CTHDB ctHDB = new CTHDB();
                ctHDB.IDB = tangtudong1();
                ctHDB.MaHDB = hdb.MaHDB;
                ctHDB.IDGIAY = item.IDGiay;
                ctHDB.Donvi = "Đôi";
                ctHDB.Soluong = item.SoLuong;
                ctHDB.DongiaB = (int)item.DonGiaB;
                ctHDB.Thanhtien = hdb.Thanhtien;
                db.CTHDBs.Add(ctHDB);

            }
            db.SaveChanges();

            return RedirectToAction("Index", "Home");
        }
        #endregion
    }

}