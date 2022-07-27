namespace ECApi.Repositories
{
    public interface IMusikaItemRepository
    {
         Task<IEnumerable<MusikaItem>>Get();
         Task<MusikaItem>Get(int id);
         Task<IEnumerable<MusikaItem>>Create(MusikaItem item);
         Task Update(MusikaItem item);
         Task Delete(int id);
    }
}