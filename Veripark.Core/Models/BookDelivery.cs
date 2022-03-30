using System;

namespace Veripark.Core.Models
{
    public class BookDelivery : BaseEntity
    {
        public int BookId { get; set; }
        public string NameSurname { get; set; }
        public string PhoneNumber { get; set; }
        public string IdentificationNumber { get; set; }
        public DateTime CheckOutDate { get; set; }
        public DateTime CheckInDate { get; set; }
        public DateTime RealCheckInDate { get; set; }
    }
}
