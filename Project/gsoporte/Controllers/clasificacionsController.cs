using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using gsoporte;

namespace gsoporte.Controllers
{
    public class clasificacionsController : Controller
    {
        private soporteEntities db = new soporteEntities();

        // GET: clasificacions
        public async Task<ActionResult> Index()
        {
            return View(await db.clasificacion.ToListAsync());
        }

        // GET: clasificacions/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            clasificacion clasificacion = await db.clasificacion.FindAsync(id);
            if (clasificacion == null)
            {
                return HttpNotFound();
            }
            return View(clasificacion);
        }

        // GET: clasificacions/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: clasificacions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idClasificacion,Clasificacion1,Orden,Activo")] clasificacion clasificacion)
        {
            if (ModelState.IsValid)
            {
                db.clasificacion.Add(clasificacion);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(clasificacion);
        }

        // GET: clasificacions/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            clasificacion clasificacion = await db.clasificacion.FindAsync(id);
            if (clasificacion == null)
            {
                return HttpNotFound();
            }
            return View(clasificacion);
        }

        // POST: clasificacions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idClasificacion,Clasificacion1,Orden,Activo")] clasificacion clasificacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(clasificacion).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(clasificacion);
        }

        // GET: clasificacions/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            clasificacion clasificacion = await db.clasificacion.FindAsync(id);
            if (clasificacion == null)
            {
                return HttpNotFound();
            }
            return View(clasificacion);
        }

        // POST: clasificacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            clasificacion clasificacion = await db.clasificacion.FindAsync(id);
            db.clasificacion.Remove(clasificacion);
            await db.SaveChangesAsync();
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
