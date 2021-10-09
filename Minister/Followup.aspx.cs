using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Minister_Followup : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
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
    public static string FollowUpSubmission(FollowupClass fc )

    {
        string message = "Failed recording follow-up";
        try
        {
            // validate all entries
            //if (string.IsNullOrEmpty(branchName) || branchName == "Select branch") throw new Exception("Invalid branchName         ");
            //if (string.IsNullOrEmpty(activityName) || string.IsNullOrWhiteSpace(activityName)) throw new Exception("Invalid activityName       ");
            //if (string.IsNullOrEmpty(memberNames) || string.IsNullOrWhiteSpace(memberNames)) throw new Exception("Invalid memberNames        ");
            //if (string.IsNullOrEmpty(purpose) || string.IsNullOrWhiteSpace(purpose)) throw new Exception("Invalid purpose            ");
            //if (string.IsNullOrEmpty(mode) || string.IsNullOrWhiteSpace(mode)) throw new Exception("Invalid mode               ");
            //if (string.IsNullOrEmpty(contactDate) || string.IsNullOrWhiteSpace(contactDate)) throw new Exception("Invalid contactDate        ");
            //if (string.IsNullOrEmpty(concerns) || string.IsNullOrWhiteSpace(concerns)) throw new Exception("Invalid concerns           ");
            //if (string.IsNullOrEmpty(isMinisterInformed) || string.IsNullOrWhiteSpace(isMinisterInformed)) throw new Exception("Invalid isMinisterInformed ");
            //if (string.IsNullOrEmpty(supportOffered) || string.IsNullOrWhiteSpace(supportOffered)) throw new Exception("Invalid supportOffered     ");
            //if (string.IsNullOrEmpty(followedUpBy) || string.IsNullOrWhiteSpace(followedUpBy)) throw new Exception("Invalid followedUpBy       ");
            //if (string.IsNullOrEmpty(comment) || string.IsNullOrWhiteSpace(comment)) throw new Exception("Invalid comment            ");

            DistrictDBEntities db = new DistrictDBEntities();
            db.FollowUpResponses.Add(new FollowUpResponse()
            {
                BranchID = db.Branches.Where(i => i.Name == fc.branchName).Select(i => i.ID).FirstOrDefault(),
                ActivityID = db.Activities.Where(i => i.ActivityName == fc.activityName).Select(i => i.ActivityID).FirstOrDefault(),
                ActivityName= fc.activityName,
                ActivityDate= fc.activityDate,
                MemberNames = fc.memberNames,
                Purpose = fc.purpose,
                Mode = fc.mode,
                ContactDate = fc.contactDate,
                Concerns = fc.concerns,
                IsMinisterInformed = fc.isMinisterInformed,
                SupportOffered = fc.supportOffered,
                FollowedUpBy = fc.followedUpBy,
                Comment = fc.comment,
                CreatedBy=fc.CreatedBy,
                CreatedOn=Accounts.TodaysDate()
                 

            });
            db.SaveChanges();
            message = "Update successful";
        }
        catch (DbEntityValidationException e)
        {
            foreach (var eve in e.EntityValidationErrors)
            {
                //Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            //throw;
        }
        catch (Exception ex)
        {
            message = ex.Message;
            // throw;
        }
        return message;
    }

    [WebMethod]
    public static string LoadFollowedUp()
    {
        string message = "failed loading follow up";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            message = new JavaScriptSerializer().Serialize(

                db.FollowUpResponses.OrderByDescending(i => i.ID).Select(i => new
                {
                    BranchName = db.Branches.Where(u => u.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                    ActivityName = db.Activities.Where(u => u.ActivityID == i.ActivityID).Select(y => y.ActivityName).FirstOrDefault(),
                    MemberNames = i.MemberNames,
                    Purpose = i.Purpose,
                    Mode = i.Mode,
                    ContactDate = i.ContactDate,
                    Concerns = i.Concerns,
                    IsMinisterInformed = i.IsMinisterInformed,
                    SupportOffered = i.SupportOffered,
                    FollowedUpBy = i.FollowedUpBy,
                    Comment = i.Comment
                })
                );
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string FollowedUpPurposeStatistics()
    {
        string message = "Failed getting followup statistics";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            message = new JavaScriptSerializer().Serialize(
                 from match in db.FollowUpResponses
                 group match by match.Purpose into newGroup
                 orderby newGroup.Key
                 select new
                 {
                     Purpose = newGroup.Key,
                     Absent2weeks = newGroup.Count(i => i.Purpose == "Absent for more than two weeks"),//>Absent for more than two weeks</option>
                     Backslider = newGroup.Count(i => i.Purpose == "Backslider"),//>Backslider</option>
                     HealthProgressCheck = newGroup.Count(i => i.Purpose == "Health condition progress check"),//>Health condition progress check</option>
                     Other = newGroup.Count(i => i.Purpose == "Other")//>Other</option>
                                                                      //
                 }
                );
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string FollowedUpPurposeStatisticsByBranch(string branchName)
    {
        DistrictDBEntities db = new DistrictDBEntities();
        string message = "Failed getting followup statistics";
        int branchId = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).First();
        try
        {
            var query = db.FollowUpResponses.Where(i => i.BranchID == branchId).ToList();

            message = new JavaScriptSerializer().Serialize(
                new {
                    Purpose             = query.Count(),
                    Absent1week         = query.Where(i => i.Purpose == "Absent for two weeks").Count(),
                    Absent2weeks        = query.Where(i=>  i.Purpose== "Absent for more than two weeks").Count(),
                    Backslider          = query.Where(i=>  i.Purpose== "Backslider").Count(),
                    HealthProgressCheck = query.Where(i=>  i.Purpose== "Health condition progress check").Count(),
                    Other               = query.Where(i=>  i.Purpose== "Other").Count()
                }
                 //from match in db.FollowUpResponses
                 //where match.BranchID == branchId
                 //group match by match.Purpose into newGroup
                 //orderby newGroup.Key
                 //select new
                 //{
                 //    Purpose             = newGroup.Key,
                 //    Absent2weeks        = newGroup.Count(i => i.Purpose == "Absent for more than two weeks"),//>Absent for more than two weeks</option>
                 //    Backslider          = newGroup.Count(i => i.Purpose == "Backslider"),//>Backslider</option>
                 //    HealthProgressCheck = newGroup.Count(i => i.Purpose == "Health condition progress check"),//>Health condition progress check</option>
                 //    Other               = newGroup.Count(i => i.Purpose == "Other")//>Other</option>
                 //                                                     //
                 //}
                );
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string FollowedUpActivityStatistics()
    {
        string message = "Failed getting followup statistics";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            message = new JavaScriptSerializer().Serialize(
                 from match in db.FollowUpResponses
                 group match by match.ActivityID into newGroup
                 orderby newGroup.Key
                 select new
                 {
                     Purpose = newGroup.Key,
                     Absent2weeks = newGroup.Count(i => i.Purpose == "Absent for more than two weeks"),//>Absent for more than two weeks</option>
                     Blackslider = newGroup.Count(i => i.Purpose == "Backslider"),//>Backslider</option>
                     HealthProgressCheck = newGroup.Count(i => i.Purpose == "Health condition progress check"),//>Health condition progress check</option>
                     Other = newGroup.Count(i => i.Purpose == "Other")//>Other</option>
                                                                      //
                 }
                );
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string LoadFollowedUpByBranch(string branchName)
    {
        string message = "failed getting loaded up";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchId = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).First();
            message = new JavaScriptSerializer().Serialize(

                db.FollowUpResponses
                .Where(i => i.BranchID == branchId)
                .OrderByDescending(i => i.ID)
                .Select(i => new
                {
                    Index = i.ID,
                    BranchName = db.Branches.Where(u => u.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                    ActivityName = i.ActivityName,
                    ActivityDate=i.ActivityDate,
                    MemberNames = i.MemberNames,
                    Purpose = i.Purpose,
                    Mode = i.Mode,
                    ContactDate = i.ContactDate,
                    Concerns = i.Concerns,
                    IsMinisterInformed = i.IsMinisterInformed,
                    SupportOffered = i.SupportOffered,
                    FollowedUpBy = i.FollowedUpBy,
                    Comment = i.Comment
                })
                );
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }


    [WebMethod]
    public static string FollowUpUpdate(string recordIndex,
                                        string branchName,
                                        string activityName,
                                        string memberNames,
                                        string purpose,
                                        string mode,
                                        string contactDate,
                                        string concerns,
                                        string isMinisterInformed,
                                        string supportOffered,
                                        string followedUpBy,
                                        string comment)

    {
        string message = "Failed recording follow-up";
        try
        {
            // validate all entries
            if (string.IsNullOrEmpty(branchName) || string.IsNullOrWhiteSpace(branchName)) throw new Exception("Invalid branchName         ");
            if (string.IsNullOrEmpty(activityName) || string.IsNullOrWhiteSpace(activityName)) throw new Exception("Invalid activityName       ");
            if (string.IsNullOrEmpty(memberNames) || string.IsNullOrWhiteSpace(memberNames)) throw new Exception("Invalid memberNames        ");
            if (string.IsNullOrEmpty(purpose) || string.IsNullOrWhiteSpace(purpose)) throw new Exception("Invalid purpose            ");
            if (string.IsNullOrEmpty(mode) || string.IsNullOrWhiteSpace(mode)) throw new Exception("Invalid mode               ");
            if (string.IsNullOrEmpty(contactDate) || string.IsNullOrWhiteSpace(contactDate)) throw new Exception("Invalid contactDate        ");
            if (string.IsNullOrEmpty(concerns) || string.IsNullOrWhiteSpace(concerns)) throw new Exception("Invalid concerns           ");
            if (string.IsNullOrEmpty(isMinisterInformed) || string.IsNullOrWhiteSpace(isMinisterInformed)) throw new Exception("Invalid isMinisterInformed ");
            if (string.IsNullOrEmpty(supportOffered) || string.IsNullOrWhiteSpace(supportOffered)) throw new Exception("Invalid supportOffered     ");
            if (string.IsNullOrEmpty(followedUpBy) || string.IsNullOrWhiteSpace(followedUpBy)) throw new Exception("Invalid followedUpBy       ");
            if (string.IsNullOrEmpty(comment) || string.IsNullOrWhiteSpace(comment)) throw new Exception("Invalid comment            ");



            DistrictDBEntities mycontext = new DistrictDBEntities();
            FollowUpResponse entity = mycontext.FollowUpResponses.Find(int.Parse(recordIndex));
            if (entity == null) throw new Exception("Record not founnd");


            //entity.ActivityID         = branchName;
            entity.MemberNames = memberNames;
            entity.Purpose = purpose;
            entity.Mode = mode;
            entity.ContactDate = contactDate;
            entity.Concerns = concerns;
            entity.IsMinisterInformed = isMinisterInformed;
            entity.SupportOffered = supportOffered;
            entity.FollowedUpBy = followedUpBy;
            entity.Comment = comment;



            mycontext.Entry(entity).CurrentValues.SetValues(entity);
            mycontext.SaveChanges();
            message = "Update successful";
        }
        catch (DbEntityValidationException e)
        {
            foreach (var eve in e.EntityValidationErrors)
            {
                //Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                        ve.PropertyName, ve.ErrorMessage);
                }
            }
            //throw;
        }
        catch (Exception ex)
        {
            message = ex.Message;
            // throw;
        }
        return message;
    }

    [WebMethod]
    public static string AddVisitation(
                                         string memberid,
                                         string visitdate,
                                         string visitingofficers,
                                         string purpose,
                                         string supportoffered,
                                         string comment,
                                         string createdBy
        )
    {
        string message = "Adding visitation failed";
        try
        {




            Visitation vs = new Visitation()
            {
                MemberID = int.Parse(memberid),
                DateVisited = visitdate,
                Purpose = purpose,
                SupportAndDonation = supportoffered,
                Comment = comment,
                VisitingOfficers = visitingofficers,
                CreatedBy = Convert.ToInt16(createdBy) ,
                CreatedOn = DateTime.Today.ToShortDateString(),
            };
            db.Visitations.Add(vs);
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "Visitation added",
                records = db.Visitations.Select(i => i)
            });

            //ClientScript.RegisterStartupScript(GetType(), "hwa", "alert('Save successfully');", true);

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string GetVisitation(string branchName)
    {
        string message = "failed getting visitation";
        try
        {
            //get the branch id
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).First();
            //do a table join to get only visited members in the branch
            var query = from match in db.Members
                        join visit in db.Visitations on match.MemberID equals visit.MemberID
                        where match.BranchID == branchid
                        select new
                        {
                            MemberID = db.Members.Where(p=>p.MemberID== visit.MemberID).Select(p=>p.LastName+" "+p.FirstName).FirstOrDefault(),
                            DateVisited = visit.DateVisited,
                            Purpose = visit.Purpose,
                            SupportAndDonation = visit.SupportAndDonation,
                            Comment = visit.Comment,
                            VisitingOfficers = visit.VisitingOfficers,
                            CreatedOn=visit.CreatedOn,
                            CreatedBy= db.Members.Where(p =>p.MemberID == visit.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                        };
            message = sz.Serialize(new
            {
                message = "successfully loaded visitation",
                records = query.OrderByDescending(i=>i.CreatedOn).Select(i=>i)
            });
        }
        catch (Exception ex)
        {
            
            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetFollowupConcerns(string branchName)
    {
        var message = "failed getting followup concerns";
        try
        {
            //get the branch id
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).First();

            // presbyters who are working
            var  query = from fl in db.FollowUpResponses
                    where fl.BranchID== branchid
                         group fl by fl.FollowedUpBy into newgroup
                    orderby newgroup.Key
                    select new {
                        Presbyter=newgroup.Key,
                        FollowupCount=newgroup.Count(),
                        
                    };
            // members of concern
            var querymem = (from fl in db.FollowUpResponses
                            where fl.BranchID == branchid
                            group fl by fl.MemberNames into newgroup
                            orderby newgroup.Key
                            select new
                            {
                                Members = newgroup.Key,
                                FollowupCount = newgroup.Count(),
                                VisitationCount = db.Visitations
                                .Where(p => p.MemberID == (db.Members.Where(i => (i.LastName + " " + i.FirstName) == newgroup.Key).Select(i => i.MemberID).FirstOrDefault()))
                                .Select(i => i).Count()
                            }).Take(20);
            message= sz.Serialize(new {message="successful", workingPresbyters = query.OrderByDescending(i => i.FollowupCount), concernMembers = querymem.OrderByDescending(i => i.FollowupCount) });

        }
        catch (Exception)
        {

            
        }
        return message;
    }

}
public class FollowupClass
{
public string     branchName{get;set;}
public string     activityName{get;set;}
public string     activityDate{get;set;}
public string     memberNames{get;set;}
public string     purpose{get;set;}
public string     mode{get;set;}
public string     contactDate{get;set;}
public string     concerns{get;set;}
public string     isMinisterInformed{get;set;}
public string     supportOffered{get;set;}
public string     followedUpBy{get;set;}
public string     comment { get; set; }
public int        CreatedBy { get;   set; }
}
