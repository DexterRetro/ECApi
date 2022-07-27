using ECApi.Models;
namespace ECApi.Repositories
{
    public class MusikaItemRepository:IMusikaItemRepository
    {
         private readonly DataContext _context;
        public MusikaItemRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<MusikaItem>>Get(){
            var items =await _context.MusikaItems.Include(i=>i.ItemImages).Include(r=>r.Reviews).ToListAsync();
            var rnd = new Random();
            var Randomized = items.OrderBy(item => rnd.Next());
           return Randomized;
        }
        public async Task<MusikaItem>Get(int id){
          var ItemList = await _context.MusikaItems.Include(i=>i.ItemImages).Include(r=>r.Reviews).ToListAsync();
          return ItemList.Find(i=>i.Id==id);
        }
        public async Task<IEnumerable<MusikaItem>>Create(MusikaItem item){
            _context.MusikaItems.Add(item);
            await _context.SaveChangesAsync();
             return await _context.MusikaItems.ToListAsync();
        }
        public async Task Update(MusikaItem item){
            _context.Entry(item).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }
        public async Task Delete(int id){
            var itemToDelete = await _context.MusikaItems.FindAsync(id);
            _context.MusikaItems.Remove(itemToDelete);
            await _context.SaveChangesAsync();
        }
    }
}