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

public partial class GivingClass : System.Web.UI.Page
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
    public static string GetMembers(string branchName)
    {
        string message = "failed getting membership list ";
        try
        {

        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string UpdateGiftAid(GiftAidUser user)
    {
        string message = "Failed updating data";
        try
        {
            if (string.IsNullOrEmpty(user.GIftAidId)) throw new Exception("Member ID cannot be null or empty");


            GiftAid entity = db.GiftAids.Find((user.MemberID));
            entity.NINumber = user.NINumber;
            entity.DateRegistered = user.DateRegistered;
            entity.GIftAidId = user.GIftAidId;


            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();

            message = "update successful";
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddGiftAid(GiftAidUser user)
    {
        string message = "Failed updating data";
        try
        {
            Func<string, string> TwoDigitDay = (day) => { return day.Length == 1 ? "0" + day : day; };
            if (string.IsNullOrEmpty(user.GIftAidId)) throw new Exception("Member ID cannot be null or empty");


            //check if member is not already registered for gift aid
            bool isusergiftaidregistered = db.GiftAids.Where(i => i.MemberID == user.MemberID).Select(i => i).Count() > 0;
            if (isusergiftaidregistered) return "Member already registered";

            //int branchid = db.Members.Where(i => i.MemberID == user.MemberID).Select(i => i.BranchID).FirstOrDefault();


            db.GiftAids.Add(new GiftAid()
            {
                BranchID=user.BranchID,
                MemberID = user.MemberID,
                GIftAidId = user.GIftAidId,
                DateRegistered = user.DateRegistered,
                NINumber = user.NINumber,
                CreatedBy = user.CreatedBy,
                CreatedOn = int.Parse(DateTime.Now.Year.ToString() + TwoDigitDay(DateTime.Now.Month.ToString()) + TwoDigitDay(DateTime.Now.Day.ToString())),
            });

            db.SaveChanges();
            message = "update successful";
            message = sz.Serialize(new
            {

                message = message,
                givers = from mem in db.Members
                         join giftaid in db.GiftAids on mem.MemberID equals giftaid.MemberID

                         where mem.BranchID==user.BranchID
                         orderby giftaid.ID descending
                         select new
                         {
                             ID = giftaid.ID,
                             FirstName = mem.FirstName,
                             LastName = mem.LastName,
                             MemberID = mem.MemberID,
                             Amount = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.Amount) ?? 0,
                             GiftAidAmount = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.GiftAid) ?? 0,
                             GiftAidID = giftaid.GIftAidId,
                             LastUpdated = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Max(i => i.Date) ?? 00000000,
                             CreatedOn=giftaid.CreatedOn,
                             CreatedBy=giftaid.CreatedBy,
                         }

            });

        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string DeleteGiftAid(GiftAidUser user)
    {
        string message = "Failed updating data";
        try
        {
            if (string.IsNullOrEmpty(user.GIftAidId)) throw new Exception("Member ID cannot be null or empty");
            Giving entity = db.Givings.Find(user.MemberID);
            db.Givings.Remove(entity);
            db.SaveChanges();

            message = "success";
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetGiftAiders(int userid)
    {
        string message = "failed getting gift aiders";
        try
        {
            //int branchid = db.Members.Where(i => i.MemberID == user.MemberID).Select(i => i.BranchID).FirstOrDefault();

            message = sz.Serialize(new
            {

                message = message,
                givers = from mem in db.Members
                         where mem.BranchID == userid
                         join giftaid in db.GiftAids on mem.MemberID equals giftaid.MemberID
                         orderby giftaid.ID descending
                         select new
                         {
                             ID = giftaid.ID,
                             FirstName = mem.FirstName,
                             LastName = mem.LastName,
                             MemberID = mem.MemberID,
                             Amount = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.Amount) ?? 0,
                             GiftAidAmount = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.GiftAid) ?? 0,
                             GiftAidID = giftaid.GIftAidId,
                             LastUpdated = (decimal?)db.Givings.Where(i => i.Memberid == mem.MemberID).Max(i => i.CreatedOn) ?? 00000000,
                         }

            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string AddGiving(GivingUser giver)
    {
        string message = "failed to add giving";
        try
        {
            Func<string, int> yyyymmdd = (d) =>
            {
                string yyyy = d.Split('/')[2];
                string mm = d.Split('/')[1];
                string dd = d.Split('/')[0];
                return int.Parse(yyyy + mm + dd);
            };
            Func<string, string> twodigit = (d) =>
            {

                return d.Length == 1 ? "0" + d : d;
            };
            Giving gv = new Giving();
            gv.BranchID = giver.branchID;
            gv.Amount = giver.amount;
            gv.Fund = giver.fund;
            gv.Method = giver.method;
            gv.Date = Accounts.intDate(giver.date);
            gv.GiftAid = 0.20M * giver.amount;
            gv.GIftAidId = giver.giftaidid;
            gv.Memberid = giver.memberid;
            gv.CreatedBy = giver.createdby;
            gv.CreatedOn = Accounts.TodaysDate();
            gv.Status = "Unclaimed";
            db.Givings.Add(gv);
            db.SaveChanges();

            //select and return all member givings

            var query = from match in db.Givings
                        where match.Memberid == giver.memberid
                        orderby match.ID descending
                        select match;

            message = sz.Serialize(new
            {
                message = "success",
                result = query
            });

        }
        catch (Exception ex)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(ex);
        }

        return message;
    }
    [WebMethod]
    public static string UpdateGiving(GivingUpdateUser giver)
    {
        string message = "failed to add giving";
        try
        {

            Giving gv = db.Givings.Find(giver.id);
            gv.Amount = giver.amount;
            gv.Fund = giver.fund;
            gv.Method = giver.method;
            gv.Date = Accounts.intDate(giver.date);
            gv.GiftAid = 0.20M * giver.amount;
            gv.GIftAidId = giver.giftaidid;
            gv.Memberid = giver.memberid;
            gv.CreatedBy = giver.createdby;
            gv.CreatedOn = Accounts.TodaysDate();
            gv.Status = "Unclaimed";
            //db.Givings.Add(gv);
            db.SaveChanges();
            //select and return all member givings

            var query = from match in db.Givings
                        where match.Memberid == giver.memberid
                        orderby match.ID descending
                        select match;

            message = sz.Serialize(new
            {
                message = "success",
                result = query
            });

        }
        catch (Exception ex)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(ex);
        }

        return message;
    }
    [WebMethod]
    public static string GetMemberGiving(int memberId)
    {
        string message = "failed getting member id";
        try
        {


            var query = from match in db.Givings
                        where match.Memberid == memberId
                        orderby match.ID descending
                        select new {
                            ID = match.ID,
                            Memberid = match.Memberid,
                            GIftAidId = match.GIftAidId,
                            Date = match.Date,
                            Fund = match.Fund,
                            Method = match.Method,
                            Amount = match.Amount,
                            GiftAid = match.GiftAid,
                            Status = match.Status,
                            EnvelopeCount = match.EnvelopeCount,
                            CreatedOn = match.CreatedOn,
                            CreatedBy = db.Members.Where(i => i.MemberID == match.CreatedBy).Select(i => i.LastName + " " + i.FirstName).FirstOrDefault(),

                        };

            message = sz.Serialize(new
            {
                message = "success",
                result = query
            });

        }
        catch (Exception ex)
        {

            StringBuilder sb = new StringBuilder();
            sb.Append(ex);
        }

        return message;

    }
    [WebMethod]
    public static string GetMemberAggregateGiving(int memberId)
    {
        string message = "failed getting giving aggregate";
        try
        {
            //int branchid = db.Members.Where(i => i.MemberID == user.MemberID).Select(i => i.BranchID).FirstOrDefault();

            message = sz.Serialize(new
            {

                message = message,
                givers = from mem in db.Members
                         where mem.BranchID == memberId
                         join giftaid in db.GiftAids on mem.MemberID equals giftaid.MemberID

                         select new
                         {
                             ID = giftaid.ID,
                             FirstName = mem.FirstName,
                             LastName = mem.LastName,
                             MemberID = mem.MemberID,
                             Amount = db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.Amount),
                             GiftAidAmount = db.Givings.Where(i => i.Memberid == mem.MemberID).Sum(i => i.GiftAid),
                             GiftAidID = giftaid.GIftAidId,
                             BranchNumber = 00,

                             LastUpdated = db.Givings.Where(i => i.Memberid == mem.MemberID).Max(i => i.Date)
                         }

            });
        }
        catch (Exception)
        {


        }
        return message;

    }
    [WebMethod]
    public static string Statistics(int branchid)
    {
        string message = "";
        try
        {
            var query = from match in db.Givings.AsEnumerable()
                        where match.BranchID == branchid
                        group match by new { Year = match.Date.ToString().Substring(0, 4),
                                             Month = match.Date.ToString().Substring(4, 2) } into newGroup
                        select new
                        {
                            Month = newGroup.Key.Month ,
                            Year =  newGroup.Key.Year ,
                            Amount = (decimal?)newGroup.Sum(i => i.Amount),
                            GiftAid = (decimal?)newGroup.Sum(i => i.GiftAid),

                        };

            message = sz.Serialize(new
            {
                message = "success",
                result =query.OrderByDescending(i=>i.Year).ThenBy(i=>i.Month).Select(i=>i)
            });
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;

    }

    public class GiftAidUser
    {
        public int ID { get; set; }
        public int BranchID { get; set; }
        public int MemberID { get; set; }
        public string GIftAidId { get; set; }
        public int DateRegistered { get; set; }
        public string NINumber { get; set; }
        public int CreatedOn { get; set; }
        public int CreatedBy { get; set; }
    }

    public class GivingUser
    {
        public string date { get; set; }
        public string fund { get; set; }
        public string method { get; set; }
        public decimal amount { get; set; }
        public string giftaidid { get; set; }
        public int memberid { get; set; }
        public int createdby { get; set; }
        public int branchID { get; set; }
    }
    public  class GivingUpdateUser: GivingUser
    {
        
        public int id { get; set; }
       
    }
}