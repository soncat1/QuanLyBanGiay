using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;

namespace QuanLyBanGiay.Controllers
{
    
    public class GiayController : Controller
    {
        QLGEntities db = new QLGEntities();
        //
        // GET: /Giay/
        public ActionResult Index()
        {
            return View();
        }
     public ViewResult XemChiTiet(string IDGiay)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGiay);
         if(giay==null)
         {
             Response.StatusCode = 404;
             return null;
         }
         ViewBag.TenNCC = db.NCCs.Single(n => n.IDNCC == giay.IDNCC).TenNCC;
         return View(giay);
        }
	}
}