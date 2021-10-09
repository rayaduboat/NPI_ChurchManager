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
         
    }
    protected void aLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("../default.aspx");
    }
    [WebMethod]
    public static string PostWeeklyActivities(WeeklyServiceClass ws)

    {
        DistrictDBEntities mycontext = new DistrictDBEntities();
        string message = "failed adding data";
        try
        {
            //if (selectBranchName == "Select branch")
            //{
            //    throw new Exception("select your branch first");
            //}
            //if (lblDate.Length == 0)
            //{
            //    throw new Exception("enter service date");
            //}
            //if (textBoxWomenCount.Length == 0)
            //{
            //    throw new Exception("enter woment count");
            //}
            //if (textBoxMenCount.Length == 0)
            //{
            //    throw new Exception("enter men count");
            //}
            //if (textBoxSermonTitle.Length == 0)
            //{
            //    throw new Exception("enter sermon title");
            //}
            //if (textBoxSermonSummary.Length == 0)
            //{
            //    throw new Exception("enter sermon summary");
            //}

            Table_WeeklyServiceReport mypost = new Table_WeeklyServiceReport();
            mypost.ActivityDate = ws.lblDate;
            mypost.BranchID = ws.BranchID;
            mypost.MenCount = ws.textBoxMenCount;
            mypost.WomenCount = ws.textBoxWomenCount;
            mypost.ChildrenCount = ws.textBoxChildrenCount;
            mypost.SermonSpeaker = ws.textBoxSermonSpeaker;
            mypost.BibleStudyTopic = ws.textBoxBibleStudyTopic;
            mypost.KeyInformation = ws.textBoxKeyInformation;
            mypost.MidWeek = ws.textBoxMidWeek;
            mypost.MissionaryOffering = ws.textBoxMissionaryOffering;
            mypost.NewMembers = ws.textBoxNewMembers;
            mypost.Other = ws.textBoxOther;
            mypost.SermonSummary = ws.textBoxSermonSummary;
            mypost.SermonTitle = ws.textBoxSermonTitle;
            mypost.Specify = ws.textBoxSpecify;
            mypost.Tithes = ws.textBoxTithes;
            mypost.AbsentTwoWeeks = ws.textBoxAbsentTwoWeeks;
            mypost.ServiceName = ws.textBoxServiceName;
            mypost.SoulsWon = ws.textBoxSoulsWon;
            mypost.HolySpiritBaptised = ws.textBoxHolySpiritBaptised;
            mypost.WaterBaptised = ws.textBoxWaterBaptised;
            mypost.CreatedOn = Accounts.TodaysDate();
            mypost.CreatedBy = ws.CreatedBy;
            mypost.Visitation = ws.textBoxVisitation;
            mycontext.Table_WeeklyServiceReport.Add(mypost);
            mycontext.SaveChanges();
            message = "added data successfully";
            //}
        }
        catch (Exception ex)
        {
            message = ex.Message;
        }

        return message;
    }
    [WebMethod]
    public static string GetWeekDateActivities(string searchDate)
    {
        DistrictDBEntities mycontext = new DistrictDBEntities();
        var o = (from match in mycontext.Table_WeeklyServiceReport
                 where match.ActivityDate == searchDate
                 select match).First();


        var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        return oSerializer.Serialize(o);

    }
    [WebMethod]
    public static string GetWeekDateActivitiesByBranch(string searchDate, int branchID)
    {
        DistrictDBEntities mycontext = new DistrictDBEntities();
        var o = (from match in mycontext.Table_WeeklyServiceReport
                 where match.ActivityDate == searchDate && match.BranchID == branchID
                 select match).First();


        var oSerializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        return oSerializer.Serialize(o);

    }
    [WebMethod]
    public static string UpdatetWeeklyActivities(UpdateWeeklyServiceClass ws)
    {
        string message = "failed adding data";
        try
        {
            DistrictDBEntities mycontext = new DistrictDBEntities();
            Table_WeeklyServiceReport mypost = new Table_WeeklyServiceReport();
            var entity = mycontext.Table_WeeklyServiceReport.Find(ws.ID);
            entity.ActivityDate = ws.lblDate;
            entity.BranchID = ws.BranchID;
            entity.MenCount = ws.textBoxMenCount;
            entity.WomenCount = ws.textBoxWomenCount;
            entity.ChildrenCount = ws.textBoxChildrenCount;
            entity.SermonSpeaker = ws.textBoxSermonSpeaker;
            entity.BibleStudyTopic = ws.textBoxBibleStudyTopic;
            entity.KeyInformation = ws.textBoxKeyInformation;
            entity.MidWeek = ws.textBoxMidWeek;
            entity.MissionaryOffering = ws.textBoxMissionaryOffering;
            entity.NewMembers = ws.textBoxNewMembers;
            entity.Other = ws.textBoxOther;
            entity.SermonSummary = ws.textBoxSermonSummary;
            entity.SermonTitle = ws.textBoxSermonTitle;
            entity.Specify = ws.textBoxSpecify;
            entity.Tithes = ws.textBoxTithes;
            entity.AbsentTwoWeeks = ws.textBoxAbsentTwoWeeks;
            entity.ServiceName = ws.textBoxServiceName;
            entity.SoulsWon = ws.textBoxSoulsWon;
            entity.HolySpiritBaptised = ws.textBoxHolySpiritBaptised;
            entity.WaterBaptised = ws.textBoxWaterBaptised;
            entity.Visitation = ws.textBoxVisitation;


            //'If (original IsNot Nothing) Then

            mycontext.Entry(entity).CurrentValues.SetValues(entity);
            mycontext.SaveChanges();
            message = "updated data successfully";
            //'End If

        }
        catch (Exception ex)
        {
            message = ex.Message;
        }

        return message;
    }
    /// <summary>
    /// Sends convention and conference data into database
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public static string PostConventionAndConference(string name,
                                                     string date,
                                                     string speaker,
                                                     string title,
                                                     string malecount,
                                                     string femalecount,
                                                     string children,
                                                     string spectacularevent,
                                                     string specialOccurence,
                                                     string SoulsWon,
                                                     string convertsWaterBaptised,
                                                     string membersWaterBaptised,
                                                     string holySpiritBaptised,
                                                     string titheAndOffering,
                                                     string otherOffering,
                                                     string authorisedExpenditure,
                                                     string generalAssessment,
                                                     string certificationMinister,
                                                     string officiatingMinister)
    {
        string message = "failed adding record";
        try
        {
            //TODO: SEND DATA TO DATABASE
            DistrictDBEntities mycontext = new DistrictDBEntities();
            ConventionAndConference conv = new ConventionAndConference();
            if (string.IsNullOrEmpty(name) && string.IsNullOrWhiteSpace(name)) throw new Exception("Please supply conference or convention name");
            if (string.IsNullOrEmpty(date) && string.IsNullOrWhiteSpace(date)) throw new Exception("Please supply conference or convention date");
            if (string.IsNullOrEmpty(speaker) && string.IsNullOrWhiteSpace(name)) throw new Exception("Please supply conference or title                ");
            if (string.IsNullOrEmpty(title) && string.IsNullOrWhiteSpace(title)) throw new Exception("Please supply conference or malecount            ");
            if (string.IsNullOrEmpty(malecount) && string.IsNullOrWhiteSpace(malecount)) throw new Exception("Please supply conference or femalecount          ");
            if (string.IsNullOrEmpty(femalecount) && string.IsNullOrWhiteSpace(femalecount)) throw new Exception("Please supply conference or children             ");
            if (string.IsNullOrEmpty(children) && string.IsNullOrWhiteSpace(children)) throw new Exception("Please supply conference or spectacularevent     ");
            if (string.IsNullOrEmpty(spectacularevent) && string.IsNullOrWhiteSpace(spectacularevent)) throw new Exception("Please supply conference or specialOccurence     ");
            if (string.IsNullOrEmpty(specialOccurence) && string.IsNullOrWhiteSpace(specialOccurence)) throw new Exception("Please supply conference or SoulsWon             ");
            if (string.IsNullOrEmpty(SoulsWon) && string.IsNullOrWhiteSpace(SoulsWon)) throw new Exception("Please supply conference or convertsWaterBaptised");
            if (string.IsNullOrEmpty(convertsWaterBaptised) && string.IsNullOrWhiteSpace(convertsWaterBaptised)) throw new Exception("Please supply conference or membersWaterBaptised ");
            if (string.IsNullOrEmpty(membersWaterBaptised) && string.IsNullOrWhiteSpace(membersWaterBaptised)) throw new Exception("Please supply conference or holySpiritBaptised   ");
            if (string.IsNullOrEmpty(holySpiritBaptised) && string.IsNullOrWhiteSpace(holySpiritBaptised)) throw new Exception("Please supply conference or titheAndOffering     ");
            if (string.IsNullOrEmpty(titheAndOffering) && string.IsNullOrWhiteSpace(titheAndOffering)) throw new Exception("Please supply conference or otherOffering        ");
            if (string.IsNullOrEmpty(otherOffering) && string.IsNullOrWhiteSpace(otherOffering)) throw new Exception("Please supply conference or authorisedExpenditure");
            if (string.IsNullOrEmpty(authorisedExpenditure) && string.IsNullOrWhiteSpace(authorisedExpenditure)) throw new Exception("Please supply conference or generalAssessment    ");
            if (string.IsNullOrEmpty(generalAssessment) && string.IsNullOrWhiteSpace(generalAssessment)) throw new Exception("Please supply conference or certificationMinister");
            if (string.IsNullOrEmpty(certificationMinister) && string.IsNullOrWhiteSpace(certificationMinister)) throw new Exception("Please supply conference or officiatingMinister  ");
            if (string.IsNullOrEmpty(officiatingMinister) && string.IsNullOrWhiteSpace(officiatingMinister)) throw new Exception("Please supply conference or ");

            var match = from eq in mycontext.ConventionAndConferences
                        where eq.date == date && eq.name == name
                        select eq;
            if (match.Count() == 1) return "Event already added";
            conv.name = name;
            conv.date = date;
            conv.speaker = speaker;
            conv.title = title;
            conv.malecount = malecount;
            conv.femalecount = femalecount;
            conv.children = children;
            conv.spectacularevent = spectacularevent;
            conv.specialOccurence = specialOccurence;
            conv.soulsWon = SoulsWon;
            conv.convertsWaterBaptised = convertsWaterBaptised;
            conv.membersWaterBaptised = membersWaterBaptised;
            conv.holySpiritBaptised = holySpiritBaptised;
            conv.titheAndOffering = titheAndOffering;
            conv.otherOffering = otherOffering;
            conv.authorisedExpenditure = authorisedExpenditure;
            conv.generalAssessment = generalAssessment;
            conv.certificationMinister = certificationMinister;
            conv.officiatingMinister = officiatingMinister;

            mycontext.ConventionAndConferences.Add(conv);
            mycontext.SaveChanges();
            message = "record added to database";
        }
        catch (Exception ex)
        {
            message = ex.Message;
            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string LoadWeeklyServiceReport(int branchID)
    {
        string message = "failed to load service report";
        try
        {
            message = sz.Serialize(db.Table_WeeklyServiceReport
                .OrderByDescending(i => i.Id)
                .Where(i => i.BranchID == branchID)
                .Select(i => new
                {
                    ServiceID = i.Id,

                    SelectBranchName = db.Branches.Where(p => p.ID == i.BranchID).Select(p => p.Name).FirstOrDefault(),
                    MenCount = i.MenCount,
                    WomenCount = i.WomenCount,
                    ChildrenCount = i.ChildrenCount,
                    SermonSpeaker = i.SermonSpeaker,
                    BibleStudyTopic = i.BibleStudyTopic,
                    KeyInformation = i.KeyInformation,
                    MidWeek = i.MidWeek,
                    MissionaryOffering = i.MissionaryOffering,
                    NewMembers = i.NewMembers,
                    Other = i.Other,
                    SermonSummary = i.SermonSummary,
                    SermonTitle = i.SermonTitle,
                    Specify = i.Specify,
                    Tithes = i.Tithes,
                    AbsentTwoWeeks = i.AbsentTwoWeeks,
                    ActivityDate = i.ActivityDate,
                    i.ServiceName,
                    i.SoulsWon,
                    i.WaterBaptised,
                    i.HolySpiritBaptised,
                    i.Visitation,
                    CreatedBy = db.Members.Where(p => p.MemberID == i.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                    i.CreatedOn

                }
            ));
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string SearchCriteria(SearchCriteriaFilter obj)
    {

        string message = sz.Serialize(new { message = "failed search" });
        try
        { 
            if (obj.selectedBranch != "All")
            {
                //get branch id
                int branchid = db.Branches
                    .Where(i => i.Name == obj.selectedBranch)
                    .Select(i => i.ID)
                    .FirstOrDefault();
                if (branchid==0)
                {
                    return message;
                }

                message = GetServiceIncomeAggregation(obj, branchid.ToString());

            }
            else
            {
                // select all 
                string branchid = string.Empty;
                if (obj == null || obj.assignedBranches.Length == 0)
                {
                    message = sz.Serialize(new
                    {
                        message = "No assigned branches to perform aggregation"

                    });
                    return message;
                }

                //build a comma seperated list of branchid
                foreach (var item in obj.assignedBranches)
                {
                    branchid += item.BranchID + ",";
                }
                // remove last comma character
                branchid = branchid.Substring(0, branchid.Length - 1);

                message = GetServiceIncomeAggregation(obj, branchid);
            }
        }
        catch (Exception ex)
        {

        }
        return message;
    }

    private static string GetServiceIncomeAggregation(SearchCriteriaFilter obj, string branchid)
    {
        string message;
        var query = db.sp_WeeklyServiceAggregation(branchid, obj.month, obj.year).ToList();
        var stats = db.sp_WeeklyServiceStatistics(branchid, obj.month, obj.year).ToList();

        message = sz.Serialize(new
        {
            message = "success",
            result = query,
            statistics = stats
        });
        return message;
    }

    [WebMethod]
    public static string Delete(int id)
    {
        string message = "failed deleting";
        try
        {
            Table_WeeklyServiceReport serviceReport = db.Table_WeeklyServiceReport.Find(id);
            db.Table_WeeklyServiceReport.Remove(serviceReport);
            db.SaveChanges();
            message = "success";
        }
        catch (Exception)
        {

        }
        return message;
    }
}
public class SearchCriteriaFilter
{
    public int month { get; set; }
    public int year { get; set; }
    public string selectedBranch { get; set; }
    public BranchAndID[] assignedBranches { get; set; }
}
public class BranchAndID
{
    public string BranchName { get; set; }
    public int BranchID { get; set; }
}

public class UpdateWeeklyServiceClass : WeeklyServiceClass
{
    public int ID { get; set; }

}
public class WeeklyServiceClass
{
    public string lblDate { get; set; }
    public int BranchID { get; set; }
    public string textBoxMenCount { get; set; }
    public string textBoxWomenCount { get; set; }
    public string textBoxChildrenCount { get; set; }
    public string textBoxSermonSpeaker { get; set; }
    public string textBoxBibleStudyTopic { get; set; }
    public string textBoxKeyInformation { get; set; }
    public string textBoxMidWeek { get; set; }
    public string textBoxMissionaryOffering { get; set; }
    public string textBoxNewMembers { get; set; }
    public string textBoxOther { get; set; }
    public string textBoxSermonSummary { get; set; }
    public string textBoxSermonTitle { get; set; }
    public string textBoxSpecify { get; set; }
    public string textBoxTithes { get; set; }
    public string textBoxAbsentTwoWeeks { get; set; }
    public string textBoxServiceName { get; set; }
    public int textBoxSoulsWon { get; set; }
    public int textBoxHolySpiritBaptised { get; set; }
    public int textBoxWaterBaptised { get; set; }
    public int CreatedBy { get; set; }
    public int? textBoxVisitation { get; set; }
}