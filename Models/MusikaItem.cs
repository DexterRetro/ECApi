namespace ECApi.Models
{
    public class MusikaItem
    {
        public int Id {get;set;}
        public string ItemName {get; set;} = string.Empty;
        public string SupplierName {get; set;} = string.Empty;
        public float ItemPrice {get;set;}
        public int ItemQuantity {get;set;}
        public string ItemDescription {get;set;} = string.Empty;
        public List<Itemimages> ItemImages {get;set;}
        public List<ItemReview> Reviews {get;set;}


    }
    public class Itemimages{
        public int Id {get;set;}
        public string ImageName {get;set;}
        public string ImageURL {get;set;}
    }
    public class ItemReview{
        public int Id {get;set;}
        
        public string Commentor {get;set;}
        public string Comment {get;set;} = string.Empty;
        public int Rating {get;set;}
        public DateTime CommentDate {get;set;}

    }
}