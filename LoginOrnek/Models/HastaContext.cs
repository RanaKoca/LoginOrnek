using LoginOrnek.Models.Entities;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace LoginOrnek.Models
{
    public class HastaContext:DbContext
    {
        public HastaContext(DbContextOptions<HastaContext> options) : base(options) { }

        public DbSet<Hasta> Hasta { get; set; }
        public DbSet<Ilac> Ilaclar { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
            }
        }
    }
}
