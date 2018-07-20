using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;

namespace QuanLyBanGiay.Controllers
{
    public class GiayNuController : Controller
    {
        QLGEntities db = new QLGEntities();
        //
        // GET: /GiayNu/
     
        public ViewResult GiayNu(string LoaiGiay)
        {
            List<GIAY> lstGiay = db.GIAYs.Where(n => n.Loaigiay == "Nữ").OrderBy(n => n.DongiaB).ToList();
            return View(lstGiay);
        }
        public ViewResult XemChiTiet(string IDGiay)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGiay);
            if (giay == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(giay);
        }
	}
}