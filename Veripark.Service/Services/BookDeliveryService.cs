using System;
using Veripark.Core.Models;
using Veripark.Data;

namespace Veripark.Service.Services
{
    public class BookDeliveryService
    {
        public static void CheckOut(int bookId, string namesurname, string phonenumber, string identifynumber)
        {
            try
            {
                BookDelivery bookDelivery = new BookDelivery();
                bookDelivery.NameSurname = namesurname;
                bookDelivery.CreatedDate = DateTime.Now;
                bookDelivery.CheckInDate = DateTime.Now;
                bookDelivery.RealCheckInDate = DateTime.Now;
                bookDelivery.CheckOutDate = DateTime.Now.AddDays(15);
                bookDelivery.IdentificationNumber = identifynumber;
                bookDelivery.PhoneNumber = phonenumber;
                AppDbContext appDbContext = new AppDbContext();
                appDbContext.BookDelivery.Add(bookDelivery);
                appDbContext.SaveChanges();

                BookService.StatusUpdate(bookId, BookStatus.WasDelivered);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
    }
}
