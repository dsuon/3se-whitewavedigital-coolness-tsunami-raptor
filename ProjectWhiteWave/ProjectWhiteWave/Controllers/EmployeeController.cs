using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ProjectWhiteWave.Models;

namespace ProjectWhiteWave.Controllers
{
    public class EmployeeController : Controller
    {
        private WhiteWaveModelsContainer db = new WhiteWaveModelsContainer();

        // GET: /Employee/
        public ActionResult Index()
        {
            var employees = db.Employees;
            /*
            var people = db.People
                .Include(p => p.FirstName)
                .Include(p => p.LastName);
             * */
            return View(employees.ToList());
        }

        // GET: /Employee/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = (Employee)db.People.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // GET: /Employee/Create
        public ActionResult Create()
        {
            ViewBag.EmployeeTypeId = new SelectList(db.EmployeeTypes, "Id", "Type");
            return View();
        }

        // POST: /Employee/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,FirstName,LastName,EmployeeTypeId,SSN")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.People.Add(employee);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.EmployeeTypeId = new SelectList(db.EmployeeTypes, "Id", "Type", employee.EmployeeTypeId);
            return View(employee);
        }

        // GET: /Employee/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = (Employee)db.People.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.EmployeeTypeId = new SelectList(db.EmployeeTypes, "Id", "Type", employee.EmployeeTypeId);
            return View(employee);
        }

        // POST: /Employee/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,FirstName,LastName,EmployeeTypeId,SSN")] Employee employee)
        {
            if (ModelState.IsValid)
            {
                db.Entry(employee).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.EmployeeTypeId = new SelectList(db.EmployeeTypes, "Id", "Type", employee.EmployeeTypeId);
            return View(employee);
        }

        // GET: /Employee/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Employee employee = (Employee)db.People.Find(id);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return View(employee);
        }

        // POST: /Employee/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Employee employee = (Employee)db.People.Find(id);
            db.People.Remove(employee);
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
