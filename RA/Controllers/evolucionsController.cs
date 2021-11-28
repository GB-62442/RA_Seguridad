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
    public class evolucionsController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/evolucions
        [HttpGet]
        public IEnumerable<evolucion> Getevolucion()
        {
            return db.evolucion.ToList();
        }

        // GET: api/evolucions/5
        [HttpGet]
        [ResponseType(typeof(evolucion))]
        public IHttpActionResult Getevolucion(int id)
        {
            evolucion evolucion = db.evolucion.Find(id);
            if (evolucion == null)
            {
                return NotFound();
            }

            return Ok(evolucion);
        }

        // PUT: api/evolucions/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public IHttpActionResult Putevolucion(int id, evolucion evolucion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != evolucion.evolucion_id)
            {
                return BadRequest();
            }

            db.Entry(evolucion).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!evolucionExists(id))
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

        // POST: api/evolucions
        [HttpPost]
        [ResponseType(typeof(evolucion))]
        public IHttpActionResult Postevolucion(evolucion evolucion)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.evolucion.Add(evolucion);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (evolucionExists(evolucion.evolucion_id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = evolucion.evolucion_id }, evolucion);
        }

        // DELETE: api/evolucions/5
        [HttpDelete]
        [ResponseType(typeof(evolucion))]
        public IHttpActionResult Deleteevolucion(int id)
        {
            evolucion evolucion = db.evolucion.Find(id);
            if (evolucion == null)
            {
                return NotFound();
            }

            db.evolucion.Remove(evolucion);
            db.SaveChanges();

            return Ok(evolucion);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool evolucionExists(int id)
        {
            return db.evolucion.Count(e => e.evolucion_id == id) > 0;
        }
    }
}