using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MvcTestDeployApp.Models;

namespace MvcTestDeployApp.Controllers
{
    public class MVCGridToolbarModelsController : Controller
    {
        private MvcTestDeployAppContext db = new MvcTestDeployAppContext();

        // GET: MVCGridToolbarModels
        public ActionResult Index()
        {
            return View(db.MVCGridToolbarModels.ToList());
        }

        // GET: MVCGridToolbarModels/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MVCGridToolbarModel mVCGridToolbarModel = db.MVCGridToolbarModels.Find(id);
            if (mVCGridToolbarModel == null)
            {
                return HttpNotFound();
            }
            return View(mVCGridToolbarModel);
        }

        // GET: MVCGridToolbarModels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MVCGridToolbarModels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MVCGridToolbarModelId,MVCGridName,PageSize,ColumnVisibility,Export,GlobalSearch")] MVCGridToolbarModel mVCGridToolbarModel)
        {
            if (ModelState.IsValid)
            {
                db.MVCGridToolbarModels.Add(mVCGridToolbarModel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(mVCGridToolbarModel);
        }

        // GET: MVCGridToolbarModels/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MVCGridToolbarModel mVCGridToolbarModel = db.MVCGridToolbarModels.Find(id);
            if (mVCGridToolbarModel == null)
            {
                return HttpNotFound();
            }
            return View(mVCGridToolbarModel);
        }

        // POST: MVCGridToolbarModels/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MVCGridToolbarModelId,MVCGridName,PageSize,ColumnVisibility,Export,GlobalSearch")] MVCGridToolbarModel mVCGridToolbarModel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(mVCGridToolbarModel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mVCGridToolbarModel);
        }

        // GET: MVCGridToolbarModels/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MVCGridToolbarModel mVCGridToolbarModel = db.MVCGridToolbarModels.Find(id);
            if (mVCGridToolbarModel == null)
            {
                return HttpNotFound();
            }
            return View(mVCGridToolbarModel);
        }

        // POST: MVCGridToolbarModels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            MVCGridToolbarModel mVCGridToolbarModel = db.MVCGridToolbarModels.Find(id);
            db.MVCGridToolbarModels.Remove(mVCGridToolbarModel);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
