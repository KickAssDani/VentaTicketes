//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VentaTicketes.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class TicketsHorarios
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TicketsHorarios()
        {
            this.TickersSale = new HashSet<TickersSale>();
        }
    
        public int idHorario { get; set; }
        public int idRuta { get; set; }
        public int idLugarRuta { get; set; }
        public string tiempoHorario { get; set; }
    
        public virtual TicketsLugares TicketsLugares { get; set; }
        public virtual TicketsRuta TicketsRuta { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TickersSale> TickersSale { get; set; }
    }
}
