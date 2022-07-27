using Microsoft.AspNetCore.Mvc;
using System.Security.Cryptography;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using ECApi.Models;
using Microsoft.AspNetCore.Cors;

namespace ECApi.Controllers
{
    [Route("auth/[controller]")]
    [ApiController]
    [EnableCors("CorImplementationpolicyOrigins")]
    public class MusikaAuthController:ControllerBase
    {
        
        private readonly IConfiguration _configurtion;
        private readonly IMusikaUserRepository _musikaUserReposotory;

        public MusikaAuthController(IConfiguration configuration,IMusikaUserRepository musikaUserRepository)
        {
            _configurtion = configuration;
            _musikaUserReposotory=musikaUserRepository;
        }
        
        [HttpPost("register")]
        public async Task<ActionResult<MusikaUser>> Register(UserDto request){
            if(IsAnyNullOrEmpty(request)){
                return BadRequest("Information Required not received");
            }
            MusikaUser User = new MusikaUser();
            CreatePasswordHash(request.Password,out byte[] passwordHash, out byte[] passwordSalt);
            User.Password = passwordHash;
            User.PasswordSalt = passwordSalt;
            User.Username = request.Username;
            User.Address=request.Address;
            User.City=request.City;
            User.Country=request.Country;
            User.Email=request.Email;
            User.FirstNames=request.FirstNames;
            User.Surname=request.Surname;
            User.Telephone=request.Telephone;
            await _musikaUserReposotory.Create(User);
            //Token token = CreateToken(User);
            return Ok(User);
        }

        //receives token and gives back user
        [HttpGet("login")]
        public async Task<ActionResult<MusikaUser>> TokenLogIn(string token){
            return Ok("token loggin");
        }
        [HttpPost("login")]
        public async Task<ActionResult<MusikaUser>> Login(UserDto request){
            if(request.Username==null){
                return BadRequest("No Username entered!");
            }
            var user = await _musikaUserReposotory.FindUser(request.Username);
            if(user==null){
                return BadRequest("No User Found!");
            }
            if(!VerifyPasswordHash(request.Password,user.Password,user.PasswordSalt)){
                return BadRequest("Wrong Password!");
            }
            user.Password =null;
            user.PasswordSalt = null;
            //Token token = CreateToken(user);
            return Ok(user);
        }
        private void CreatePasswordHash(string password, out byte[] paswordHash, out byte[] passwordSalt){
            using (var hmac = new HMACSHA512()){
                passwordSalt = hmac.Key;
                paswordHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
            }
        }

        private bool VerifyPasswordHash(string password, byte[] passwordHash, byte[] passwordSalt){
            using (var hmac = new HMACSHA512(passwordSalt)){
                var computedHash = hmac.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return computedHash.SequenceEqual(passwordHash);
            }
        }

        private Token CreateToken(MusikaUser user){
            List<Claim> claims = new List<Claim>{
                new Claim(ClaimTypes.Name,user.Username)
            };
            var key = new SymmetricSecurityKey(System.Text.Encoding.UTF8.GetBytes(_configurtion.GetSection("AppSettings:Token").Value));
            var cred = new SigningCredentials(key,SecurityAlgorithms.HmacSha512Signature);
            var token = new JwtSecurityToken(
                claims:claims,
                expires:DateTime.Now.AddDays(10),
                signingCredentials:cred
            );
            var jwt = new JwtSecurityTokenHandler().WriteToken(token);
            var tokken = new Token();
            tokken.token = jwt;
            return tokken;
        }
        bool IsAnyNullOrEmpty(object myObject)
        {
            return myObject.GetType().GetProperties()
            .Where(pi => pi.PropertyType == typeof(string))
            .Select(pi => (string)pi.GetValue(myObject))
            .Any(value => string.IsNullOrEmpty(value));
        }
    }

}