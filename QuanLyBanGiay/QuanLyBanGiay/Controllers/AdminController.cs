using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyBanGiay.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace QuanLyBanGiay.Controllers
{
    public class AdminController : Controller
    {
        QLGEntities db = new QLGEntities();
        public ActionResult Admin(int? page)
        {
            int pageNumber = (page ?? 1);
            int pagesize = 10;
            return View(db.GIAYs.ToList().OrderBy(n => n.IDGIAY).ToPagedList(pageNumber, pagesize));
        }
        [HttpGet]
        public ActionResult Themmoi()
        {

            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themmoi(GIAY giay, HttpPostedFileBase fileUpload)
        {
            if (fileUpload == null)
            {
                ViewBag.ThongBao = "Chọn hình ảnh";
                return View();
            }
            if (ModelState.IsValid)
            {
                var fileName = Path.GetFileName(fileUpload.FileName);
                var path = Path.Combine(Server.MapPath("~/imagesSP"), fileName);
                if (System.IO.File.Exists(path))
                {
                    ViewBag.ThongBao = " HÌnh ảnh đã tồn tại";
                }
                else
                {
                    fileUpload.SaveAs(path);
                }
                giay.Anh = fileUpload.FileName;
                db.GIAYs.Add(giay);
                db.SaveChanges();
            }
            return View();
        }
        [HttpGet]
        public ActionResult Edit(string IDGIAY)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGIAY);
            if (giay == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(giay);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit(GIAY giay,FormCollection f)
        {
            if (ModelState.IsValid)
            {
                //Thực hiện cập nhận trong model
                db.Entry(giay).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
            }
            return RedirectToAction("Admin");
        
        }
        [HttpGet]
        public ActionResult Delete(string IDGIAY)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGIAY);
            if (giay == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(giay);
        }
        [HttpPost, ActionName("Delete")]

        public ActionResult XacNhanXoa(string IDGIAY)
        {
            GIAY giay = db.GIAYs.SingleOrDefault(n => n.IDGIAY == IDGIAY);
            if (giay == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.GIAYs.Remove(giay);
            db.SaveChanges();
            return RedirectToAction("Admin");

        }
    }
}
