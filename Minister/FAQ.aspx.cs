using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Events : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
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
    [WebMethod]
    public static string LoadBranches()
    {
        string message = "failed getting branches";
        try
        {
            message = sz.Serialize(db.Branches.OrderBy(i => i.Name).Select(i => new { BranchName = i.Name, BranchID = i.ID }));
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddEvent(string branchName,
                                  string purpose,
                                  string name,
                                  string location,
                                  string eventDate,
                                  string presidingOfficer,
                                  string menCount,
                                  string womenCount,
                                  string childrenCount,
                                  string comment,
                                  string titheAndOffering,
                                  string HolySpiritBaptised,
                                  string soulswon,
                                  string guestSpeakers,
                                  string createdby
                                  )
    {
        string message = "failed adding event";
        try
        {
            Func<string, string> TwoDigitDay = (day) => { return day.Length == 1 ? "0" + day : day; };
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            Event ev = (new Event()
            {
                BranchID = branchid,
                Purpose = purpose,
                Name = name,
                Location = location,
                EventDate = eventDate,
                GuestSpeakers = guestSpeakers,
                PresidingOfficer = presidingOfficer,
                MenCount = Convert.ToInt16(menCount),
                WomenCount = Convert.ToInt16(womenCount),
                ChildrenCount = Convert.ToInt16(childrenCount),
                Comment = comment,
                TitherAndOffering = Convert.ToDecimal(titheAndOffering),
                HolySpiritBaptised = Convert.ToInt16(HolySpiritBaptised),
                SoulsWon = Convert.ToInt16(soulswon),
                CreatedOn = int.Parse(DateTime.Now.Year.ToString() + TwoDigitDay(DateTime.Now.Month.ToString()) + TwoDigitDay(DateTime.Now.Day.ToString())),
                CreatedBy = createdby
            });
            db.Events.Add(ev);
            db.SaveChanges();
            message = "Update successful";
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetEvents(string branchName)
    {
        string message = "failed getting event name";
        try
        {
            if (branchName != "All")
            {
                int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
                message = sz.Serialize(db.Events.Where(i => i.BranchID == branchid)
                        .Select((i) => new
                        {
                            EventID              = i.EventsID,
                            purpose            = i.Purpose,
                            name               = i.Name,
                            location           = i.Location,
                            eventDate          = i.EventDate,
                            presidingOfficer   = i.PresidingOfficer,
                            menCount           = i.MenCount,
                            womenCount         = i.WomenCount,
                            childrenCount      = i.ChildrenCount,
                            comment            = i.Comment,
                            titheAndOffering   = i.TitherAndOffering,
                            HolySpiritBaptised = i.HolySpiritBaptised,
                            soulswon           = i.SoulsWon,
                            guestSpeakers      = i.GuestSpeakers,
                            CreatedOn          = i.CreatedOn,
                            CreatedBy          = i.CreatedBy,
                            BranchName         = db.Branches.Where(g => g.ID == i.BranchID).Select(g => g.Name).FirstOrDefault()
                        }));
            }
            else if (branchName == "All")
            {
                message = sz.Serialize(db.Events
                        .Select((i) => new
                        {
                            EventID = i.EventsID,
                            purpose = i.Purpose,
                            name = i.Name,
                            location = i.Location,
                            eventDate = i.EventDate,
                            presidingOfficer = i.PresidingOfficer,
                            menCount = i.MenCount,
                            womenCount = i.WomenCount,
                            childrenCount = i.ChildrenCount,
                            comment = i.Comment,
                            titheAndOffering = i.TitherAndOffering,
                            HolySpiritBaptised = i.HolySpiritBaptised,
                            soulswon = i.SoulsWon,
                            guestSpeakers = i.GuestSpeakers,
                            CreatedOn = i.CreatedOn,
                            CreatedBy = i.CreatedBy,
                            BranchName = db.Branches.Where(g => g.ID == i.BranchID).Select(g => g.Name).FirstOrDefault()
                        }));
            }
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string LoadEventStatistics(string branchName)
    {
        string message = "failed event statistics";
        try
        {
            if (branchName != "All")
            {
                int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
                message = sz.Serialize(db.Events.Where(i => i.BranchID == branchid)
                        .Select((i) => new
                        {
                            message= "Loaded successful"

                        }));
            }
            else if (branchName == "All")
            {
                message = sz.Serialize(db.Events
                        .Select((i) => new
                        {
                            message = "Loaded successful"

                        }));
            }
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    
    [WebMethod]
    public static string UpdateEvent(string eventID,
                                     string branchName,
                                     string purpose,
                                     string name,
                                     string location,
                                     string eventDate,
                                     string presidingOfficer,
                                     string menCount,
                                     string womenCount,
                                     string childrenCount,
                                     string comment,
                                     string titheAndOffering,
                                     string HolySpiritBaptised,
                                     string soulswon,
                                     string guestSpeakers,
                                     string createdby
                                  )
    {
        string message = "failed updating event";
        try
        {
            Event entity = db.Events.Find(Convert.ToInt16(eventID));
            
                //entity.BranchID = branchid;
                entity.Purpose = purpose;
                entity.Name = name;
                entity.Location = location;
                entity.EventDate = eventDate;
                entity.GuestSpeakers = guestSpeakers;
                entity.PresidingOfficer = presidingOfficer;
                entity.MenCount = Convert.ToInt16(menCount);
                entity.WomenCount = Convert.ToInt16(womenCount);
                entity.ChildrenCount = Convert.ToInt16(childrenCount);
                entity.Comment = comment;
                entity.TitherAndOffering = Convert.ToDecimal(titheAndOffering);
                entity.HolySpiritBaptised = Convert.ToInt16(HolySpiritBaptised);
                entity.SoulsWon = Convert.ToInt16(soulswon);
            //entity.CreatedOn = int.Parse(DateTime.Now.Year.ToString() + TwoDigitDay(DateTime.Now.Month.ToString()) + TwoDigitDay(DateTime.Now.Day.ToString()));
                entity.CreatedBy = createdby;
             
            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();

            message = "Update successful";
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
}