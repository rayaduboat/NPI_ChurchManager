using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
 
public partial class Minister_ManagementList : System.Web.UI.Page
{
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
    [WebMethod]
    public static string GetThemePath(int themeID)
    {
        string path = string.Empty;

        try
        {
            DistrictDBEntities dBEntities = new DistrictDBEntities();
            path = dBEntities.Themes
               .Where(i => i.Id == themeID)
               .Select(i => i.Path)
               .FirstOrDefault();
        }
        catch (Exception ex)
        {

            
        }
        return path;
    }
    [WebMethod]
    public static string UpdateTheme(int memberID,int themeID)
    {
        string message = "failed";
        DistrictDBEntities dBEntities = new DistrictDBEntities();
        try
        {
            //find member
            Member member = dBEntities.Members.Find(memberID);
            member.ThemeID = themeID;
            dBEntities.Entry(member).CurrentValues.SetValues(member);
            dBEntities.SaveChanges();
            return "success";
        }
        catch (Exception)
        {

             
        }
        return message;
    }
    [WebMethod]
    public static object AddReminder(string message ,string date,
       int memberId,int branchId)
    {
        try
        {
            DistrictDBEntities context = new DistrictDBEntities();
            var rem = new local_activities_reminder()
            {
                ActivityDate = date,
                Message = message,
                MemberID = memberId,
                BranchID = branchId
            };
            context.local_activities_reminder.Add(rem);
            context.SaveChanges();
            return rem;
        }
        catch (Exception ex)
        {

            
        }
        return null;
    }
    [WebMethod]
    public static object GetReminder(int branchId)
    {
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            return db.local_activities_reminder.AsEnumerable()
                    .Where(i=>i.BranchID== branchId)
                    .OrderByDescending(i=>i.Id)
                    .Select(i=>new {
                        i.ActivityDate,
                        i.BranchID,
                        i.Id,
                        i.Message,
                        i.CreatedOn,
                        MemberID=db.Members.Where(p=>p.MemberID== i.MemberID).Select(p=>p.FirstName+" "+p.LastName).FirstOrDefault()
                        }).ToList();
        }
        catch (Exception)
        {


        }
        return null;
    }
    [WebMethod]
    public static object RemoveNote(int id)
    {
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            var rec = db.local_activities_reminder.Find(id);
            if (rec!=null)
            {

            db.local_activities_reminder.Remove(rec);
                db.SaveChanges();
                return "success";
            }
        }
        catch (Exception)
        {


        }
        return "failed";
    }
    [WebMethod]
    public static string GetChurchTheme()
    {
        var message = "failed";
        try
        {
            DistrictDBEntities entities = new DistrictDBEntities();
            message= entities.Configurations
                .Where(i => i.Name == "Theme")
                .Select(i => i.Value).FirstOrDefault();
        }
        catch (Exception)
        {

            throw;
        }
        return message; 
    }
    
    [WebMethod]
    public static string UpdateChurchTheme(string theme)
    {
        var message = "failed";
        try
        {
            
            DistrictDBEntities entities = new DistrictDBEntities();

            entities.Database.ExecuteSqlCommand("Update Customer.Configuration set Value=@theme where Name='Theme'", 
                new SqlParameter("@theme",theme));
            entities.SaveChanges();
            message = GetChurchTheme();
        }
        catch (Exception)
        {

            throw;
        }
        return message;
    }

}