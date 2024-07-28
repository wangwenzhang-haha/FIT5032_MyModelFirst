using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_MyModelFirst.Models;

namespace FIT5032_MyModelFirst.Controllers
{
    public class UsersController : Controller
    {
        private FIT5032_MyModelFirstContainer db = new FIT5032_MyModelFirstContainer();

        // GET: Users
        public ActionResult Index()
        {
            var usersSet = db.UsersSet.Include(u => u.Students).Include(u => u.Tutors);
            return View(usersSet.ToList());
        }

        // GET: Users/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.UsersSet.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // GET: Users/Create
        public ActionResult Create()
        {
            ViewBag.Id = new SelectList(db.StudentsSet, "Id", "firstname");
            ViewBag.Id = new SelectList(db.TutorsSet, "Id", "firstname");
            return View();
        }

        // POST: Users/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,userName,email,password,role,createdAt")] Users users)
        {
            if (ModelState.IsValid)
            {
                db.UsersSet.Add(users);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Id = new SelectList(db.StudentsSet, "Id", "firstname", users.Id);
            ViewBag.Id = new SelectList(db.TutorsSet, "Id", "firstname", users.Id);
            return View(users);
        }

        // GET: Users/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.UsersSet.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id = new SelectList(db.StudentsSet, "Id", "firstname", users.Id);
            ViewBag.Id = new SelectList(db.TutorsSet, "Id", "firstname", users.Id);
            return View(users);
        }

        // POST: Users/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,userName,email,password,role,createdAt")] Users users)
        {
            if (ModelState.IsValid)
            {
                db.Entry(users).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(db.StudentsSet, "Id", "firstname", users.Id);
            ViewBag.Id = new SelectList(db.TutorsSet, "Id", "firstname", users.Id);
            return View(users);
        }

        // GET: Users/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Users users = db.UsersSet.Find(id);
            if (users == null)
            {
                return HttpNotFound();
            }
            return View(users);
        }

        // POST: Users/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Users users = db.UsersSet.Find(id);
            db.UsersSet.Remove(users);
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
