namespace ECApi.Models
{
    public class UserDto
    {
        public string? Username { get; set; } = string.Empty;
        public string? Password { get; set; } = string.Empty;
        public string? FirstNames { get; set; } = string.Empty;
        public string? Surname { get; set; } = string.Empty;
        public int Telephone { get; set; }
        public string? Email { get; set; } = string.Empty;
        public string? Address {get;set;} = string.Empty;
        public string? City {get;set;} = string.Empty;
        public string? Country {get;set;}= string.Empty;

    }
}