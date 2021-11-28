using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace RA.Models
{
    public class LoginRequest
    {
        public string usuario_nickname { get; set; }
        public string usuario_pass { get; set; }
    }
}