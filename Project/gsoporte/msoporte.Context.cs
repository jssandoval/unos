﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace gsoporte
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class soporteEntities : DbContext
    {
        public soporteEntities()
            : base("name=soporteEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<clasificacion> clasificacion { get; set; }
        public virtual DbSet<estado> estado { get; set; }
        public virtual DbSet<perfil> perfil { get; set; }
        public virtual DbSet<prioridad> prioridad { get; set; }
        public virtual DbSet<soporte> soporte { get; set; }
        public virtual DbSet<usuario> usuario { get; set; }
    }
}
