using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_AttendantsMonitor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    //protected void Page_Load(object sender, EventArgs e)
    //{
    //    //getActivities();
    //}

    [WebMethod]
    public static string getActivities()
    {
        string message = "Record not Found";
        var query = db.Activities.Select(x => x).ToList();
        message = sz.Serialize(new
        {
            message = "Loaded Successfully",
            Results = query.Select(i => new
            {
                ActivityName = i.ActivityName
            })
        });
        return message;
    }

    [WebMethod]
    public static string getAreaAttendance(string activity, string levelcount)
    {
        string message = "Record not Found";

        List<string> areaList = new List<string>();

        DateTime mydate = DateTime.Today;//.AddDays(0);
        var data = (from a in db.Attendances
                    join m in db.Members on a.MemberID equals m.MemberID
                    where (a.AttendanceDate == mydate && a.ActivityName == activity)
                    //select new { m.MemberID, m.FirstName, m.LastName, m.Title, m.Gender, m.AgeCategory,m.BranchID,m.DistrictID,m.AreaID,m.AssignedBranchGroups, a.AttendanceDate });
                    select new
                    {
                        MemberID = m.MemberID,
                        FirstName = m.FirstName,
                        LastName = m.LastName,
                        Title = m.Title,
                        Gender = m.Gender,
                        AgeCategory = m.AgeCategory,
                        BranchID = m.BranchID,
                        DistrictID = m.DistrictID,
                        AreaID = m.AreaID,
                        AssignedBranchGroups = m.AssignedBranchGroups,
                        AttendanceDate = a.AttendanceDate,
                        BranchName = db.Branches.Where(u => u.ID == m.BranchID).Select(y => y.Name).FirstOrDefault(),
                        DistrictName = db.Districts.Where(u => u.ID == m.DistrictID).Select(y => y.Name).FirstOrDefault(),
                        AreaName = db.Areas.Where(u => u.ID == m.AreaID).Select(y => y.Name).FirstOrDefault(),
                    });
        var query = data.GroupBy(i => new { i.AreaName }).Select(i => new
        {
            AreaName = i.Key.AreaName,
            AreaCount = i.Count()
        });

        message = sz.Serialize(new
        {
            message = "Loaded Successfuly",
            Results = query.Select(x => new
            {
                AreaName = x.AreaName, //x.LevelName.Select(i=>i.AreaName),
                AreaCount = x.AreaCount //x.LevelName.Select(i => i.AreaCount)
            })
        });
        return message;
    }
    [WebMethod]
    public static string getDistrictAttendance(string activity, string levelcount)
    {
        string message = "Record not Found";

        List<string> areaList = new List<string>();

        DateTime mydate = DateTime.Today;//.AddDays(-3);
        var data = (from a in db.Attendances
                    join m in db.Members on a.MemberID equals m.MemberID
                    where (a.AttendanceDate == mydate && a.ActivityName == activity)
                    //select new { m.MemberID, m.FirstName, m.LastName, m.Title, m.Gender, m.AgeCategory,m.BranchID,m.DistrictID,m.AreaID,m.AssignedBranchGroups, a.AttendanceDate });
                    select new
                    {
                        MemberID = m.MemberID,
                        FirstName = m.FirstName,
                        LastName = m.LastName,
                        Title = m.Title,
                        Gender = m.Gender,
                        AgeCategory = m.AgeCategory,
                        BranchID = m.BranchID,
                        DistrictID = m.DistrictID,
                        AreaID = m.AreaID,
                        AssignedBranchGroups = m.AssignedBranchGroups,
                        AttendanceDate = a.AttendanceDate,
                        BranchName = db.Branches.Where(u => u.ID == m.BranchID).Select(y => y.Name).FirstOrDefault(),
                        DistrictName = db.Districts.Where(u => u.ID == m.DistrictID).Select(y => y.Name).FirstOrDefault(),
                        AreaName = db.Areas.Where(u => u.ID == m.AreaID).Select(y => y.Name).FirstOrDefault(),
                    });
        var query = data.GroupBy(i => new { i.DistrictName }).Select(i => new
        {
            DistrictName = i.Key.DistrictName,
            DistrictCount = i.Count()
        });
        message = sz.Serialize(new
        {
            message = "Loaded Successfuly",
            Results = query.Select(x => new
            {
                DistrictName = x.DistrictName, //x.LevelName.Select(i=>i.AreaName),
                DistrictCount = x.DistrictCount //x.LevelName.Select(i => i.AreaCount)
            })
        });
        return message;
    }
    [WebMethod]
    public static string getLocalAttendance(string activity, string levelcount)
    {
        string message = "Record not Found";

        List<string> areaList = new List<string>();

        DateTime mydate = DateTime.Today;//.AddDays(-1);
        var data = (from a in db.Attendances
                    join m in db.Members on a.MemberID equals m.MemberID
                    where (a.AttendanceDate == mydate && a.ActivityName == activity)
                    //select new { m.MemberID, m.FirstName, m.LastName, m.Title, m.Gender, m.AgeCategory,m.BranchID,m.DistrictID,m.AreaID,m.AssignedBranchGroups, a.AttendanceDate });
                    select new
                    {
                        MemberID = m.MemberID,
                        FirstName = m.FirstName,
                        LastName = m.LastName,
                        Title = m.Title,
                        Gender = m.Gender,
                        AgeCategory = m.AgeCategory,
                        BranchID = m.BranchID,
                        DistrictID = m.DistrictID,
                        AreaID = m.AreaID,
                        AssignedBranchGroups = m.AssignedBranchGroups,
                        AttendanceDate = a.AttendanceDate,
                        BranchName = db.Branches.Where(u => u.ID == m.BranchID).Select(y => y.Name).FirstOrDefault(),
                        DistrictName = db.Districts.Where(u => u.ID == m.DistrictID).Select(y => y.Name).FirstOrDefault(),
                        AreaName = db.Areas.Where(u => u.ID == m.AreaID).Select(y => y.Name).FirstOrDefault(),
                    });
        var query = data.GroupBy(i => new { i.BranchName }).Select(i => new
        {
            BranchName = i.Key.BranchName,
            BranchCount = i.Count()
        });

        message = sz.Serialize(new
        {
            message = "Loaded Successfuly",
            Results = query.Select(x => new
            {
                BranchName = x.BranchName, //x.LevelName.Select(i=>i.AreaName),
                BranchCount = x.BranchCount //x.LevelName.Select(i => i.AreaCount)
            })
        });
        return message;
    }

    protected void aLogout_Click(object sender, EventArgs e)
    {

    }
}