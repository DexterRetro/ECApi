namespace ECApi.Repositories
{
    public interface IMusikaUserRepository
    {
         
         Task<IEnumerable<MusikaUser>>Get();
         Task<MusikaUser>Get(int id);
         Task<MusikaUser>FindUser(string username);
         Task<IEnumerable<MusikaUser>>Create(MusikaUser user);
         Task Update(MusikaUser user);
         Task Delete(int id);
    }
}