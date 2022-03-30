using System;
using System.Collections.Generic;

namespace Veripark.Core.Models
{
    public class Book : BaseEntity
    {
        public string Name { get; set; }
        public string ISBN { get; set; }
        public int PublicationYear { get; set; }
        public double Price { get; set; }
        // Gecikme Tutarı Statik Yazmamak için Ekledim
        public double DelayPrice { get; set; }
        public BookStatus Status { get; set; }
    }
}
