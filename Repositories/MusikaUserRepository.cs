namespace ECApi.Repositories
{
    public class MusikaUserRepository:IMusikaUserRepository
    {
         private readonly DataContext _context;
        public MusikaUserRepository(DataContext context)
        {
            _context = context;
        }
        public async Task<IEnumerable<MusikaUser>>Get(){
            return await _context.MusikaUsers.ToListAsync();
        }
        public async Task<MusikaUser>Get(int id){
            return await _context.MusikaUsers.FindAsync(id);
        }
        public async Task<MusikaUser>FindUser(string username){
            var Users = await _context.MusikaUsers.ToListAsync();
            return Users.Find(u=>u.Username.ToLower()==username);
        }
        public async Task<IEnumerable<MusikaUser>>Create(MusikaUser user){
             _context.MusikaUsers.Add(user);
            await _context.SaveChangesAsync();
             return await _context.MusikaUsers.ToListAsync();
        }
        public async Task Update(MusikaUser user){
            _context.Entry(user).State = EntityState.Modified;
            await _context.SaveChangesAsync();
        }
        public async Task Delete(int id){
            var userToDelete = await _context.MusikaUsers.FindAsync(id);
            _context.MusikaUsers.Remove(userToDelete);
            await _context.SaveChangesAsync();
        }
    }
}