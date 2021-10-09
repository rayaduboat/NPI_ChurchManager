using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

/// <summary>
/// Summary description for Utilities
/// </summary>
public  class Utilities: System.Web.UI.Page
{
   // static JavaScriptSerializer sz = new JavaScriptSerializer();
   // static DistrictDBEntities db = new DistrictDBEntities();
   // public  void MsgBox(string message, Page page)
   // {
   //     page.ClientScript.RegisterStartupScript(this.GetType(), "alertMessage", "alert('" + message + "')", true);
   // }
   // public LoggedInUser GetLoggedInUser() {
   //     var user = new LoggedInUser();
   //     try
   //     {
   //         if (Session["User"] == null) Response.Redirect("../default.aspx");
   //         JavaScriptSerializer sz = new JavaScriptSerializer();
   //         user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
   //         if (user == null) Response.Redirect("../default.aspx");
   //     }
   //     catch (Exception)
   //     {

            
   //     }
   //     return user;
   //}

   // public void FillBranches(DropDownList dropdownBranches)
   // {
   //     try
   //     {
   //         var user = GetLoggedInUser();
   //         if (user.LoginType == "SuperUser" || user.LoginType == "FinanceController")
   //         {

   //             dropdownBranches.Items
   //                 .AddRange(db.Branches.
   //                 Select(i => new ListItem() { Text = i.Name, Value = i.Name })
   //                 .ToList().ToArray());

   //         }
   //         else
   //         {
   //             dropdownBranches.Items
   //                 .AddRange(db.Branches.Where(i => i.ID == user.BranchID).
   //                 Select(i => new ListItem() { Text = i.Name, Value = i.Name })
   //                 .ToList().ToArray());
   //         }
   //     }
   //     catch (Exception)
   //     {

   //         throw;
   //     }
        
   // }

     
}