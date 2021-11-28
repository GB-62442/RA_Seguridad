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
{[Authorize]
    public class pokemonsController : ApiController
    {
        private seguridad_apiEntities db = new seguridad_apiEntities();

        // GET: api/pokemons
        [HttpGet]
        public IEnumerable<pokemon> Getpokemon()
        {
            return db.pokemon.ToList();
        }

        // GET: api/pokemons/5
        [HttpGet]
        [ResponseType(typeof(pokemon))]
        public IHttpActionResult Getpokemon(int id)
        {
            pokemon pokemon = db.pokemon.Find(id);
            if (pokemon == null)
            {
                return NotFound();
            }

            return Ok(pokemon);
        }

        // PUT: api/pokemons/5
        [HttpPut]
        [ResponseType(typeof(void))]
        public IHttpActionResult Putpokemon(int id, pokemon pokemon)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != pokemon.pokemon_id)
            {
                return BadRequest();
            }

            db.Entry(pokemon).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!pokemonExists(id))
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

        // POST: api/pokemons
        [HttpPost]
        [ResponseType(typeof(pokemon))]
        public IHttpActionResult Postpokemon(pokemon pokemon)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.pokemon.Add(pokemon);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = pokemon.pokemon_id }, pokemon);
        }

        // DELETE: api/pokemons/5
        [HttpDelete]
        [ResponseType(typeof(pokemon))]
        public IHttpActionResult Deletepokemon(int id)
        {
            pokemon pokemon = db.pokemon.Find(id);
            if (pokemon == null)
            {
                return NotFound();
            }

            db.pokemon.Remove(pokemon);
            db.SaveChanges();

            return Ok(pokemon);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool pokemonExists(int id)
        {
            return db.pokemon.Count(e => e.pokemon_id == id) > 0;
        }
    }
}