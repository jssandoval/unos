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
    public class soportesController : Controller
    {
        private soporteEntities db = new soporteEntities();

        // GET: soportes
        public async Task<ActionResult> Index()
        {
            var soporte = db.soporte.Include(s => s.clasificacion).Include(s => s.estado).Include(s => s.perfil).Include(s => s.prioridad).Include(s => s.usuario);
            return View(await soporte.ToListAsync());
        }

        // GET: soportes/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            soporte soporte = await db.soporte.FindAsync(id);
            if (soporte == null)
            {
                return HttpNotFound();
            }
            return View(soporte);
        }

        // GET: soportes/Create
        public ActionResult Create()
        {
            ViewBag.idClasificacion = new SelectList(db.clasificacion, "idClasificacion", "Clasificacion1");
            ViewBag.idEstado = new SelectList(db.estado, "idEstado", "Estado1");
            ViewBag.idPerfil = new SelectList(db.perfil, "idPerfil", "Perfil1");
            ViewBag.idPrioridad = new SelectList(db.prioridad, "idPrioridad", "Prioridad1");
            ViewBag.idPrioridad = new SelectList(db.usuario, "idUsuario", "Usuario1");
            return View();
        }

        // POST: soportes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idSoporte,idPerfil,idUsuario,Fecha,idClasificacion,idPrioridad,Asunto,HoraSoporte,idEstado,Activo")] soporte soporte)
        {
            if (ModelState.IsValid)
            {
                db.soporte.Add(soporte);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.idClasificacion = new SelectList(db.clasificacion, "idClasificacion", "Clasificacion1", soporte.idClasificacion);
            ViewBag.idEstado = new SelectList(db.estado, "idEstado", "Estado1", soporte.idEstado);
            ViewBag.idPerfil = new SelectList(db.perfil, "idPerfil", "Perfil1", soporte.idPerfil);
            ViewBag.idPrioridad = new SelectList(db.prioridad, "idPrioridad", "Prioridad1", soporte.idPrioridad);
            ViewBag.idPrioridad = new SelectList(db.usuario, "idUsuario", "Usuario1", soporte.idPrioridad);
            return View(soporte);
        }

        // GET: soportes/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            soporte soporte = await db.soporte.FindAsync(id);
            if (soporte == null)
            {
                return HttpNotFound();
            }
            ViewBag.idClasificacion = new SelectList(db.clasificacion, "idClasificacion", "Clasificacion1", soporte.idClasificacion);
            ViewBag.idEstado = new SelectList(db.estado, "idEstado", "Estado1", soporte.idEstado);
            ViewBag.idPerfil = new SelectList(db.perfil, "idPerfil", "Perfil1", soporte.idPerfil);
            ViewBag.idPrioridad = new SelectList(db.prioridad, "idPrioridad", "Prioridad1", soporte.idPrioridad);
            ViewBag.idPrioridad = new SelectList(db.usuario, "idUsuario", "Usuario1", soporte.idPrioridad);
            return View(soporte);
        }

        // POST: soportes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "idSoporte,idPerfil,idUsuario,Fecha,idClasificacion,idPrioridad,Asunto,HoraSoporte,idEstado,Activo")] soporte soporte)
        {
            if (ModelState.IsValid)
            {
                db.Entry(soporte).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.idClasificacion = new SelectList(db.clasificacion, "idClasificacion", "Clasificacion1", soporte.idClasificacion);
            ViewBag.idEstado = new SelectList(db.estado, "idEstado", "Estado1", soporte.idEstado);
            ViewBag.idPerfil = new SelectList(db.perfil, "idPerfil", "Perfil1", soporte.idPerfil);
            ViewBag.idPrioridad = new SelectList(db.prioridad, "idPrioridad", "Prioridad1", soporte.idPrioridad);
            ViewBag.idPrioridad = new SelectList(db.usuario, "idUsuario", "Usuario1", soporte.idPrioridad);
            return View(soporte);
        }

        // GET: soportes/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            soporte soporte = await db.soporte.FindAsync(id);
            if (soporte == null)
            {
                return HttpNotFound();
            }
            return View(soporte);
        }

        // POST: soportes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            soporte soporte = await db.soporte.FindAsync(id);
            db.soporte.Remove(soporte);
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
