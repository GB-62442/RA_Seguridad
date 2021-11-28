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
    public class usuariosController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/usuarios
        [HttpGet]
        public IEnumerable<usuario> Getusuario()
        {
            foreach(usuario usuario in db.usuario)
            {
                usuario.usuario_nombre = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_nombre);
                usuario.usuario_apellido = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_apellido);
                usuario.usuario_genero = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_genero);
                 
            }
            return db.usuario.ToList();
        }

        // GET: api/usuarios/5
        [HttpGet]
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Getusuario(int id)
        {
            usuario usuario = db.usuario.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            usuario.usuario_nombre = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_nombre);
            usuario.usuario_apellido = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_apellido);
            usuario.usuario_genero = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_genero);
            usuario.usuario_pass = Servicios.Base64Encrypt.DecriptarDesdeBase64(usuario.usuario_pass);

            return Ok(usuario);
        }

        // PUT: api/usuarios/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public IHttpActionResult Putusuario(int id, usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuario.usuario_id)
            {
                return BadRequest();
            }

            usuario.usuario_nombre = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_nombre);
            usuario.usuario_apellido = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_apellido);
            usuario.usuario_genero = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_genero);
            usuario.usuario_pass = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_pass);
 
            db.Entry(usuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!usuarioExists(id))
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

        // POST: api/usuarios
        [HttpPost]
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Postusuario(usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            usuario.usuario_nombre = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_nombre);
            usuario.usuario_apellido = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_apellido);
            usuario.usuario_genero = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_genero);
            usuario.usuario_pass = Servicios.Base64Encrypt.EncriptarABase64(usuario.usuario_pass);


            db.usuario.Add(usuario);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = usuario.usuario_id }, usuario);
        }

        // DELETE: api/usuarios/5
        [HttpDelete]
        [ResponseType(typeof(usuario))]
        public IHttpActionResult Deleteusuario(int id)
        {
            usuario usuario = db.usuario.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            db.usuario.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool usuarioExists(int id)
        {
            return db.usuario.Count(e => e.usuario_id == id) > 0;
        }
    }
}