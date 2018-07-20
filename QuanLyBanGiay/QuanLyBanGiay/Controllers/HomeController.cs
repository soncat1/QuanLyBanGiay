using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;
using PagedList;
using PagedList.Mvc;

namespace QuanLyBanGiay.Controllers
{
    public class HomeController : Controller
    {
        QLGEntities db = new QLGEntities();
        // GET: Home
        public ActionResult Index(int? page)
        {
            int pageNumber = (page ?? 1);
            int pagesize = 5;
            return View(db.GIAYs.ToList().OrderBy(n => n.IDGIAY).ToPagedList(pageNumber, pagesize));
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