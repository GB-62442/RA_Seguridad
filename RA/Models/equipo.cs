//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace RA.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class equipo
    {
        public int pokemon { get; set; }
        public int usuario { get; set; }
        public short orden { get; set; }
        public int id_equipopkmn { get; set; }
    
        public virtual pokemon pokemon1 { get; set; }
        public virtual usuario usuario1 { get; set; }
    }
}
