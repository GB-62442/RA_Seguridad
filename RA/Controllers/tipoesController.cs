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
    [Authorize]
    public class tipoesController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/tipoes
        [HttpGet]
        public IEnumerable<tipo> Gettipo()
        {

            foreach (tipo tipo in db.tipo)
            {
                tipo.tipo_nombre = Servicios.Base64Encrypt.DecriptarDesdeBase64(tipo.tipo_nombre);
 
            }

            return db.tipo.ToList();
        }

        // GET: api/tipoes/5
        [HttpGet]
        [ResponseType(typeof(tipo))]
        public IHttpActionResult Gettipo(int id)
        {
            tipo tipo = db.tipo.Find(id);
            if (tipo == null)
            {
                return NotFound();
            }

            tipo.tipo_nombre = Servicios.Base64Encrypt.DecriptarDesdeBase64(tipo.tipo_nombre);

            return Ok(tipo);
        }

        // PUT: api/tipoes/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public IHttpActionResult Puttipo(int id, tipo tipo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipo.tipo_id)
            {
                return BadRequest();
            }

            tipo.tipo_nombre = Servicios.Base64Encrypt.EncriptarABase64(tipo.tipo_nombre);

            db.Entry(tipo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tipoExists(id))
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

        // POST: api/tipoes
        [HttpPost]
        [ResponseType(typeof(tipo))]
        public IHttpActionResult Posttipo(tipo tipo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            tipo.tipo_nombre = Servicios.Base64Encrypt.EncriptarABase64(tipo.tipo_nombre);

            db.tipo.Add(tipo);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = tipo.tipo_id }, tipo);
        }

        // DELETE: api/tipoes/5
        [HttpDelete]
        [ResponseType(typeof(tipo))]
        public IHttpActionResult Deletetipo(int id)
        {
            tipo tipo = db.tipo.Find(id);
            if (tipo == null)
            {
                return NotFound();
            }

            db.tipo.Remove(tipo);
            db.SaveChanges();

            return Ok(tipo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tipoExists(int id)
        {
            return db.tipo.Count(e => e.tipo_id == id) > 0;
        }
    }
}