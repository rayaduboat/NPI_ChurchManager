using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_BranchCensus : System.Web.UI.Page
{
   static DistrictDBEntities db = new DistrictDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //get the logged in user
            //if (Session["User"] == null) Response.Redirect("../default.aspx");
            //JavaScriptSerializer sz = new JavaScriptSerializer();
            //var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
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
    public void button_ActivateCensus(object sender, EventArgs e)
    {

    }
    public void button_DectivateCensus(object sender, EventArgs e)
    {
        try
        {

        }
        catch (Exception)
        {

            //throw;
        }
    }

    [WebMethod]
    public static string Activate()
    {
        string message = "failed to activate census";
        try
        {

            // add an entry into dictionary
            var query = from match in db.Dictionaries.AsEnumerable()
                        where match.PageName == "Census"
                        where match.Name == "CensusYear"
                        where match.Value == DateTime.Now.Year.ToString()
                        select new
                        {
                            CensusYear = match.Value
                        };
            if (query.Count() > 0) { message = "Census already active"; return message; }
            db.Dictionaries.Add(new Dictionary()
            {
                PageName = "Census",
                Name = "CensusYear",
                Value = DateTime.Now.Year.ToString()
            });
            db.SaveChanges();
            message = "Census activated";
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Census year for year " + DateTime.Now.Year.ToString() + " is now active');", true);

        }
        catch (Exception )
        {
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true);
            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string Deactivate()
    {
        string message = "failed to deactivate census";
        try
        {

            // add an entry into dictionary
           
            var id = (from match in db.Dictionaries.AsEnumerable()
                      where match.PageName == "Census"
                      where match.Name == "CensusYear"
                      where match.Value == DateTime.Now.Year.ToString()
                      select match.ID).FirstOrDefault();

            Dictionary dictionary = db.Dictionaries.Find(id);
            db.Dictionaries.Remove(dictionary);
            
            db.SaveChanges();
            
            message = "Census deactivated";
        }
        catch (Exception ex)
        {
           
        }
        return message;
    }


}