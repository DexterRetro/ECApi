namespace ECApi.Models
{
    public class MusikaUser
    {
        public int Id { get; set; }
        public string Username { get; set; } = string.Empty;
        public string FirstNames { get; set; } = string.Empty;
        public string Surname { get; set; } = string.Empty;
        public byte[] Password { get; set; }
        public byte[] PasswordSalt { get; set; }
        public int Telephone { get; set; }
        public string Email { get; set; } = string.Empty;
        public string Address {get;set;} = string.Empty;
        public string City {get;set;} = string.Empty;
        public string Country {get;set;}= string.Empty;

        public List<OrderHistory> orderHistories {get;set;}
        public List<ItemQue>ItemQue{get;set;}
    }

    public class ItemQue{
        public int Id {get;set;}
        public MusikaItem Item {get;set;}
        public DateTime AddedDate{get;set;}
        public string State{get;set;} ="wishlist";
    }
    public class OrderHistory
    {
        public int Id {get;set;}
        public MusikaItem Item {get;set;}
        public int Quantity {get;set;}
        public DateTime Date {get;set;}
        public float AmountPaid {get;set;}

    }
}