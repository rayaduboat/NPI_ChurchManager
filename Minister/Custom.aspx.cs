using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Minister_Events : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static DistrictDBEntities db = new DistrictDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //LoggedInUser user = new Utilities().GetLoggedInUser();
            ////get the logged in user
            //if (Session["User"] == null) Response.Redirect("../default.aspx");
            //JavaScriptSerializer sz = new JavaScriptSerializer();
            // user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
            ////if user is a superuser load all branches
            //// else load only their branch
            //new Utilities().FillBranches(dropdownBranches);

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
                            message = "Loaded successful"

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

    protected void textboxMembership_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    //get me membership
        //    //get the logged in user
        //    LoggedInUser user = new Utilities().GetLoggedInUser();
        //    int x = db.Branches.AsEnumerable().Where(i => i.Name == dropdownBranches.Text).Select(i => i.ID).FirstOrDefault();
        //    var querybap = db.MemberBaptism.ToList();
        //    // get all membership in branch with baptism information
        //    var query = from mem in db.Members.AsEnumerable()

        //                where mem.BranchID == x
        //                where mem.MembershipType == "Mem"
        //                orderby mem.LastName
        //                select new
        //                {
        //                    Title = mem.Title,
        //                    Fullname = mem.LastName + " " + mem.FirstName,
        //                    Gender = mem.Gender,
        //                    AgeCategory = mem.AgeCategory,
        //                    IsWaterBaptised = querybap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault(),
        //                    IsCommunicant = querybap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsCommunicant).FirstOrDefault(),
        //                    IsHolySpiritBaptised = querybap.Where(i => i.MemberID == mem.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault()

        //                };
        //    Table table = new Table(); table.CssClass = "table table-hover table-responsive";
        //    table.Attributes.Add("width", "100%");
        //    updatepanel.ContentTemplateContainer.Controls.Add(table);
        //    TableHeaderRow thead = new TableHeaderRow();
        //    thead.Cells.AddRange(new TableCell[] {
        //                         new TableCell(){Text="Title"},
        //                         new TableCell(){Text="Fullname"},
        //                         new TableCell(){Text="Gender"},
        //                         new TableCell(){Text="AgeCategory"},
        //                         new TableCell(){Text="IsWaterBaptised"},
        //                         new TableCell(){Text="IsCommunicant"},
        //                         new TableCell(){Text="IsHolySpiritBaptised"},


        //    });
        //    table.Rows.Add(thead);
        //    foreach (var item in query)
        //    {
        //        TableRow tr = new TableRow() { };
        //        tr.Cells.AddRange(new TableCell[] {
        //              new TableCell(){Text=item.Title},
        //              new TableCell(){Text=item.Fullname},
        //              new TableCell(){Text=item.Gender},
        //              new TableCell(){Text=item.AgeCategory},
        //              new TableCell(){Text=item.IsWaterBaptised},
        //              new TableCell(){Text=item.IsCommunicant},
        //              new TableCell(){Text=item.IsHolySpiritBaptised},

        //        });

        //        table.Rows.Add(tr);
        //    }
        //}
        //catch (Exception ex)
        //{


        //}
    }

    protected void textboxAttendance_Click(object sender, EventArgs e)
    {
        try
        {
            Chart ch = new Chart();
            //for every activity marked count the attendance profile
            ChartArea ca = new ChartArea() { };
            ch.ChartAreas.Add(ca);
            var q = db.Attendances
                .AsEnumerable()
                
                .Select(p => new {p.ActivityName,p.AttendanceDate,p.MemberID }).ToList();
            var query = q.GroupBy(newgroup => newgroup.ActivityName)
                        .Select(i => new {
                             ActivityName=i.Key,
                             TotalAttendance=i.Count(),
                             AttendanceByDate= from match in i
                                               group match by match.AttendanceDate into newgroup
                                               orderby newgroup.Key
                                               select new
                                               {
                                                   Date=newgroup.Key,
                                                   total=newgroup.Count()
                                               }
                        });

            ch.Series.Add(new Series() { ChartType = SeriesChartType.Line});
                                         
            ch.Series[0].Points.DataBind(query, "ActivityName", "TotalAttendance", null);
            updatepanel.ContentTemplateContainer.Controls.Add(ch);




        }
        catch (Exception ex)
        {

            //throw;
        }
    }
}