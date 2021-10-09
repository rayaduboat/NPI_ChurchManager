using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class PlanningClass : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static string message = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //get the logged in user
            //if (Session["User"] == null) Response.Redirect("../default.aspx");
            //JavaScriptSerializer sz = new JavaScriptSerializer();
            //var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
            LoadPlanningTable();
        }
        catch (Exception)
        {


        }
    }

    private void LoadPlanningTable()
    {
        try
        {
            // TEL031864
            //create table header
            var table = new HtmlTable() {  };
            table.Rows.Add(new HtmlTableRow() {   });
             
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ID" });
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="FromDate"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ToDate"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="StartTime"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="EndTime"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ActivityName"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="Description"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="GuestSpeaker(s)"});
            table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="Location"});
            // table body
            //check of any planned information
            var countInfo = db.Plannings.Count();
            if (countInfo == 0) return;
            for (int i = 1; i < db.Plannings.Count(); i++)
            {
                try
                {
                    table.Rows.Add(new HtmlTableRow() { });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText=  db.Plannings.AsEnumerable().ElementAt(i).ID.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).FromDate.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).ToDate.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).StartTime.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).EndTime.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).ActivityName.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).Description.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).GuestSpeaker.ToString() });
                    table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).Location.ToString() });


                }
                catch (Exception ex)
                {

                    
                }
            }
            containertableAnnouncement.Controls.Clear();
            table.Attributes.Add("class", "table table-hover table-responsive");
            containertableAnnouncement.Controls.Add(table);
             
            //create table data
        }
        catch (Exception)
        {

           
        }
    }

    protected void aLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("../default.aspx");
    }
     
    
}