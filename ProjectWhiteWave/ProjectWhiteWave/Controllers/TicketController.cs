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
    public class TicketController : Controller
    {
        private WhiteWaveModelsContainer db = new WhiteWaveModelsContainer();

        // GET: /TicketQueue/
        public ActionResult PriorityQueue()
        {
            
            var tickets = db.Tickets
                .Include(t => t.Priority)
                .Include(t => t.Status)
                .Include(t => t.Account)
                .Include(t => t.Employee);
            return View(tickets.ToList());
        }

        // GET: /Ticket/
        public ActionResult Index()
        {
            var tickets = db.Tickets
                .Include(t => t.Priority)
                .Include(t => t.Status)
                .Include(t => t.Account)
                .Include(t => t.Employee);
            return View(tickets.ToList());
        }

        // GET: /TicketQueue/ActiveTicketDetails
        public ActionResult ActiveTicketDetails(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ticket ticket = db.Tickets.Find(id);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            return View(ticket);
        }

        // GET: /Ticket/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ticket ticket = db.Tickets.Find(id);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            return View(ticket);
        }

        // POST: /Ticket/CreateSupportEvent
        public ActionResult CreateActiveSupportEvent(int? id)
        {
                return RedirectToAction("CreateForActiveTicket", "SupportEvent", new { ticketId = id });
        }

        // POST: /Ticket/CreateSupportEvent
        public ActionResult CreateSupportEvent(int? id)
        {
                return RedirectToAction("Create", "SupportEvent", new { ticketId = id });
        }

        // GET: /Ticket/Create
        public ActionResult Create()
        {
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name");
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name");
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name");
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName");
            return View();
        }

        // GET: /Ticket/Create
        public ActionResult CreateForQueue()
        {
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name");
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name");
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name");
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName");
            return View();
        }

        // POST: /Ticket/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="TicketId,DateOpened,DateClosed,PriorityId,StatusId,AccountId,EmployeeId")] Ticket ticket)
        {
            if (ModelState.IsValid)
            {
                db.Tickets.Add(ticket);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // POST: /Ticket/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateForQueue([Bind(Include = "TicketId,DateOpened,DateClosed,PriorityId,StatusId,AccountId,EmployeeId")] Ticket ticket)
        {
            if (ModelState.IsValid)
            {
                db.Tickets.Add(ticket);
                db.SaveChanges();
                return RedirectToAction("PriorityQueue");
            }

            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // GET: /Ticket/EditActiveTicket
        public ActionResult EditActiveTicket(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ticket ticket = db.Tickets.Find(id);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // GET: /Ticket/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ticket ticket = db.Tickets.Find(id);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // POST: /Ticket/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="TicketId,DateOpened,DateClosed,PriorityId,StatusId,AccountId,EmployeeId")] Ticket ticket, bool? active)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ticket).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction(((bool)active) ?
                    "PriorityQueue" : "Index");
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // POST: /Ticket/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditForQueue([Bind(Include = "TicketId,DateOpened,DateClosed,PriorityId,StatusId,AccountId,EmployeeId")] Ticket ticket)
        {
            if (ModelState.IsValid)
            {
                db.Entry(ticket).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("PriorityQueue");
            }
            ViewBag.PriorityId = new SelectList(db.Priorities, "PriorityId", "Name", ticket.PriorityId);
            ViewBag.StatusId = new SelectList(db.Status, "StatusId", "Name", ticket.StatusId);
            ViewBag.AccountId = new SelectList(db.Accounts, "AccountId", "Name", ticket.AccountId);
            ViewBag.EmployeeId = new SelectList(db.People, "Id", "FirstName", ticket.EmployeeId);
            return View(ticket);
        }

        // GET: /Ticket/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Ticket ticket = db.Tickets.Find(id);
            if (ticket == null)
            {
                return HttpNotFound();
            }
            return View(ticket);
        }

        // POST: /Ticket/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Ticket ticket = db.Tickets.Find(id);
            db.Tickets.Remove(ticket);
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
