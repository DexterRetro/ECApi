using Microsoft.EntityFrameworkCore;
using ECApi.Models;
namespace ECApi.Data
{
    public class DataContext :DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options){}

        public DbSet<MusikaItem> MusikaItems { get; set; }
        public DbSet<MusikaUser> MusikaUsers { get; set; }
        public DbSet<ItemReview> ItemReviews {get;set;}
        public DbSet<OrderHistory> ItemOrderhistories {get;set;}
        public DbSet<ItemQue>ItemQues{get;set;}
        public DbSet<Itemimages> ItemImages {get;set;}

    }
}