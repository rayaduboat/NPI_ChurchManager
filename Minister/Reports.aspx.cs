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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class PlanningClass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static object Add(ReportEntities reportEntities)
    {
        // add entities to database
        // return queried entities
        var entity = new StandardReport()
        {
            ReportingPeriod=reportEntities.ReportingPeriod,
            BranchName = reportEntities.BranchName,
            Total = reportEntities.Total,
            MenTotal = reportEntities.MenTotal,
            WomenTotal = reportEntities.WomenTotal,
            WaterBaptisedTotal = reportEntities.WaterBaptisedTotal,
            HolySpiritBaptisedTotal = reportEntities.HolySpiritBaptisedTotal,
            Age35Total = reportEntities.Age35Total,
            Children_0_to_12Total    = reportEntities.Children_0_to_12Total,
            Teenage_13_to_19Total    = reportEntities.Teenage_13_to_19Total,
            YoungAdult_20_to_35Total = reportEntities.YoungAdult_20_to_35Total,
            GhanaianMembership       = reportEntities.GhanaianMembership,
            NoOfNationalsIndigenes = reportEntities.NoOfNationalsIndigenes,
            NoOfOtherNationals = reportEntities.NoOfOtherNationals,
            Elders = reportEntities.Elders,
            Deacons = reportEntities.Deacons,
            Deaconessess = reportEntities.Deaconessess,
            ChildrenDedicated = reportEntities.ChildrenDedicated,
            AdultsSoulsWon = reportEntities.AdultsSoulsWon,
            OldMembersHolySpiritBaptised = reportEntities.OldMembersHolySpiritBaptised,
            NewConvertsWaterBaptised = reportEntities.NewConvertsWaterBaptised,
            NewConvertsHolySpiritBaptised = reportEntities.NewConvertsHolySpiritBaptised,
            TransferIn_0_to_19 = reportEntities.TransferIn_0_to_19,
            TransferIn_19_to_Above = reportEntities.TransferIn_19_to_Above,
            TransferInTotal = reportEntities.TransferInTotal,
            TransferOut_0_to_19 = reportEntities.TransferOut_0_to_19,
            TransferOut_19_to_Above = reportEntities.TransferOut_19_to_Above,
            TransferOutTotal = reportEntities.TransferOutTotal,
            BackSliderWonBack = reportEntities.BackSliderWonBack,
            BackSlidersBeingFollowed = reportEntities.BackSlidersBeingFollowed,
            NumberOfHomeCells = reportEntities.NumberOfHomeCells,
            RalliesHeld = reportEntities.RalliesHeld,
            AdultDeath = reportEntities.AdultDeath,
            Birth = reportEntities.Birth,
            DeathAdultsAndChildren = reportEntities.DeathAdultsAndChildren,
            MarriagesBlessed = reportEntities.MarriagesBlessed,
            CreatedOn=Accounts.TodaysDate(),
            ReportYear=reportEntities.ReportYear,
            CreatedBy=reportEntities.CreatedBy
        };
        DistrictDBEntities entities = new DistrictDBEntities();
        entities.StandardReports.Add(entity);
        entities.SaveChanges();
        // string query = "Select * from StandardReport where BranchName='" + reportEntities.BranchName + "'";
        var select = Get(reportEntities.BranchName);

        return select;

    }
    
    [WebMethod]
    public static object Get(int branchname)
    {
        var entities = new DistrictDBEntities();
         var select = entities.StandardReports
            .Where(i => i.BranchName == branchname)
            .OrderByDescending(i=>i.Id)
            .AsEnumerable().Select(i => new {
                
                    i.ReportingPeriod                    ,
                    i.Total                              ,
                    i.MenTotal                           ,
                    i.WomenTotal                         ,
                    i.WaterBaptisedTotal                 ,
                    i.HolySpiritBaptisedTotal            ,
                    i.Age35Total                         ,
                    i.Children_0_to_12Total              ,
                    i.Teenage_13_to_19Total              ,
                    i.YoungAdult_20_to_35Total           ,
                    i.GhanaianMembership                 ,
                    i.NoOfNationalsIndigenes             ,
                    i.NoOfOtherNationals                 ,
                    i.Elders                             ,
                    i.Deacons                            ,
                    i.Deaconessess                       ,
                    i.ChildrenDedicated                  ,
                    i.AdultsSoulsWon                     ,
                    i.OldMembersHolySpiritBaptised       ,
                    i.NewConvertsWaterBaptised           ,
                    i.NewConvertsHolySpiritBaptised      ,
                    i.TransferIn_0_to_19                 ,
                    i.TransferIn_19_to_Above             ,
                    i.TransferInTotal                    ,
                    i.TransferOut_0_to_19                ,
                    i.TransferOut_19_to_Above            ,
                    i.TransferOutTotal                   ,
                    i.BackSliderWonBack                  ,
                    i.BackSlidersBeingFollowed           ,
                    i.NumberOfHomeCells                  ,
                    i.RalliesHeld                        ,
                    i.AdultDeath                         ,
                    i.Birth                              ,
                    i.DeathAdultsAndChildren             ,
                    i.MarriagesBlessed                   ,
                    i.CreatedOn                          ,
                    i.ReportYear                         ,
                      BranchName                        =entities.Branches.Where(p=>p.ID==i.BranchName).Select(p=>p.Name).FirstOrDefault(),
                      CreatedBy                         =entities.Members.Where(p=>p.MemberID==i.CreatedBy).Select(p=>p.FirstName +" " +p.LastName).FirstOrDefault()
                

    }).ToList();

        return select;

    }

    //private void LoadPlanningTable()
    //{
    //    try
    //    {
    //        // TEL031864
    //        //create table header
    //        var table = new HtmlTable() {  };
    //        table.Rows.Add(new HtmlTableRow() {   });

    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ID" });
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="FromDate"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ToDate"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="StartTime"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="EndTime"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="ActivityName"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="Description"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="GuestSpeaker(s)"});
    //        table.Rows[0].Cells.Add(new HtmlTableCell() { InnerText="Location"});
    //        // table body
    //        //check of any planned information
    //        var countInfo = db.Plannings.Count();
    //        if (countInfo == 0) return;
    //        for (int i = 1; i < db.Plannings.Count(); i++)
    //        {
    //            try
    //            {
    //                table.Rows.Add(new HtmlTableRow() { });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText=  db.Plannings.AsEnumerable().ElementAt(i).ID.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).FromDate.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).ToDate.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).StartTime.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).EndTime.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).ActivityName.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).Description.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).GuestSpeaker.ToString() });
    //                table.Rows[i].Cells.Add(new HtmlTableCell() { InnerText = db.Plannings.AsEnumerable().ElementAt(i).Location.ToString() });


    //            }
    //            catch (Exception ex)
    //            {


    //            }
    //        }
    //        containertableAnnouncement.Controls.Clear();
    //        table.Attributes.Add("class", "table table-hover table-responsive");
    //        containertableAnnouncement.Controls.Add(table);

    //        //create table data
    //    }
    //    catch (Exception)
    //    {


    //    }
    //}

    //protected void aLogout_Click(object sender, EventArgs e)
    //{
    //    Session["user"] = null;
    //    Response.Redirect("../default.aspx");
    //}

    public class ReportEntities
    {
        public int BranchName { get; set; }
        public string Total { get; set; }
        public string MenTotal { get; set; }
        public string WomenTotal { get; set; }
        public string WaterBaptisedTotal { get; set; }
        public string HolySpiritBaptisedTotal { get; set; }
        public string Age35Total { get; set; }
        public string Children_0_to_12Total { get; set; }
        public string Teenage_13_to_19Total { get; set; }
        public string YoungAdult_20_to_35Total { get; set; }
        public string GhanaianMembership { get; set; }
        public string NoOfNationalsIndigenes { get; set; }
        public string NoOfOtherNationals { get; set; }
        //about leaders                                  {get;set;}
        public string Elders { get; set; }
        public string Deacons { get; set; }
        public string Deaconessess { get; set; }
        public string ChildrenDedicated { get; set; }
        //about souls and baptism                       {get;set;}
        public string AdultsSoulsWon { get; set; }
        public string OldMembersHolySpiritBaptised { get; set; }
        public string NewConvertsWaterBaptised { get; set; }
        public string NewConvertsHolySpiritBaptised { get; set; }
        public string TransferIn_0_to_19 { get; set; }
        public string TransferIn_19_to_Above { get; set; }
        public string TransferInTotal { get; set; }
        public string TransferOut_0_to_19 { get; set; }
        public string TransferOut_19_to_Above { get; set; }
        public string TransferOutTotal { get; set; }
        public string BackSliderWonBack { get; set; }
        public string BackSlidersBeingFollowed { get; set; }
        public string NumberOfHomeCells { get; set; }
        //About events                                   {get;set;}
        public string RalliesHeld { get; set; }
        public string AdultDeath { get; set; }
        public string Birth { get; set; }
        public string DeathAdultsAndChildren { get; set; }
        public string MarriagesBlessed { get; set; }
        public string ReportingPeriod { get; set; }
        public int ReportYear { get; set; }
        public int CreatedBy { get; set; }


    }
}