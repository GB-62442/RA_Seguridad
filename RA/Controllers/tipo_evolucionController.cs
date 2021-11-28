using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using RA.Models;

namespace RA.Controllers
{
    public class tipo_evolucionController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/tipo_evolucion
        [HttpGet]
        public IEnumerable<tipo_evolucion> Gettipo_evolucion()
        {
            return db.tipo_evolucion.ToList();
        }

        // GET: api/tipo_evolucion/5
        [HttpGet]
        [ResponseType(typeof(tipo_evolucion))]
        public IHttpActionResult Gettipo_evolucion(int id)
        {
            tipo_evolucion tipo_evolucion = db.tipo_evolucion.Find(id);
            if (tipo_evolucion == null)
            {
                return NotFound();
            }

            return Ok(tipo_evolucion);
        }

        [HttpPut]
        // PUT: api/tipo_evolucion/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Puttipo_evolucion(int id, tipo_evolucion tipo_evolucion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipo_evolucion.tipoe_id)
            {
                return BadRequest();
            }

            db.Entry(tipo_evolucion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tipo_evolucionExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/tipo_evolucion
        [HttpPost]
        [ResponseType(typeof(tipo_evolucion))]
        public IHttpActionResult Posttipo_evolucion(tipo_evolucion tipo_evolucion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tipo_evolucion.Add(tipo_evolucion);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipo_evolucion.tipoe_id }, tipo_evolucion);
        }

        // DELETE: api/tipo_evolucion/5
        [HttpDelete]
        [ResponseType(typeof(tipo_evolucion))]
        public IHttpActionResult Deletetipo_evolucion(int id)
        {
            tipo_evolucion tipo_evolucion = db.tipo_evolucion.Find(id);
            if (tipo_evolucion == null)
            {
                return NotFound();
            }

            db.tipo_evolucion.Remove(tipo_evolucion);
            db.SaveChanges();

            return Ok(tipo_evolucion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tipo_evolucionExists(int id)
        {
            return db.tipo_evolucion.Count(e => e.tipoe_id == id) > 0;
        }
    }
}