using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Cors;

namespace ECApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [EnableCors("CorImplementationpolicyOrigins")]
    public class MusikaApiController:ControllerBase{
       
        private readonly IMusikaItemRepository _musikaItemReposotory;
        private readonly IMusikaUserRepository _musikaUserReposotory;
        public MusikaApiController(IMusikaItemRepository musikaItemRepository,IMusikaUserRepository musikaUserRepository)
        {
            _musikaItemReposotory=musikaItemRepository;
            _musikaUserReposotory=musikaUserRepository;
        }
        [HttpGet]
        public async Task<IEnumerable<MusikaItem>>GetAllItems(){
            
            return await _musikaItemReposotory.Get();
        }


         [HttpGet("{id}")]
        public async Task<ActionResult<MusikaItem>>GetItem(int id){
            return  await _musikaItemReposotory.Get(id);
        }

        [HttpPost]
         public async Task<IEnumerable<MusikaItem>>AddItem(MusikaItem Item){
           return await _musikaItemReposotory.Create(Item);
        }

        [HttpPost("cart")]
         public async Task<ActionResult<MusikaUser>>AddItemToCart(int ItemId,int UserId){
           var Item = await GetItem(ItemId);
           var user = await _musikaUserReposotory.Get(UserId);
           var itemInQue = new ItemQue();
           itemInQue.AddedDate = DateTime.Now;
           itemInQue.Item = Item.Value;
           itemInQue.State="cart";
           user.ItemQue.Add(itemInQue);
           await _musikaUserReposotory.Update(user);
           return Ok(user);
        }

        [HttpPost("wishlist")]
         public async Task<ActionResult<MusikaUser>>AddItemToWishList(int ItemId,int UserId){
            var Item = await GetItem(ItemId);
           var user = await _musikaUserReposotory.Get(UserId);
           var itemInQue = new ItemQue();
           itemInQue.AddedDate = DateTime.Now;
           itemInQue.Item = Item.Value;
           itemInQue.State="wishList";
           user.ItemQue.Add(itemInQue);
           await _musikaUserReposotory.Update(user);
           return Ok(user);
        }

        [HttpPut]
        public async Task<ActionResult<MusikaItem>>UpdateItem(int id,MusikaItem Item){
            if(id!=Item.Id){
                return BadRequest();
            }
            await _musikaItemReposotory.Update(Item);

            return NoContent();
        }
        
        [HttpDelete("{id}")]
        public async Task<ActionResult<MusikaItem>>DeleteItem(int id){
            var ItemToDelete= await _musikaItemReposotory.Get(id);
            if(ItemToDelete==null){
                return NotFound();
            }
            await _musikaItemReposotory.Delete(id);

            return NoContent();
        }

    }
}