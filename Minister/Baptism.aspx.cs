using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Baptism : System.Web.UI.Page
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
    [WebMethod]
    public static string AddBaptism(RevisedBaptismInfo mem)
    {
        string message = "failed getting membership list ";
        try
        {

            if (mem.IsBornagain == null || mem.IsBornagain == "Select item") mem.IsBornagain = "";
            if (mem.IsWaterBaptised == null || mem.IsWaterBaptised == "Select item") mem.IsWaterBaptised = "";
            if (mem.IsHolySpiritBaptised == null || mem.IsHolySpiritBaptised == "Select item") mem.IsHolySpiritBaptised = "";
            if (mem.IsCommunicant == null || mem.IsCommunicant == "Select item") mem.IsCommunicant = "";
            if (mem.IsOldMemberHolySpiritBaptised == null || mem.IsOldMemberHolySpiritBaptised == "Select item") mem.IsOldMemberHolySpiritBaptised = "";
            if (mem.IsNewConvertWaterBaptised == null || mem.IsNewConvertWaterBaptised == "Select item") mem.IsNewConvertWaterBaptised = "";

            db.MemberBaptism.Add(new MemberBaptism()
            {
                BaptismID = mem.BaptismID,
                MemberID = mem.MemberID,
                IsBornagain = mem.IsBornagain,
                DateBornagain = mem.DateBornagain,
                IsWaterBaptised = mem.IsWaterBaptised,
                OfficiatingMinister = mem.OfficiatingMinister,
                DateofBaptism = mem.DateofBaptism,
                PlaceOfBaptism = mem.PlaceOfBaptism,
                CertificationDate = mem.CertificationDate,
                RHFDate = mem.RHFDate,
                RHFOfficer = mem.RHFOfficer,
                IsHolySpiritBaptised = mem.IsHolySpiritBaptised,
                HolySpiritBaptisedDate = mem.HolySpiritBaptisedDate,
                CreatedOn = Accounts.TodaysDate(),
                CreatedBy = mem.CreatedBy,
                BranchID = mem.BranchID,
                IsNewConvertWaterBaptised = mem.IsNewConvertWaterBaptised,
                IsOldMemberHolySpiritBaptised = mem.IsOldMemberHolySpiritBaptised,
                IsCommunicant = mem.IsCommunicant,

            });
            db.SaveChanges();
            message = GetBaptisedMembers(mem.BranchID);
        }
        catch (DbEntityValidationException e)
        {
            foreach (var eve in e.EntityValidationErrors)
            {
                //Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    //Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                    //    ve.PropertyName, ve.ErrorMessage);
                    message += ve.ErrorMessage;
                }
            }
            //throw;
        }
        catch (Exception ex)
        {
            message = ex.Message;
            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string UpdateBaptism(RevisedBaptismInfo mem)
    {
        string message = "Failed updating data";
        if (mem.IsBornagain                   ==null||mem.IsBornagain                       == "Select item") mem.IsBornagain = "";
        if (mem.IsWaterBaptised               ==null||mem.IsWaterBaptised                       == "Select item") mem.IsWaterBaptised = "";
        if (mem.IsHolySpiritBaptised          ==null||mem.IsHolySpiritBaptised                       == "Select item") mem.IsHolySpiritBaptised = "";
        if (mem.IsCommunicant                 ==null||mem.IsCommunicant                       == "Select item") mem.IsCommunicant = "";
        if (mem.IsOldMemberHolySpiritBaptised ==null||mem.IsOldMemberHolySpiritBaptised                       == "Select item") mem.IsOldMemberHolySpiritBaptised = "";
        if (mem.IsNewConvertWaterBaptised     ==null||mem.IsNewConvertWaterBaptised                       == "Select item") mem.IsNewConvertWaterBaptised = "";

        try
        {

            MemberBaptism entity = db.MemberBaptism.Find(mem.BaptismID);
            entity.MemberID = mem.MemberID;
            entity.IsBornagain = mem.IsBornagain;
            entity.DateBornagain = mem.DateBornagain;
            entity.IsWaterBaptised = mem.IsWaterBaptised;
            entity.OfficiatingMinister = mem.OfficiatingMinister;
            entity.DateofBaptism = mem.DateofBaptism;
            entity.PlaceOfBaptism = mem.PlaceOfBaptism;
            entity.CertificationDate = mem.CertificationDate;
            entity.RHFDate = mem.RHFDate;
            entity.RHFOfficer = mem.RHFOfficer;
            entity.IsHolySpiritBaptised = mem.IsHolySpiritBaptised;
            entity.HolySpiritBaptisedDate = mem.HolySpiritBaptisedDate;
            entity.CreatedOn = Accounts.TodaysDate();
            entity.CreatedBy = mem.CreatedBy;
            entity.BranchID = mem.BranchID;
            entity.IsNewConvertWaterBaptised = mem.IsNewConvertWaterBaptised;
            entity.IsOldMemberHolySpiritBaptised = mem.IsOldMemberHolySpiritBaptised;
            entity.IsCommunicant = mem.IsCommunicant;

            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();

            message = GetBaptisedMembers(mem.BranchID);
        }
        catch (DbEntityValidationException e)
        {
            foreach (var eve in e.EntityValidationErrors)
            {
                //Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                //    eve.Entry.Entity.GetType().Name, eve.Entry.State);
                foreach (var ve in eve.ValidationErrors)
                {
                    //Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                    //    ve.PropertyName, ve.ErrorMessage);
                    message += ve.ErrorMessage;
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
    public static string GetBaptisedMembers(int branchID)
    {
        // 
        string message = "Failed getting baptism record";
        try
        {
            // if (branchName == "Please select branch") return message;
            //for each member check if they are water baptised
            var baptised = db.MemberBaptism.Where(i => i.BranchID == branchID).Select(i => new
            {
                i.BaptismID                          ,
                i.MemberID                          ,
                i.IsBornagain                          ,
                i.DateBornagain                          ,
                i.IsWaterBaptised                          ,
                i.OfficiatingMinister                          ,
                i.DateofBaptism                          ,
                i.PlaceOfBaptism                          ,
                i.CertificationDate                          ,
                i.RHFDate                          ,
                i.RHFOfficer                          ,
                i.IsHolySpiritBaptised                          ,
                i.HolySpiritBaptisedDate                          ,
                i.CreatedOn                          ,
                i.CreatedBy                          ,
                i.BranchID                          ,
                i.IsNewConvertWaterBaptised                          ,
                i.IsOldMemberHolySpiritBaptised                          ,
                i.IsCommunicant                          ,

            }).ToList();
            var totalMembership = db.Members.Where(u => u.BranchID == branchID).Count();

            var query = (from match in db.Members.AsEnumerable()
                         where match.BranchID == branchID
                         orderby match.LastName
                         select new
                         {
                             BranchID                          = match.BranchID,
                             BaptismID                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.BaptismID).FirstOrDefault(),
                             MemberID                          = match.MemberID,
                             FirstName                          = match.FirstName,
                             LastName                          = match.LastName,
                             IsBornAgain                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.IsBornagain).FirstOrDefault(),
                             IsWaterBaptised                          = baptised.Where(i => i.MemberID == match.MemberID).Select(i => i.IsWaterBaptised).FirstOrDefault(),
                             IsCommunicant                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(i => i.IsCommunicant).FirstOrDefault(),
                             IsHolySpiritBaptised                          = baptised.Where(i => i.MemberID == match.MemberID).Select(i => i.IsHolySpiritBaptised).FirstOrDefault(),
                             CreatedOn                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(i => i.CreatedOn).FirstOrDefault(),
                             IsBornagain                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.IsBornagain).FirstOrDefault(),
                             DateBornagain                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.DateBornagain).FirstOrDefault(),
                             OfficiatingMinister                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.OfficiatingMinister).FirstOrDefault(),
                             DateofBaptism                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.DateofBaptism).FirstOrDefault(),
                             PlaceOfBaptism                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.PlaceOfBaptism).FirstOrDefault(),
                             CertificationDate                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.CertificationDate).FirstOrDefault(),
                             RHFDate                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.RHFDate).FirstOrDefault(),
                             RHFOfficer                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(p => p.RHFOfficer).FirstOrDefault(),
                             HolySpiritBaptisedDate                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.HolySpiritBaptisedDate).FirstOrDefault(),
                             IsNewConvertWaterBaptised                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.IsNewConvertWaterBaptised).FirstOrDefault(),
                             IsOldMemberHolySpiritBaptised                          = baptised.Where(i => i.MemberID == match.MemberID).Select(p => p.IsOldMemberHolySpiritBaptised).FirstOrDefault(),
                             CreatedBy                          = baptised.Where(i                          => i.MemberID == match.MemberID).Select(i => i.CreatedBy).FirstOrDefault(),

                         }).ToList();
            message = sz.Serialize(new
            {
                message = "success",
                result = query,
                stats = new
                {
                    TotalIsBornAgain = query.Where(p => p.IsBornAgain == "Yes").Count(),
                    TotalWaterBaptised = query.Where(p => p.IsWaterBaptised == "Yes").Count(),
                    TotalHolySpiritBaptised = query.Where(p => p.IsHolySpiritBaptised == "Yes").Count(),
                    TotalIsCommunicant = query.Where(p => p.IsCommunicant == "Yes").Count(),

                    PercentageHolySpiritBaptised = (query.Where(p => p.IsHolySpiritBaptised == "Yes").Count() / totalMembership) * 100,
                    PercentageWaterBaptised = (query.Where(p => p.IsWaterBaptised == "Yes").Count() / totalMembership) * 100,
                    PercentageBornAgain = (query.Where(p => p.IsBornAgain == "Yes").Count() / totalMembership) * 100,
                    PercentageCommunicant = (query.Where(p => p.IsCommunicant == "Yes").Count() / totalMembership) * 100,

                }
            });

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetBaptisedStatistics(BranchInfo brnInfo)
    {
        // 
        string message = "failed getting membership bastism statistics";
        try
        {

            //see how many members have been baptised

            try
            {
                //get membership and baptism information
                //int brnid = Convert.ToInt16(branchid);
                var joinquery = db.Members.Where(i => i.BranchID == brnInfo.BranchID).Select(i => i);
                var joinquerycount = db.Members.Where(i => i.BranchID == brnInfo.BranchID).Select(i => i).Count();


                var query = from newq in (from mem in joinquery

                                          join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID

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
                                BranchName = db.Branches.Select(i => i.Name).FirstOrDefault(),
                                Total = joinquery.Where(i => i.BranchID == brnInfo.BranchID).Where(i => i.MembershipType == "Member").Count(),
                                MenTotal = joinquery.Where(i => i.BranchID == brnInfo.BranchID).Where(p => p.Gender == "Male").Where(i => i.MembershipType == "Member").Count(),
                                MenWaterBaptised = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(i => i.Gender == "Male").Where(p => p.IsWaterBaptised == true).Count(),
                                MenHolySpiritBaptised = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(i => i.Gender == "Male").Where(p => p.IsHolySpiritBaptised == "Yes").Count(),
                                WomenTotal = joinquery.Where(i => i.BranchID == brnInfo.BranchID).Where(p => p.Gender == "Female").Where(i => i.MembershipType == "Member").Count(),
                                WomenWaterBaptised = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(i => i.Gender == "Female").Where(p => p.IsWaterBaptised == true).Count(),
                                WomenHolySpiritBaptised = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(i => i.Gender == "Female").Where(p => p.IsHolySpiritBaptised == "Yes").Count(),
                                WaterBaptisedTotal = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(p => p.IsWaterBaptised == true).Count(),
                                HolySpiritBaptisedTotal = newGroup.Where(i => i.BranchID == brnInfo.BranchID).Where(p => p.IsHolySpiritBaptised == "Yes").Count(),




                            };

                message = sz.Serialize(query);
            }
            catch (Exception)
            {

                //throw;
            }
            return message;
            //how many of the baptised are male and female
            //flag out those who are old enough and have not been baptised
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    public class BaptismInfo
    {
        public string memberID { get; set; }
        public string officiatingMinister { get; set; }
        public string dateOfBaptism { get; set; }
        public string baptismLocation { get; set; }
        public string certificationDate { get; set; }
        public string rhfDate { get; set; }
        public string rhfOfficer { get; set; }
        public string isHolySpiritBaptised { get; set; }
        public string holySpiritBaptisedDate { get; set; }
        public int branchid { get; set; }
        public string isnewConvertWaterBaptised { get; set; }
        public string isoldMemberHolySpiritBaptised { get; set; }
        public int createdBy { get; set; }
        //fields not yet plumbed in

    }

    protected void aLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("../default.aspx");
    }
    [WebMethod]
    public static string GetBranchBaptismStatistics(int branchid)
    {
        string message = sz.Serialize(new { message = "failed to get statistics" });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                result = new
                {
                    MaleWaterBaptised         = (from mem in db.Members
                                                where mem.Gender == "Male"
                                                where mem.BranchID == branchid
                                                where mem.MembershipType == "Member"
                                                join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                where bap.IsWaterBaptised == "Yes"
                                                select mem).Count(),
                    FemaleWaterBaptised      = (from mem in db.Members
                                                 where mem.Gender == "Female"
                                              where mem.BranchID == branchid
                                              where mem.MembershipType == "Member"
                                              join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                              
                                              where bap.IsWaterBaptised == "Yes"
                                              select mem).Count(),
                    MaleHolySpiritBaptised    = (from mem in db.Members
                                              where mem.Gender == "Male"
                                              where mem.BranchID == branchid
                                              where mem.MembershipType == "Member"
                                              join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                              where bap.IsHolySpiritBaptised == "Yes"
                                              select mem).Count(),

                  FemaleHolySpiritBaptised    = (from mem in db.Members
                                                where mem.Gender == "Female"
                                                where mem.BranchID == branchid
                                                where mem.MembershipType == "Member"
                                                join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                where bap.IsHolySpiritBaptised == "Yes"
                                                select mem).Count(),
                    MaleCommunicant               = (from mem in db.Members
                                                     where mem.Gender == "Male"
                                                     where mem.BranchID == branchid
                                                     where mem.MembershipType == "Member"
                                                     join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                     where bap.IsCommunicant == "Yes"
                                                     select mem).Count(),
                                                  
                    FemaleCommunicant               = (from mem in db.Members
                                                       where mem.Gender == "Female"
                                                       where mem.BranchID == branchid
                                                       where mem.MembershipType == "Member"
                                                       join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                       where bap.IsCommunicant == "Yes"
                                                       select mem).Count(),
                                                    
                    MaleBornAgain                            = (from mem in db.Members
                                                                         where mem.Gender == "Male"
                                                                         where mem.BranchID == branchid
                                                           where mem.MembershipType == "Member"
                                                           join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                           where bap.IsBornagain == "Yes"
                                                           select mem).Count(),

                    FemaleBornAgain                        = (from mem in db.Members
                                                              where mem.Gender == "Female"
                                                              where mem.BranchID == branchid
                                                              where mem.MembershipType == "Member"
                                                              join bap in db.MemberBaptism on mem.MemberID equals bap.MemberID
                                                              where bap.IsBornagain == "Yes"
                                                              select mem).Count(),



                }
            });
        }
        catch (Exception ex)
        {


        }
        return message;
    }
}

public class RevisedBaptismInfo
{
    public dynamic BaptismID { get; set; }
    public dynamic MemberID { get; set; }
    public dynamic IsBornagain { get; set; }
    public dynamic DateBornagain { get; set; }
    public dynamic IsWaterBaptised { get; set; }
    public dynamic OfficiatingMinister { get; set; }
    public dynamic DateofBaptism { get; set; }
    public dynamic PlaceOfBaptism { get; set; }
    public dynamic CertificationDate { get; set; }
    public dynamic RHFDate { get; set; }
    public dynamic RHFOfficer { get; set; }
    public dynamic IsHolySpiritBaptised { get; set; }
    public dynamic HolySpiritBaptisedDate { get; set; }
    public dynamic CreatedOn { get; set; }
    public dynamic CreatedBy { get; set; }
    public dynamic BranchID { get; set; }
    public dynamic IsNewConvertWaterBaptised { get; set; }
    public dynamic IsOldMemberHolySpiritBaptised { get; set; }
    public dynamic IsCommunicant { get; set; }
}