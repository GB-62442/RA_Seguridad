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
    public class tipopkmnsController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/tipopkmns
        [HttpGet]
        public IEnumerable<tipopkmn> Gettipopkmn()
        {
            return db.tipopkmn.ToList();
        }

        // GET: api/tipopkmns/5
        [HttpGet]
        [ResponseType(typeof(tipopkmn))]
        public IHttpActionResult Gettipopkmn(int id)
        {
            tipopkmn tipopkmn = db.tipopkmn.Find(id);
            if (tipopkmn == null)
            {
                return NotFound();
            }

            return Ok(tipopkmn);
        }

        // PUT: api/tipopkmns/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public IHttpActionResult Puttipopkmn(int id, tipopkmn tipopkmn)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipopkmn.tipopkmn_id)
            {
                return BadRequest();
            }

            db.Entry(tipopkmn).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tipopkmnExists(id))
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

        // POST: api/tipopkmns
        [HttpPost]
        [ResponseType(typeof(tipopkmn))]
        public IHttpActionResult Posttipopkmn(tipopkmn tipopkmn)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tipopkmn.Add(tipopkmn);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (tipopkmnExists(tipopkmn.tipopkmn_id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tipopkmn.tipopkmn_id }, tipopkmn);
        }

        // DELETE: api/tipopkmns/5
        [HttpDelete]
        [ResponseType(typeof(tipopkmn))]
        public IHttpActionResult Deletetipopkmn(int id)
        {
            tipopkmn tipopkmn = db.tipopkmn.Find(id);
            if (tipopkmn == null)
            {
                return NotFound();
            }

            db.tipopkmn.Remove(tipopkmn);
            db.SaveChanges();

            return Ok(tipopkmn);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tipopkmnExists(int id)
        {
            return db.tipopkmn.Count(e => e.tipopkmn_id == id) > 0;
        }
    }
}