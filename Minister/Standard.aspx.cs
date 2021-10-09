using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.HtmlControls;
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
    public static string MembershipBaptism(string branchid)
    {
        string message = "failed getting membership bastism";
        try
        {
            var bap = db.MemberBaptism.AsEnumerable().Select(i => new {i.IsWaterBaptised,i.IsHolySpiritBaptised,i.MemberID }).ToList();
            //get membership and baptism information
            int brnid = Convert.ToInt16(branchid);

            var query2 = (from mem in db.Members.AsEnumerable()
                             //join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                         where mem.BranchID == brnid
                         select new
                         {
                             BranchID = mem.BranchID,
                             FirstName = mem.FirstName,
                             LastName = mem.LastName,
                             Gender = mem.Gender,
                             AgeCategory = mem.AgeCategory,
                             IsHolySpiritBaptised = bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault() == null|| bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault() == "No" ? "No" : "Yes",
                             IsWaterBaptised = ((bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault()) == null||(bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault()) == "No" ? false : true)

                         }).ToList();

            var query = from newq in (from mem in db.Members.AsEnumerable()
                                      //join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                      where mem.BranchID == brnid
                                      select new
                                      {
                                          BranchID = mem.BranchID,
                                          FirstName = mem.FirstName,
                                          LastName = mem.LastName,
                                          Gender = mem.Gender,
                                          AgeCategory = mem.AgeCategory,
                                          IsHolySpiritBaptised = bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault() == null || bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault() == "No" ? "No" : "Yes",
                                          IsWaterBaptised = ((bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault()) == null || (bap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault()) == "No" ? false : true)

                                      })
                        group newq by newq.BranchID into newGroup
                        select new
                        {
                            BranchName = db.Branches.Where(i => i.ID == brnid).Select(i => i.Name).FirstOrDefault(),
                            Total = db.Members.Where(i => i.BranchID == brnid).Where(i => i.MembershipType == "Member").Count(),
                            MenTotal = db.Members.Where(i => i.BranchID == brnid).Where(p => p.Gender == "Male").Where(i => i.MembershipType == "Member").Count(),
                            WomenTotal = db.Members.Where(i => i.BranchID == brnid).Where(p => p.Gender == "Female").Where(i => i.MembershipType == "Member").Count(),
                            WaterBaptisedTotal = newGroup.Where(p => p.IsWaterBaptised == true).Count(),
                            HolySpiritBaptisedTotal = newGroup.Where(p => p.IsHolySpiritBaptised == "Yes").Count(),
                            Age35Total = db.Members.Where(i => i.BranchID == brnid).Where(p => p.AgeCategory == "Above 35").Where(i => i.MembershipType == "Member").Count(),
                            Children_0_to_12Total = db.Members.Where(i => i.BranchID == brnid).Where(p => p.AgeCategory == "Children (0-12)").Where(i => i.MembershipType == "Member").Count(),
                            Teenage_13_to_19Total = db.Members.Where(i => i.BranchID == brnid).Where(p => p.AgeCategory == "Teenage(13-19)").Where(i => i.MembershipType == "Member").Count(),
                            YoungAdult_20_to_35Total = db.Members.Where(i => i.BranchID == brnid).Where(p => p.AgeCategory == "Young Adults(20-35)").Where(i => i.MembershipType == "Member").Count(),
                            GhanaianMembership                  =0,
                            NoOfNationalsIndigenes              =0,
                            NoOfOtherNationals                  =0,
                            Elders                              = db.Members.Where(i => i.BranchID == brnid).Where(p => p.Title == "Elder")       .Where(i => i.MembershipType == "Member").Count(),
                            Deacons                             = db.Members.Where(i => i.BranchID == brnid).Where(p => p.Title == "Deacon")      .Where(i => i.MembershipType == "Member").Count(),
                            Deaconessess                        = db.Members.Where(i => i.BranchID == brnid).Where(p => p.Title == "Deaconessess").Where(i => i.MembershipType == "Member").Count(),
                            ChildrenDedicated                   =0,
                            RalliesHeld                         =0,
                            AdultsSoulsWon                      =0,
                            OldMembersHolySpiritBaptised        =0,
                            NewConvertsWaterBaptised            =0,
                            NewConvertsHolySpiritBaptised       =0,
                            TransferIn_0_to_19                  =0,
                            TransferIn_19_to_Above              =0,
                            TransferInTotal                     =0,
                            TransferOut_0_to_19                 =0,
                            TransferOut_19_to_Above             =0,
                            TransferOutTotal                    =0,
                            BackSlidersWonBack                   =0,
                            BackSlidersBeingFollowed            =0,
                            NumberOfHomeCells                   =0,
                            AdultDeath                          =0,
                            Birth                               =0,
                            DeathAdultsAndChildren              =0,
                            MarriagesBlessed                    =0,
                        };

            message = sz.Serialize(query);
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AllMembershipBaptism()
    {
        string message = "failed getting membership bastism";
        try
        {
            //get membership and baptism information
            //int brnid = Convert.ToInt16(branchid);
            var query = from newq in (from mem in db.Members
                                      join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                      //where mem.BranchID == brnid
                                      select new
                                      {
                                          BranchID = mem.BranchID,
                                          FirstName = mem.FirstName,
                                          LastName = mem.LastName,
                                          Gender = mem.Gender,
                                          AgeCategory = mem.AgeCategory,
                                          IsHolySpiritBaptised = bap.IsHolySpiritBaptised,
                                          IsWaterBaptised = (bap.DateofBaptism == null ? false : true)

                                      })
                        group newq by newq.BranchID into newGroup
                        select new
                        {
                            //about memberhip
                            BranchName                               = db.Branches.Select(i => i.Name).FirstOrDefault(),
                            Total                               = db.Members.Where(i                               => i.MembershipType == "Member").Count(),
                            MenTotal                               = db.Members.Where(p => p.Gender == "Male").Where(i => i.MembershipType == "Member").Count(),
                            WomenTotal                               = db.Members.Where(p => p.Gender == "Female").Where(i => i.MembershipType == "Member").Count(),
                            WaterBaptisedTotal                               = newGroup.Where(p => p.IsWaterBaptised == true).Count(),
                            HolySpiritBaptisedTotal                               = newGroup.Where(p => p.IsHolySpiritBaptised == "Yes").Count(),
                            Age35Total                               = db.Members.Where(p => p.AgeCategory == "Above 35").Where(i => i.MembershipType == "Member").Count(),
                            Children_0_to_12Total                               = db.Members.Where(p => p.AgeCategory == "Children (0-12)").Where(i => i.MembershipType == "Member").Count(),
                            Teenage_13_to_19Total                               = db.Members.Where(p => p.AgeCategory == "Teenage(13-19)").Where(i => i.MembershipType == "Member").Count(),
                            YoungAdult_20_to_35Total                               = db.Members.Where(p => p.AgeCategory == "Young Adults(20-35)").Where(i => i.MembershipType == "Member").Count(),
                            GhanaianMembership                  =0,
                            NoOfNationalsIndigenes              =0,
                            NoOfOtherNationals                  =0,
                            //about leaders
                            Elders                              =0,
                            Deacons                             =0,
                            Deaconessess                        =0,
                            ChildrenDedicated                   =0,
                            //about souls and baptism
                            AdultsSoulsWon                      =0,
                            OldMembersHolySpiritBaptised        =0,
                            NewConvertsWaterBaptised            =0,
                            NewConvertsHolySpiritBaptised       =0,
                            TransferIn_0_to_19                  =0,
                            TransferIn_19_to_Above              =0,
                            TransferInTotal                     =0,
                            TransferOut_0_to_19                 =0,
                            TransferOut_19_to_Above             =0,
                            TransferOutTotal                    =0,
                            BackSliderWonBack                   =0,
                            BackSlidersBeingFollowed            =0,
                            NumberOfHomeCells                   =0,
                            //About events
                            RalliesHeld                         =0,
                            AdultDeath                          =0,
                            Birth                               =0,
                            DeathAdultsAndChildren              =0,
                            MarriagesBlessed                    =0,

                        };

            message = sz.Serialize(query);
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AttendanceAllProfile()
    {
        string message = "failed getting attendance report";
        List<List<AttendanceAggregate> >allprofiles =new List<List<AttendanceAggregate>>();
        try
        {
            foreach (Branch brn in db.Branches.Select(i => i))
            {
                try
                {

                    //int branchid = Convert.ToInt32(serverBranchName.Value);

                    var query = (from match in db.Attendances
                                           join mem in db.Members on match.MemberID equals mem.MemberID
                                           where mem.BranchID == brn.ID
                                           where match.ActivityName == "Sunday service"
                                           group match by match.AttendanceDate into newgroup
                                           orderby newgroup.Key
                                           select new AttendanceAggregate()
                                           {
                                               BranchName=brn.Name,
                                               Date = newgroup.Key,
                                               Count = newgroup.Count(),
                                               ServiceName="Sunday service"
                                           }).ToList() ;

                    allprofiles.Add(query);
                   
                }
                
                catch (Exception)
                {

                    //throw;
                }
            }

            message = sz.Serialize(new { data = allprofiles,message="success" });
        }
        catch (Exception)
        {


        }
        return message;


    }
    [WebMethod]
    public static string AttendanceBranchProfile(BranchInfo brn)
    {
        string message = "failed getting attendance report";
        try
        {
            
                try
                {

                //int branchid = Convert.ToInt32(serverBranchName.Value);
                Func<DateTime, string> datefunc = (d) => {
                    string str = d.ToShortDateString().Substring(0,10);
                    return str;
                };
                List<AttendanceStats> stats = new List<AttendanceStats>();
                    var query = (from match in db.Attendances
                                           join mem in db.Members on match.MemberID equals mem.MemberID
                                           where mem.BranchID == brn.BranchID
                                           where match.ActivityName == "Sunday service"
                                           group match by match.AttendanceDate into newgroup
                                           orderby newgroup.Key
                                           select new AttendanceStats
                                           {
                                               BranchName = brn.BranchName,
                                               Date = newgroup.Key,
                                               Count = newgroup.Count(),
                                               ServiceName = "Sunday service"
                                           }).AsEnumerable();
                foreach (var item in query)
                {
                    if (item.Count > 1) { 
                    stats.Add(new AttendanceStats() {
                        BranchName = item.BranchName,
                        DateFormatted = item.Date.ToString().Substring(0,10),
                        Count = item.Count,
                        ServiceName = item.ServiceName


                    });
                }}

            message = sz.Serialize(stats);
                }
                catch (Exception ex)
                {

                    //throw;
                }


        }
        catch (Exception)
        {


        }
        return message;


    }

    protected void ButtonAttendace_Click(object sender, EventArgs e)
    {
        //string message = serverBranchName.Value;
        //get attendance record and upload
        //
        //HtmlTable table = new HtmlTable() { };
        //HtmlTableRow row = new HtmlTableRow();
        //HtmlTableCell cell = new HtmlTableCell() { InnerText = "FirstName" };
        //HtmlTableCell cell1 = new HtmlTableCell() { InnerText = "LastName" };
        //HtmlTableCell cell2 = new HtmlTableCell() { InnerText = "Date of birth" };
        //row.Cells.Add(cell); row.Cells.Add(cell1); row.Cells.Add(cell2);
        //cell.Attributes.Add("onclick", "alert('hi')");
        //table.Controls.Add(row);
        //servercustomCharts.Controls.Add(table);
        //servercustomCharts.Controls.Clear();
        foreach (Branch brn in db.Branches.Select(i => i))
        {
            try
            {

                //int branchid = Convert.ToInt32(serverBranchName.Value);
                Chart ch = new Chart() { Width = 1200, Height = 500 };
                ch.Titles.Add(new Title(brn.Name + " attendance profile ") { Font = new System.Drawing.Font("Calibri", 14) });
                ch.ChartAreas.Add(new ChartArea());
                ch.ChartAreas[0].AxisX.Title = "Date";
                ch.ChartAreas[0].AxisY.Title = "Count of attendees";
                ch.ChartAreas[0].Axes[0].Interval = 10;
                ch.ChartAreas[0].BackHatchStyle = ChartHatchStyle.None;
                //ch.ChartAreas[0].Axes[0].Interval = 1;
                Series column = new Series() { ChartType = SeriesChartType.Line, BorderWidth = 4, IsValueShownAsLabel = true };
                var query = from match in db.Attendances
                            join mem in db.Members on match.MemberID equals mem.MemberID
                            where mem.BranchID == brn.ID
                            where match.ActivityName == "Sunday service"
                            group match by match.AttendanceDate into newgroup
                            orderby newgroup.Key
                            select new
                            {
                                Date = newgroup.Key,
                                Count = newgroup.Count()
                            };

                column.Points.DataBind(query, "Date", "Count", null);
                ch.Series.Add(column);
                servercustomCharts.Controls.Add(ch);
            }
            catch (Exception)
            {

                //throw;
            }
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="branchinfo"></param>
    /// <returns></returns>
    [WebMethod]
    public static string EventsReport(BranchInfo branchinfo)
    {
        string message = "failed to get events report";
        try
        {
            if (branchinfo.BranchName=="All")
            {
                var query = from match in db.Events.AsEnumerable()
                           // where match.BranchID == branchinfo.BranchID
                            group match by Convert.ToDateTime(match.EventDate).Year.ToString() + "-" + Convert.ToDateTime(match.EventDate).ToString("MMMM", CultureInfo.CreateSpecificCulture("en")) into newGroup
                            orderby newGroup.Key
                            select new
                            {
                                branchName = branchinfo.BranchName,
                                message = "success",
                                YearMonth = newGroup.Key,
                                Month = newGroup.Key.Split('-')[1],
                                Year = newGroup.Key.Split('-')[0],
                                EventTypeAgg = from agg in newGroup
                                               group agg by agg.Name into subgroup
                                               select new
                                               {
                                                   Name = subgroup.Key,
                                                   Count = subgroup.Count()
                                               },
                                EventsCount = newGroup.Count()


                            };
                message = sz.Serialize(query);
            }
            else {
                GregorianCalendar cl = new GregorianCalendar();
                Func<string, DateTime> func = (d) =>
                 {
                     string year = d.Split('/')[2];
                     string month = d.Substring(3, 2);
                     string day = d.Substring(0, 2);
                     DateTime dt = Convert.ToDateTime(year+"/"+month+"/"+day);
                     return dt;
                 };  
            var query = from match in db.Events.AsEnumerable()
                        where match.BranchID==branchinfo.BranchID
                        group match by func(match.EventDate).Year.ToString() +"-"+ func(match.EventDate).ToString("MMMM", CultureInfo.CreateSpecificCulture("en")) into newGroup
                        //group match by match.EventDate into newGroup
                        orderby newGroup.Key
                        select new
                        {
                            branchName=branchinfo.BranchName,
                            message="success",
                            YearMonth=newGroup.Key,
                            Month= newGroup.Key.Split('-')[1],
                            Year = newGroup.Key.Split('-')[0],
                            EventTypeAgg =from agg in newGroup 
                                      group agg by agg.Name into subgroup
                                      select new {
                                          Name=subgroup.Key,
                                          Count=subgroup.Count()
                                      },
                            EventsCount= newGroup.Count()


                        };
                 message = "about to serialize result";
                message = sz.Serialize(query);
            };
        }
        catch (Exception ex)
        {
            message = ex.Message;
            //throw;
        }
        
        return message;
    }


}

//public class BranchInfo
//{
//    public string BranchName { get; set; }
//    public int BranchID { get; set; }
//}

public class AttendanceAggregate
{
    public AttendanceAggregate()
    {
    }

    public string BranchName { get; set; }
   
    public int Count { get; set; }
    public string ServiceName { get; set; }
    public DateTime Date { get; internal set; }
}

public class AttendanceStats
{
    public string BranchName { get; set; }
    public DateTime Date { get; set; }
    public int Count { get; set; }
    public string ServiceName { get; set; }
    public string DateFormatted { get; internal set; }
}