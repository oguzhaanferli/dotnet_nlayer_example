using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Veripark.Core.Models;
using Veripark.Service.Services;

namespace Veripark.Web
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            RegisterRoutes(RouteTable.Routes);
        }
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("Home", "", "~/HomePage.aspx");
            routes.MapPageRoute("CheckOut", "checkout", "~/CheckOut.aspx");
            routes.MapPageRoute("CheckIn", "checkin", "~/CheckIn.aspx");
        }
        protected void Application_Error(object sender, EventArgs e)
        {
            //TODO: Error DB Insert Yapılacak
        }
    }
}