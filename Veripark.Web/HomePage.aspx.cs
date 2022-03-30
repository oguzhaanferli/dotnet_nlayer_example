using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Veripark.Service.Services;

namespace Veripark.Web
{
    public partial class HomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var bookList = BookService.GetAll();
            string tableStr = "";
            foreach (var item in bookList.Data)
            {
                tableStr += $@"
                    <tr>
                        <td>
                            <input type='radio' onchange='statusControl({item.Status.GetHashCode()})' name='bookname' value='{item.Id}' /></td>
                        <th>{item.Name}</th>
                        <th>{item.ISBN}</th>
                        <th>{item.PublicationYear}</th>
                        <th>{item.Price}</th>
                        <th>{(item.Status == Core.Models.BookStatus.NotDelivered ? "Teslim Edilmedi" : "Teslim Edildi.") }</th>
                    </tr>";
            }
            BookListId.Text = tableStr;
        }
    }
}