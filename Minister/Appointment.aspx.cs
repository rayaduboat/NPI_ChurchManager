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
using System.Web.UI.WebControls;

public partial class Appointment : System.Web.UI.Page
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
    public static string GetMembers(int branchID)
    {
        string message = "failed getting membership list ";

        try
        {

            {

                // look for branch name 
                message = sz.Serialize(new
                {
                    roles = db.Dictionaries.Where(i => i.Name == "Roles" && i.PageName == "Appointment").Select(i => new { name = i.Value, ID = i.ID }),
                    members =
                    from mem in db.Members
                    where mem.BranchID == branchID
                    where mem.MembershipType == "Member"
                    orderby mem.LastName
                    select new
                    {
                        MemberID = mem.MemberID,

                        branchID = branchID,
                        FirstName = mem.FirstName,
                        LastName = mem.LastName,
                        Email = mem.EmailAddress,
                    }
                });




            }
        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }

    [WebMethod]
    public static string GetRoles()
    {
        try
        {
            //IQueryable<CappedRoles> returnValue = null;
            {

                // look for branch name 
                var returnValue = from mem in db.AppointmentRoles
                                  orderby mem.Name
                                  //select mem.Name;
                                  select new
                                  {
                                      ID = mem.ID,
                                      Name = mem.Name
                                  };



                if (returnValue.Count() > 0)
                    message = sz.Serialize(returnValue);
            }
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddAppointment(Appointees user)
    {
        string message = "failed adding appointment";
        try
        {
            if (user.dateOfAppointment.ToString().Length != 8) return "Invalid appointment date";
            if (user.endDateOfAppointment.ToString().Length != 8) return "Invalid appointment end date";

            Func<string, string> TwoDigitDay = (day) => { return day.Length == 1 ? "0" + day : day; };
            MemberAppointment app = new MemberAppointment()
            {
                MemberID = user.memberid,
                BranchID = user.branchid,
                Role = user.role,
                DateOfAppointment = user.dateOfAppointment,
                EndDateOfAppointment = user.endDateOfAppointment,
                AlertNoticeDays = user.alertNoticeDays,
                AuthorisingOfficer = user.authorisingOfficer,
                Location = user.location,
                Comment = user.comment,
                CreatedOn = Accounts.TodaysDate(),
                CreatedBy = user.createdBy,
            };

            db.MemberAppointments.Add(app);
            db.SaveChanges();
            var query = new
            {
                message = "success",
                result = GetAppointees(user.branchid)
            };
            message = sz.Serialize(query);
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }

    public static string UpdateAppointmentExpiry(int id, string date)
    {
        string message = "failed adding appointment";
        try
        {

            MemberAppointment app = db.MemberAppointments.Find(id);
            if (app != null) app.EndDateOfAppointment = Accounts.intDate(date);


            db.MemberAppointments.Add(app);
            db.SaveChanges();


        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    private static object GetAppointees(int branchID)
    {
        //for every role of member compute the days between appointed and end
        //int memid = 0;
        //var query = db.MemberAppointments.Where(i => i.MemberID == memid).Select(i => i.EndDateOfAppointment - i.DateOfAppointment).Min();
        //report on the minimum difference with the expiry date in the future
        Func<int, string> fullname = (id) =>
        {
            return db.Members
            .Where(i => i.MemberID == id)
            .Select(i => i.LastName + " " + i.FirstName)
            .FirstOrDefault();
        };
        Func<MemberAppointment, double> days = (dateto) =>
        {

            double dayspan = (Convert.ToDateTime(Accounts.USdate(dateto.EndDateOfAppointment.ToString())))
                           .Subtract(Convert.ToDateTime(DateTime.Today))
                           .Days;
            return dayspan;
        };



        var query = db.MemberAppointments.AsEnumerable()
            .Where(i => i.BranchID == branchID)
            .OrderByDescending(i => i.ID)
            .GroupBy(i => i.MemberID)
            .Select(i => new
            {
                ID = i.Key,
                LastName = db.Members.Where(p => i.Key == p.MemberID).Select(p => p.LastName).FirstOrDefault(),
                FirstName = db.Members.Where(p => i.Key == p.MemberID).Select(p => p.FirstName).FirstOrDefault(),
                NumberOfRoles = db.MemberAppointments.Count(p => i.Key == p.MemberID),
                DaysToExpiry = db.MemberAppointments
                                       .AsEnumerable()
                                       .Where(p => p.MemberID == i.Key)
                                       .Select(p => new
                                       {
                                           DaysToExpire = Convert.ToDateTime(Accounts.USdate(p.EndDateOfAppointment.ToString()))
                                                               .Subtract(DateTime.Now).Days,
                                       }).Min(p => p.DaysToExpire)
                                        ,
                Flage = 0,
                ReviewRole = string.Empty,
                CreatedOn = Accounts.UKdate(i.Max(p => p.CreatedOn).ToString()),
                CreatedBy = fullname(i.Max(p => p.CreatedBy)),
                Record = i
            });
        return query.OrderBy(i => i.DaysToExpiry).Select(i => i);
    }
    [WebMethod]
    public static string GetRoleAppointees(int branchID)
    {
        string message = "failed loading appointments";
        try
        {
            message = sz.Serialize(GetAppointees(branchID));
        }
        catch (Exception)
        {

        }
        return message;
    }
    [WebMethod]
    public static string GetDictionary()
    {
        string message = "failed to get dictionary";
        try
        {

            message = sz.Serialize(db.Dictionaries
                .Where(i => i.Name == "Roles" && i.PageName == "Appointment")
                .Select(i => new { i.Value, i.ID }).Distinct());
        }
        catch (Exception)
        {


        }
        return message;
    }
    
    [WebMethod]
    public static string DeleteRole(int roleid)
    {
        message = sz.Serialize(new{ message = "failed"});
        try
        {
            var appointmentRole = db.Dictionaries.Find(roleid);
            db.Dictionaries.Remove(appointmentRole);
            db.SaveChanges();
            message = sz.Serialize(new {
                message="success",
                result= GetDictionary()
            });

        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string AddToDictionary(string arraystring)
    {
        string message = "failed to add to dictionary";
        try
        {
            if (string.IsNullOrEmpty(arraystring)) { message = "Role name(s) to add cannot be empty"; return message; };

            foreach (string item in arraystring.Split(','))
            {
                //if role doesnt exit add 
                if (db.Dictionaries.Where(i => i.Name == "Roles" && i.PageName == "Appointment" && i.Value == item).Count() == 0)
                {
                    db.Dictionaries.Add(new Dictionary()
                    {
                        Name = "Roles",
                        Value = item,
                        PageName = "Appointment"
                    });
                    db.SaveChanges();
                }

            }
            message = GetDictionary();
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMemberRoles(int MemberID)
    {
        string message = "failed getting member roles";
        try
        {
            //get all appointments for member
            var query = db.MemberAppointments.AsEnumerable().Where(i => i.MemberID == MemberID)
                .Select(i => new
                {
                    AppointmentID = i.ID,
                    BranchID = i.BranchID,
                    MemberID = i.MemberID,
                    Role = db.Dictionaries.AsEnumerable().Where(p => p.ID == int.Parse(i.Role)).Select(p => p.Value).First(),
                    DateOfAppointment = i.DateOfAppointment,
                    EndDateOfAppointment = i.EndDateOfAppointment,
                    DaysToExpire = Convert.ToDateTime(Accounts.USdate(i.EndDateOfAppointment.ToString()))
                                        .Subtract(DateTime.Now).Days,
                    Location = i.Location,
                    AuthorisingOfficer = i.AuthorisingOfficer,
                    Comment = i.Comment,

                });
            message = sz.Serialize(query);
        }
        catch (Exception ex)
        {
            message = ex.Message;

        }
        return message;
    }
    [WebMethod]
    public static string AddRoleReview(MemberRoleReview role)
    {
        string message = sz.Serialize(new { message = "failed adding role review" });
        try
        {
            //validate all entries
            if (role == null) return message;
            if (role.AppointmentID == 0) return "invalid appointment id";
            if (role.MemberID == 0) return "invalid member id";
            if (role.BranchID == 0) return "invalid branch id";
            if (string.IsNullOrEmpty(role.ReviewRole) || string.IsNullOrWhiteSpace(role.ReviewRole)) return "invalid  Role";
            if (string.IsNullOrEmpty(role.ReviewRoleFrom) || string.IsNullOrWhiteSpace(role.ReviewRoleFrom)) return "invalid  Role From";
            if (string.IsNullOrEmpty(role.ReviewRoleTo) || string.IsNullOrWhiteSpace(role.ReviewRoleTo)) return "invalid  Role To";
            if (string.IsNullOrEmpty(role.ReviewRoleStrengths) || string.IsNullOrWhiteSpace(role.ReviewRoleStrengths)) return "invalid  Role Strengths";
            if (string.IsNullOrEmpty(role.ReviewRoleWeakness) || string.IsNullOrWhiteSpace(role.ReviewRoleWeakness)) return "invalid  Role Weakness";
            if (string.IsNullOrEmpty(role.ReviewRoleSupport) || string.IsNullOrWhiteSpace(role.ReviewRoleSupport)) return "invalid  Role Support";
            if (string.IsNullOrEmpty(role.ReviewComment) || string.IsNullOrWhiteSpace(role.ReviewComment)) return "invalid  Comment";
            if (string.IsNullOrEmpty(role.RoleAction) || string.IsNullOrWhiteSpace(role.RoleAction)) return "invalid  Role Action";
            if (string.IsNullOrEmpty(role.ReviewDate) || string.IsNullOrWhiteSpace(role.ReviewDate)) return "invalid  date entered";

            //if (role.CreatedOn  ==0) return "invalid created date";
            if (role.CreatedBy == 0) return "invalid created by date";


            // add review to database
            MemberAppointmentRoleReview review = new MemberAppointmentRoleReview()
            {
                AppointmentID = role.AppointmentID,
                MemberID = role.MemberID,
                BranchID = role.BranchID,
                ReviewRole = role.ReviewRole,
                ReviewRoleFrom = role.ReviewRoleFrom,
                ReviewRoleTo = role.ReviewRoleTo,
                ReviewRoleStrengths = role.ReviewRoleStrengths,
                ReviewRoleWeakness = role.ReviewRoleWeakness,
                ReviewRoleSupport = role.ReviewRoleSupport,
                ReviewComment = role.ReviewComment,
                RoleAction = role.RoleAction,
                CreatedOn = Accounts.TodaysDate(),
                CreatedBy = role.CreatedBy,
                ReviewDate = Accounts.intDate(role.ReviewDate),
            };
            db.MemberAppointmentRoleReviews.Add(review);
            db.SaveChanges();
            if (role.RoleAction == "Extend appointment") UpdateAppointmentExpiry(role.AppointmentID, role.ReviewRoleTo);


            //finish adding role
            var query = new
            {
                message = "success",
                result = RolesReviewed(role.MemberID)
            };
            message = sz.Serialize(query);
        }
        catch (Exception ex)
        {
            //finish adding role
            var query = new
            {
                message = ex.Message,
                result = string.Empty
            };
            sz.Serialize(query);

        }
        return message;
    }
    /// <summary>
    /// return all reviewed roles collection object for person
    /// </summary>
    /// <param name="MemberID"></param>
    /// <returns></returns>
    [WebMethod]
    private static IEnumerable<object> RolesReviewed(int MemberID)
    {
        //List<MemberAppointmentRoleReview> ret = new List<MemberAppointmentRoleReview>();

        var query = from match in db.MemberAppointmentRoleReviews.AsEnumerable()
                    where match.MemberID == MemberID
                    orderby match.ID descending
                    select new
                    {
                        RolesReviewID = match.ID,
                        AppointmentID = match.AppointmentID,
                        MemberID = match.MemberID,
                        BranchID = match.BranchID,
                        ReviewRole = match.ReviewRole,
                        ReviewRoleFrom = match.ReviewRoleFrom,
                        ReviewRoleTo = match.ReviewRoleTo,
                        ReviewRoleStrengths = match.ReviewRoleStrengths,
                        ReviewRoleWeakness = match.ReviewRoleWeakness,
                        ReviewRoleSupport = match.ReviewRoleSupport,
                        ReviewComment = match.ReviewComment,
                        RoleAction = match.RoleAction,
                        CreatedOn = match.CreatedOn,
                        CreatedBy = db.Members.Where(i => i.MemberID == match.CreatedBy).Select(i => i.LastName + " " + i.FirstName).FirstOrDefault(),
                        ReviewDate = match.ReviewDate
                    };


        return query;
    }
    /// <summary>
    /// return all reviewed roles for the member
    /// </summary>
    /// <param name="MemberID"></param>
    /// <returns></returns>
    [WebMethod]
    public static string GetRolesReviewed(int MemberID)
    {
        string message = sz.Serialize(new { message = "failed getting roles review" });
        try
        {

            var query = new
            {
                message = "success",
                result = RolesReviewed(MemberID)
            };
            message = sz.Serialize(query);
        }
        catch (Exception)
        {


        }
        return message;
    }
}
public class Appointees
{
    public int memberid { get; set; }
    public int branchid { get; set; }
    public string role { get; set; }
    public int dateOfAppointment { get; set; }
    public int endDateOfAppointment { get; set; }
    public int alertNoticeDays { get; set; }
    public string authorisingOfficer { get; set; }
    public string location { get; set; }
    public int createdBy { get; set; }
    public int createdOn { get; set; }
    public string comment { get; set; }


}


public class AppointmentReview
{
    public int ID { get; set; }
    public int AppointeeID { get; set; }
    public int BranchID { get; set; }
    public int MemberID { get; set; }
    public string NewRole { get; set; }
    public string CurrentRoles { get; set; }
    public int StartDate { get; set; }
    public int EndDate { get; set; }
    public string AlertPeriod { get; set; }
    public string RolseStatus { get; set; }
    public int NumOfRoles { get; set; }
    public int CreatedOn { get; set; }
    public int CreatedBy { get; set; }
}
public class CappedRoles
{
    public string Name { get; set; }
    public int ID { get; set; }
}

public class MemberRoleReview
{
    public int AppointmentID { get; set; }
    public int MemberID { get; set; }
    public int BranchID { get; set; }
    public string ReviewRole { get; set; }
    public string ReviewRoleFrom { get; set; }
    public string ReviewRoleTo { get; set; }
    public string ReviewRoleStrengths { get; set; }
    public string ReviewRoleWeakness { get; set; }
    public string ReviewRoleSupport { get; set; }
    public string ReviewComment { get; set; }
    public string RoleAction { get; set; }
    public int CreatedOn { get; set; }
    public int CreatedBy { get; set; }
    public string ReviewDate { get; set; }
}

