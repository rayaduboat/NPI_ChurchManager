using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Minister_Attendance : System.Web.UI.Page
{
    DistrictDBEntities db = new DistrictDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!this.IsPostBack)
            {
                //plot attendance
                Func<DateTime, string> shortdate = (b) => { return b.ToShortDateString(); };
                dynamic attendance=null;
                //create chart
                foreach (Branch branch in db.Branches.OrderByDescending(i=>i.ID).Select(i => i))
                {
                    #region created chart on the fly

                   
                    Chart chart = new Chart() { Width=1200, Height =500 };
                    chart.ChartAreas.Add(new ChartArea("chartarea") { Visible=true });
                    chart.ChartAreas[0].AxisX.Title = "Activity date";
                    chart.ChartAreas[0].AxisY.Title = "Count of attendees";
                    chart.Titles.Add(new Title(branch.Name + " Service attendance profile") { Font = new System.Drawing.Font("Tahoma", 18) { } });
                    Series series = new Series()
                    {
                        Name = "Attendance",
                        ChartType = SeriesChartType.Line,
                        BorderWidth = 5,
                        IsValueShownAsLabel = true,

                    };
                    chart.ChartAreas[0].AxisX.Interval = 10;
                    chart.Series.Add(series);
                    #endregion


                    #region Aggregation
                   
                  
                  var  query = from attt in db.Attendances
                              join act in db.Activities on attt.ActivityID equals act.ActivityID
                              join mem in db.Members on attt.MemberID equals mem.MemberID
                              join bran in db.Branches on mem.BranchID equals bran.ID
                              group  attt by new groupClass() { GroupedAttendance = attt ,
                                                                GroupedActivity = act ,
                                  GroupedAgeCategory = mem ,
                                  GroupedName = bran } into newgroup
                              select new
                              {
                                  //date = newgroup.Key.GroupedAttendance.AttendanceDate,                
                                  //count= newgroup.Count(),
                                  //Above35 = newgroup.Key.GroupedAgeCategory.AgeCategory.Where(i=>i=="").Count(),
                                  //branchname=bran.Name
                              };
                    //var att= from match in query
                    //         group match by match.date into agg
                    //         orderby agg.Key
                    //         select new
                    //         {
                    //             date=agg.Key,
                    //             Above35 =query.Count(i=>i.date==agg.Key)
                    //             Children_0_to_12
                    //             Teenage_13_to_19
                    //             YoungAdults_20_to_35
                    //             total
                                 
                    //            count = newgroupeddata.Key.AgeCategory.Count(),

                    //         }

                             #endregion
                    series.Points.DataBind(attendance, "date", "count", null);
                    chartholder.Controls.Add(chart);
                }
                #region build table


                foreach (var item in attendance)
                {
                    try
                    {
                        var tr = new TableRow();
                        var tddate = new TableCell() { Text         = item.date                 .ToString() };
                        var tdactivityname = new TableCell() { Text = item.activityname                    };
                        var tdage35 = new TableCell() { Text =        item.Above35              .ToString() };
                        var tdchild = new TableCell() { Text =        item.Children_0_to_12     .ToString() };
                        var tdyouth = new TableCell() { Text =        item.Teenage_13_to_19     .ToString() };
                        var tdadult = new TableCell() { Text =        item.YoungAdults_20_to_35 .ToString() };
                        var tdtotal = new TableCell() { Text =        item.total                 .ToString() };
                        tr.Cells.Add(tddate);
                        tr.Cells.Add(tdactivityname);
                        tr.Cells.Add(tdchild);
                        tr.Cells.Add(tdyouth);
                        tr.Cells.Add(tdadult);
                        tr.Cells.Add(tdage35);
                        tr.Cells.Add(tdtotal);
                        Table1.Rows.Add(tr);
                    }
                    catch (Exception ex)
                    {

                        //throw;
                    }
                }
                #endregion

            }
            //
           
        }
        catch (Exception ex)
        {

            //throw;
        }

    }
    public class groupClass
    {
        public Attendance GroupedAttendance { get; internal set; }
        public Activity GroupedActivity { get; internal set; }
        public Member GroupedAgeCategory { get; internal set; }
        public Branch GroupedName { get; internal set; }
    }
    public class aggclass
    {
        public DateTime DateAttendance { get; internal set; }
        public string ActivityName { get; internal set; }
    }
}