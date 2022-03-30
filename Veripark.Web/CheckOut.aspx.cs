using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veripark.Service.Services;

namespace Veripark.Web
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static bool Save(int bookId, string namesurname, string phonenumber, string identifynumber)
        {
            BookDeliveryService.CheckOut(bookId, namesurname, phonenumber, identifynumber);
            return true;
        }
    }
}