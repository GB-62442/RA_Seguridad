using System;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web.Http;
using System.Web.Mvc;
using RA.Models;

namespace RA.Controllers
{
    /// <summary>
    /// login controller class for authenticate users
    /// </summary>
    [System.Web.Http.AllowAnonymous]
    [System.Web.Http.RoutePrefix("api/login")]
    public class LoginController : ApiController
    {private seguridad_apiEntities db = new seguridad_apiEntities();
        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("echoping")]
        public IHttpActionResult EchoPing()
        {
            return Ok(true);
        }

        [System.Web.Http.HttpGet]
        [System.Web.Http.Route("echouser")]
        public IHttpActionResult EchoUser()
        {
            var identity = Thread.CurrentPrincipal.Identity;
            return Ok($" IPrincipal-user: {identity.Name} - IsAuthenticated: {identity.IsAuthenticated}");
        }

        [System.Web.Http.HttpPost]
        [System.Web.Http.Route("authenticate")] 
        public IHttpActionResult Authenticate(LoginRequest login)
        {
            if (login == null)
                throw new HttpResponseException(HttpStatusCode.BadRequest);

            //TODO: Validate credentials Correctly, this code is only for demo !!
           
            //usuario usuario = db.usuario.Find(id);

            // Query for the Blog named ADO.NET Blog
            var u = db.usuario
                            .Where(b => b.usuario_nickname == login.usuario_nickname)
                            .FirstOrDefault();

            if (u == null)
            {
                return NotFound();
            }

            bool isCredentialValid = (Servicios.Base64Encrypt.EncriptarABase64(login.usuario_pass) == u.usuario_pass);
            if (isCredentialValid)
            {
                var token = TokenGenerator.GenerateTokenJwt(login.usuario_nickname);
                return Ok(token);
            }
            else
            {
                return Unauthorized();
            }
        }
    }
}