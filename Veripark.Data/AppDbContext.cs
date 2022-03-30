using System.Data.Entity;
using Veripark.Core.Models;

namespace Veripark.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext() : base("name=EntityConnectionString") { }

        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<BookDelivery> BookDelivery { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>().ToTable("Books").HasKey<int>(_ => _.Id);
            modelBuilder.Entity<BookDelivery>().ToTable("BookDelivery").HasKey<int>(_ => _.Id);
        }
    }
}
