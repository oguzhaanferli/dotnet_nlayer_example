using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using Veripark.Core.Dtos;
using Veripark.Core.Models;
using Veripark.Data;

namespace Veripark.Service.Services
{
    public class BookService
    {
        public static CustomResponseDto<List<Book>> GetAll()
        {
            try
            {
                AppDbContext appDbContext = new AppDbContext();
                List<Book> bookList = appDbContext.Books.ToList();
                return CustomResponseDto<List<Book>>.Success(bookList);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static void Save(List<Book> books)
        {
            try
            {
                AppDbContext appDbContext = new AppDbContext();
                appDbContext.Books.AddRange(books);
                appDbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public static void StatusUpdate(int BookId, BookStatus status)
        {
            try
            {
                AppDbContext appDbContext = new AppDbContext();
                var book = appDbContext.Books.Where(x => x.Id == BookId).FirstOrDefault();
                book.Status = status;
                appDbContext.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }


    }
}
