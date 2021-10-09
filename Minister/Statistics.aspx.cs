using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Statistics : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static DistrictDBEntities db = new DistrictDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //get the logged in user
            if (Session["User"] == null) Response.Redirect("../default.aspx");
            JavaScriptSerializer sz = new JavaScriptSerializer();
            var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
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
    public static IQueryable<GenderStatistics> GenderStats(int branchID)
    {
        IQueryable<GenderStatistics> message = null;
        try
        {
            List<GenderStatistics> query = new List<GenderStatistics>();

            query.Add(new GenderStatistics()
            {
                Male = db.Members.Where(i => i.Gender == "Male").Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(),
                Female = db.Members.Where(i => i.Gender == "Female").Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(),
                Total= db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count()
            });





            message = query.AsQueryable();
                 

        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static IQueryable<MembershipTypeStatistics> MembershipTypeStats(int branchID)
    {
        IQueryable<MembershipTypeStatistics> message = null;
        try
        {
            message = (from match in db.Members
                       where match.BranchID == branchID
                       group match by match.MembershipType into newGroup

                       orderby newGroup.Key
                       select new MembershipTypeStatistics()
                       {
                           MembershipType = newGroup.Key,
                           Member = newGroup.Count(i => i.MembershipType == "Member"),
                           NonMember = newGroup.Count(i => i.MembershipType == "Non-member")

                       });
        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static IQueryable<AgeCategoryByGenderStatistics> AgeCategoryByGenderStats(int branchID)
    {
        IQueryable<AgeCategoryByGenderStatistics> message = null;
        try
        {

            List<AgeCategoryByGenderStatistics> query = new List<AgeCategoryByGenderStatistics>();
            query.Add(new AgeCategoryByGenderStatistics()
            {
                AgeAbove35_Male =            db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Above 35"),
                AgeAbove35_FeMale =          db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Above 35"),
                AgeAbove35_Total =           db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(i => i.AgeCategory == "Above 35"),
                Children_0_to_12_Male =      db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Children (0-12)"),
                Children_0_to_12_Female =    db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Children (0-12)"),
                Children_0_to_12_Total =     db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(i => i.AgeCategory == "Children (0-12)"),
                Teenage_13_to_19_Male =      db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Teenage(13-19)"),
                Teenage_13_to_19_Female =    db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Teenage(13-19)"),
                Teenage_13_to_19_Total =     db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(i => i.AgeCategory == "Teenage(13-19)"),
                YoungAdult_20_to_35_Male =   db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Young Adults(20-35)"),
                YoungAdult_20_to_35_Female = db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Young Adults(20-35)"),
                YoungAdult_20_to_35_Total =  db.Members.Where(i => i.MembershipType == "Member").Where(i => i.BranchID == branchID).Count(i => i.AgeCategory == "Young Adults(20-35)"),



            });
            message = query.AsQueryable();

            //message = (from match in db.Members
            //           where match.MembershipType == "Member"
            //           where match.BranchID == branchID
            //           group match by match.AgeCategory into newGroup
            //           orderby newGroup.Key
            //           select new AgeCategoryByGenderStatistics()
            //           {
            //               AgeCategory = newGroup.Key,

            //               AgeAbove35_Male = newGroup.Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Above 35"),
            //               AgeAbove35_FeMale = newGroup.Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Above 35"),
            //               AgeAbove35_Total = newGroup.Count(i => i.AgeCategory == "Above 35"),

            //               Children_0_to_12_Male = newGroup.Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Children (0-12)"),
            //               Children_0_to_12_Female = newGroup.Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Children (0-12)"),
            //               Children_0_to_12_Total = newGroup.Count(i => i.AgeCategory == "Children (0-12)"),

            //               Teenage_13_to_19_Male = newGroup.Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Teenage(13-19)"),
            //               Teenage_13_to_19_Female = newGroup.Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Teenage(13-19)"),
            //               Teenage_13_to_19_Total = newGroup.Count(i => i.AgeCategory == "Teenage(13-19)"),

            //               YoungAdult_20_to_35_Male = newGroup.Where(i => i.Gender == "Male").Count(i => i.AgeCategory == "Young Adults(20-35)"),
            //               YoungAdult_20_to_35_Female = newGroup.Where(i => i.Gender == "Female").Count(i => i.AgeCategory == "Young Adults(20-35)"),
            //               YoungAdult_20_to_35_Total = newGroup.Count(i => i.AgeCategory == "Young Adults(20-35)"),
            //           });


        }
        catch (Exception ex)
        {


        }
        return message;
    }

    [WebMethod]
    public static string Statistics(string branchName)
    {
        string message = "No statistics data generated";
        try
        {
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            MemberStatistics mstats = new MemberStatistics();
            mstats.GenderStats = GenderStats(branchID);
            mstats.MembershipTypeStats = MembershipTypeStats(branchID);
            mstats.AgeCategoryByGenderStats = AgeCategoryByGenderStats(branchID);
            message = sz.Serialize(mstats);
        }
        catch (Exception ex)
        {
            message = ex.Message;
            // throw;
        }
        return message;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="branchinfo"></param>
    /// <returns></returns>
    [WebMethod]
    public static string WeeklyServiceReport(BranchInfo branchinfo)
    {
        string message = "failed to get weekly service report";
        Func<string, DateTime> func = (d) =>
        {
            string year = d.Split('/')[2];
            string month = d.Substring(3, 2);
            string day = d.Substring(0, 2);
            DateTime dt = Convert.ToDateTime(year + "/" + month + "/" + day);
            return dt;
        };
        IQueryable<WeeklyServiceReportStatistics> query = null;
        try
        {

            if (branchinfo.BranchName == "All")
            {
                query = from match in db.Table_WeeklyServiceReport
                        orderby match.Id ascending
                        group match by match.ActivityDate into newGroup
                        orderby newGroup.Key
                        select new WeeklyServiceReportStatistics()
                        {
                            Date = newGroup.Key,
                            Tithes = newGroup.Select(i => i.Tithes).FirstOrDefault(),
                            MissionaryOffering = newGroup.Select(i => i.MissionaryOffering).FirstOrDefault(),
                            Other = newGroup.Select(i => i.Other).FirstOrDefault(),
                        };
            }
            else
            {
                query = from match in db.Table_WeeklyServiceReport
                        where match.BranchID == branchinfo.BranchID
                        orderby match.Id ascending
                        group match by match.ActivityDate into newGroup
                        orderby newGroup.Key
                        select new WeeklyServiceReportStatistics()
                        {

                            Date               = newGroup.Key,
                            Tithes             = newGroup.Select(i => i.Tithes).FirstOrDefault(),
                            MissionaryOffering = newGroup.Select(i => i.MissionaryOffering).FirstOrDefault(),
                            Other              = newGroup.Select(i => i.Other).FirstOrDefault(),
                        };
            }

            message = sz.Serialize(
                 obj: new
                 {
                     message = "success",
                     result = query.AsEnumerable().OrderByDescending(i=> func(i.Date))
                 }

                );

        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }


}
public class WeeklyServiceReportStatistics
{
    public string Date { get; set; }
    public string Tithes { get; set; }
    public string MissionaryOffering { get; set; }
    public string Other { get; set; }
}
public class MembershipTypeStatistics
{
    public MembershipTypeStatistics()
    {
    }

    public string MembershipType { get; set; }
    public int Member { get; set; }
    public int NonMember { get; set; }
}

public class GenderStatistics
{
    public GenderStatistics()
    {
    }

    public int Total { get; set; }
    public int Male { get; set; }
    public int Female { get; set; }
}

public class AgeCategoryByGenderStatistics
{
    public AgeCategoryByGenderStatistics()
    {
    }

    public string AgeCategory { get; set; }
    public int AgeAbove35_Male { get; set; }
    public int AgeAbove35_FeMale { get; set; }
    public int AgeAbove35_Total { get; set; }
    public int Children_0_to_12_Male { get; set; }
    public int Children_0_to_12_Female { get; set; }
    public int Children_0_to_12_Total { get; set; }
    public int Teenage_13_to_19_Male { get; set; }
    public int Teenage_13_to_19_Female { get; set; }
    public int Teenage_13_to_19_Total { get; set; }
    public int YoungAdult_20_to_35_Male { get; set; }
    public int YoungAdult_20_to_35_Female { get; set; }
    public int YoungAdult_20_to_35_Total { get; set; }
}

public class MemberStatistics
{
    public IQueryable<GenderStatistics> GenderStats { get; internal set; }
    public IQueryable<AgeCategoryByGenderStatistics> AgeCategoryByGenderStats { get; internal set; }
    public IQueryable<MembershipTypeStatistics> MembershipTypeStats { get; internal set; }
}