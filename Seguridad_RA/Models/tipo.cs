//------------------------------------------------------------------------------
// <auto-generated>
//    Este código se generó a partir de una plantilla.
//
//    Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//    Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Seguridad_RA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tipo
    {
        public tipo()
        {
            this.tipopkmn = new HashSet<tipopkmn>();
        }
    
        public int tipo_id { get; set; }
        public string tipo_nombre { get; set; }
    
        public virtual ICollection<tipopkmn> tipopkmn { get; set; }
    }
}
