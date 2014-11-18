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
    public class SupportEventController : Controller
    {
        private WhiteWaveModelsContainer db = new WhiteWaveModelsContainer();

        // GET: /SupportEvent/
        public ActionResult Index()
        {
            var supportevents = db.SupportEvents.Include(s => s.Ticket);
            return View(supportevents.ToList());
        }

        // GET: /SupportEvent/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SupportEvent supportevent = db.SupportEvents.Find(id);
            if (supportevent == null)
            {
                return HttpNotFound();
            }
            return View(supportevent);
        }

        // GET: /SupportEvent/Details/5
        public ActionResult DetailsForActiveTicket(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SupportEvent supportevent = db.SupportEvents.Find(id);
            if (supportevent == null)
            {
                return HttpNotFound();
            }
            return View(supportevent);
        }

        // GET: /SupportEvent/Create
        public ActionResult Create(int? ticketId)
        {
            if (ticketId == null)
            {
                SupportEvent se = new SupportEvent();
                se.TicketId = (int)ticketId;
                se.DateOpened = DateTime.Now;
                return View(se);
            }
            
            // ViewBag.TicketId = new SelectList(db.Tickets, "TicketId", "TicketId");
            return View();
        }

        public ActionResult CreateForActiveTicket(int? ticketId)
        {
            SupportEvent se = new SupportEvent();
            se.TicketId = (int)ticketId;
            se.DateOpened = DateTime.Now;
            return View(se);
        }

        // POST: /SupportEvent/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="SupportEventId,DateOpened,DateClosed,TicketId,Description")] SupportEvent supportevent, FormCollection values)
        {
            supportevent.TicketId = Int32.Parse(values["ticketId"]);
            if (ModelState.IsValid)
            {
                db.SupportEvents.Add(supportevent);
                db.SaveChanges();
                return RedirectToAction((Boolean.Parse(values["active"])) ?
                    "Details" : "ActiveTicketDetails", "Ticket", new { id = supportevent.TicketId });
            }
            
            // ViewBag.TicketId = new SelectList(db.Tickets, "TicketId", "TicketId", supportevent.TicketId);
            return View(supportevent);
             
        }

        // GET: /SupportEvent/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SupportEvent supportevent = db.SupportEvents.Find(id);
            if (supportevent == null)
            {
                return HttpNotFound();
            }
            ViewBag.TicketId = new SelectList(db.Tickets, "TicketId", "TicketId", supportevent.TicketId);
            return View(supportevent);
        }

        // GET: /SupportEvent/Edit/5
        public ActionResult EditForActiveTicket(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SupportEvent supportevent = db.SupportEvents.Find(id);
            if (supportevent == null)
            {
                return HttpNotFound();
            }
            //ViewBag.TicketId = new SelectList(db.Tickets, "TicketId", "TicketId", supportevent.TicketId);
            return View(supportevent);
        }

        // POST: /SupportEvent/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="SupportEventId,DateOpened,DateClosed,TicketId,Description")] SupportEvent supportevent, bool? active)
        {
            if (ModelState.IsValid)
            {
                db.Entry(supportevent).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction(((bool)active) ? 
                    "ActiveTicketDetails" : "Details", "Ticket", new { id = supportevent.TicketId });
            }
            // ViewBag.TicketId = new SelectList(db.Tickets, "TicketId", "TicketId");
            return View(supportevent);
        }

        // GET: /SupportEvent/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SupportEvent supportevent = db.SupportEvents.Find(id);
            if (supportevent == null)
            {
                return HttpNotFound();
            }
            return View(supportevent);
        }

        // POST: /SupportEvent/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SupportEvent supportevent = db.SupportEvents.Find(id);
            db.SupportEvents.Remove(supportevent);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ActiveDetail(int? id)
        {
            return RedirectToAction("ActiveTicketDetails", "Ticket", new { id = id });
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
