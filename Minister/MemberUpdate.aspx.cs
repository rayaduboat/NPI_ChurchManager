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

public partial class Minister_MembershipList : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string querystring = this.Page.ClientQueryString;
            //if query string is empty then redirect user to login page
            if(string.IsNullOrEmpty(querystring) ||string.IsNullOrWhiteSpace(querystring)) Response.Redirect("../Default.aspx");
            //if query string is not in ther right format return to login page
            if(!querystring.Contains("hash=")) Response.Redirect("../Default.aspx");
            //get hash part or querystring
            string hash = querystring.Split('=')[1];
            //check if hash is valid and the Expiry date has not expired
            int todayDate = Accounts.TodaysDate();
            MemberUpdate memberUpdate = db.MemberUpdates.Where(i => i.HashKey == hash).FirstOrDefault();
            if(memberUpdate==null) Response.Redirect("../Default.aspx");
            //if todays date is greater that the date member update was activated
            //member update has expired and redirect user to login page
            if (todayDate>memberUpdate.CreatedOn) Response.Redirect("../Default.aspx");
            TextBoxBranchNames.Text = db.Branches.Where(i => i.ID == memberUpdate.BranchID).Select(i => i.Name).FirstOrDefault();
            TextBoxBranchNames.Attributes.Add("branchID", memberUpdate.BranchID.ToString());
        }
        catch (Exception ex)
        {


        }

    }

    private bool IsMemberUpdateOpen()
    {
        //check if is census year and let user stay, else throw them to home page
        var query = from match in db.Dictionaries.AsEnumerable()
                    where match.PageName == "MemberUpdate"
                    where match.Name == "PersonalDetails"
                    where match.Value == "Open"
                    select match;

        if (query.Count() == 0)
        {
            //not a census year redirect user to login page
            Response.Redirect("../Default.aspx");
        }
        return query.Count() == 0;
    }
    [WebMethod]
    public static string Activate(MemberUpdateClass memberUpdateClass)
    {
        string message = "failed";
        try
        {
            //check whether session is not already active
            var match = db.MemberUpdates.AsEnumerable()
                .Where(p => p.CreatedOn == Accounts.TodaysDate())
                .Where(p => p.BranchID == memberUpdateClass.BranchID)
                .Select(i => i).ToList();
            if (match.Count() != 0)
            {
                return "Member update page already activated";
            }
            MemberUpdate memberUpdate = new MemberUpdate()
            {
                BranchID = memberUpdateClass.BranchID,
                CreatedBy = memberUpdateClass.CreatedBy,
                Status = 1, //1 meaning member update page is active
                CreatedOn = Accounts.TodaysDate(), //1 meaning member update page is active
            };
            db.MemberUpdates.Add(memberUpdate);
            db.SaveChanges();
            message = "success";
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string DeActivate(int Id)
    {
        string message = "failed";
        try
        {
            MemberUpdate memberUpdate = db.MemberUpdates.Find(Id);
            if (memberUpdate == null) return "No session available to deactivate";
            db.MemberUpdates.Remove(memberUpdate);
            db.SaveChanges();
            message = "success";
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static List<MemberUpdate> GetMemberUpdates(int branchID)
    {
        var query = new List<MemberUpdate>();
        try
        {
            query = db.MemberUpdates.AsEnumerable()
                .Where(i => i.BranchID == branchID)
                .OrderByDescending(i=>i.Id)
                .Select(i =>
            new MemberUpdate()
            {
                Id        = i.Id,
                BranchID  = i.BranchID,
                CreatedBy =i.CreatedBy,// db.Members.Where(p=>p.MemberID== i.CreatedBy).Select(p=>p.LastName+""+p.FirstName).FirstOrDefault(),
                CreatedOn = i.CreatedOn,
                HashKey   = i.HashKey,
                Status    = Accounts.TodaysDate()==i.CreatedOn?1:0
            }
            ).ToList();
        }
        catch (Exception)
        {


        }
        return query;

    }
}

public class MemberUpdateClass
{
    public int BranchID { get; set; }
    public int CreatedBy { get; set; }
}