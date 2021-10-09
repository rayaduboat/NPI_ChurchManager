using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Json;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.VisualBasic;
public partial class Minister_MembershipList : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static string message = sz.Serialize(new { message = "failed to delete member", result = new string[] { } });

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //HttpCookie cookie = new HttpCookie();

             
            ////get the logged in user
            //if (Session["User"] == null) Response.Redirect("../default.aspx");
            //JavaScriptSerializer sz = new JavaScriptSerializer();
            //var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());

        }
        catch (Exception ex)
        {


        }

    }
    protected void aLogout_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Response.Redirect("../default.aspx");
    }

    [WebMethod]
    public static object GetNextOfKin(int? id)
    {
        try
        {
           return db.NextOfKins.Where(i => i.MemberId == id).Select(i => i).ToList();
        }
        catch (Exception ex)
        {

            return null;
        }
    }
    [WebMethod]
    public static object AddNextOfKin(NextOfKin nextOfKin)
    {
        try
        {
            DistrictDBEntities entities = new DistrictDBEntities();
            nextOfKin.CreatedOn = Accounts.TodaysDate();
            entities.NextOfKins.Add(nextOfKin);
            entities.SaveChanges();

            return GetNextOfKin(nextOfKin.MemberId);
        }
        catch (Exception ex)
        {

            return null;
        }
    }
    [WebMethod]
    public static object RemoveNextOfKin(int id)
    {
        try
        {
            var nextOfKin = db.NextOfKins.FirstOrDefault(p => p.Id == id);
            db.NextOfKins.Remove(nextOfKin);
            db.SaveChanges();
            return GetNextOfKin(nextOfKin.MemberId);
        }
        catch (Exception ex)
        {

            return null;
        }
    }

    [WebMethod]
    public static string savefile()
    {
        try
        {
            var filename = HttpContext.Current.Request.Files[0];
        }
        catch (Exception)
        {


        }
        return "HELLO FROM SER";
    }
    [WebMethod]
    public static string GetMembers(string branchName)
    {
        string message = "failed getting membership list ";
        branchName = branchName.Trim();
        try
        {
            IQueryable<CappedMembers> returnValue = null;
            {
                DistrictDBEntities db = new DistrictDBEntities();
                // look for branch name 
                returnValue = from mem in db.Members
                              where mem.BranchID == db.Branches.Where(i => i.Name.ToUpper() == branchName.ToUpper()).Select(i => i.ID).FirstOrDefault()
                              where mem.MembershipType == "Member"
                              orderby mem.LastName
                              select new CappedMembers()
                              {

                                  MemberID = mem.MemberID,
                                  Title = mem.Title,
                                  Branch = branchName,
                                  FirstName = mem.FirstName,
                                  LastName = mem.LastName,
                                  AddressLineone = mem.AddressLineone,
                                  AddressLinetwo = mem.Addresslinetwo,
                                  Postcode = mem.PostCode,
                                  Town = mem.Town,
                                  Email = mem.EmailAddress,
                                  DOB = mem.DOB,
                                  Country = mem.Country,
                                  Type = mem.MembershipType,
                                  Telephone = mem.Telephone,
                                  AgeCategory = mem.AgeCategory,
                                  Comment = mem.Comment,
                                  Gender = mem.Gender,
                                  Nationality = mem.Nationality,
                                  MaritalStatus = mem.MaritalStatus,
                                  Profession = mem.Profession,
                                  Ethnicity = mem.Ethnicity

                              };


                JavaScriptSerializer sr = new JavaScriptSerializer();
                if (returnValue.Count() > 0)
                    message = sr.Serialize(returnValue);

            }
        }
        catch (Exception ex)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static object GetMemberByID(int memberID)
    {
        string message = "failed getting membership list ";
        object match11 = new object();
        try
        {
            match11 = db.Members.AsEnumerable().Where(i => i.MemberID == memberID)
                                     .Select(match => new PiwcMember()
                                     {
                                         Config = db.Configurations.Select(i => i),
                                         AssignedBranchGroups = db.BranchGroupings
                                         .Where(i => i.GroupingName == match.AssignedBranchGroups)
                                         .OrderBy(i => i.BranchName)
                                         .Select(i => new
                                         {
                                             BranchID = i.BranchID,
                                             BranchName = i.BranchName
                                         }),
                                         AreaID = match.AreaID,
                                         DistrictID = match.DistrictID,
                                         BranchID = match.BranchID,
                                         LoginType = match.LoginType,
                                         MemberID = match.MemberID,
                                         Title = match.Title,
                                         FirstName = match.FirstName,
                                         LastName = match.LastName,
                                         BranchId = match.BranchID,
                                         DOB = match.DOB,
                                         AddressLineOne = match.AddressLineone,
                                         AddressLineTwo = match.Addresslinetwo,
                                         PostCode = match.PostCode,
                                         Country = match.Country,
                                         MembershipType = match.MembershipType,
                                         Telephone = match.Telephone,
                                         PasswordDate = match.PasswordDate,
                                         EmailAddress = match.EmailAddress,
                                         BranchName = db.Branches.Where(i => i.ID == match.BranchID).Select(i => i.Name).FirstOrDefault(),
                                         Permissionset = db.LoginPermissionSets.Where(i => i.MemberID == match.MemberID).Select(i => i.PagePermission)

                                     }).FirstOrDefault();
            message = sz.Serialize(match11);
        }
        catch (Exception ex)
        {

            //throw;
        }

        return match11;
    }
    [Obsolete]
    [WebMethod]
    public static string GetNonMembers(string branchName)
    {
        string message = "failed getting membership list ";
        branchName = branchName.Trim();
        try
        {
            IQueryable<CappedMembers> returnValue = null;
            {
                DistrictDBEntities db = new DistrictDBEntities();
                // look for branch name 
                returnValue = from mem in db.Members
                              where mem.BranchID == db.Branches.Where(i => i.Name.ToUpper() == branchName.ToUpper()).Select(i => i.ID).FirstOrDefault()
                              where mem.MembershipType == "Non-member"
                              orderby mem.LastName
                              select new CappedMembers()
                              {
                                  MemberID = mem.MemberID,
                                  Title = mem.Title,
                                  Branch = branchName,
                                  FirstName = mem.FirstName,
                                  LastName = mem.LastName,
                                  AddressLineone = mem.AddressLineone,
                                  AddressLinetwo = mem.Addresslinetwo,
                                  Postcode = mem.PostCode,
                                  Town = mem.Town,
                                  Email = mem.EmailAddress,
                                  DOB = mem.DOB,
                                  Country = mem.Country,
                                  Type = mem.MembershipType,
                                  Telephone = mem.Telephone,
                                  AgeCategory = mem.AgeCategory,
                                  Comment = mem.Comment,
                                  Gender = mem.Gender,
                                  Nationality = mem.Nationality,
                                  MaritalStatus = mem.MaritalStatus,
                                  Ethnicity = mem.Ethnicity
                              };


                JavaScriptSerializer sr = new JavaScriptSerializer();
                if (returnValue.Count() > 0)
                    message = sr.Serialize(returnValue);

            }
        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string GetAllMembers(string branchName)
    {
        string message = "failed getting membership list ";
        branchName = branchName.Trim();
        try
        {
            IQueryable<CappedMembers> returnValue = null;
            {
                DistrictDBEntities db = new DistrictDBEntities();
                // look for branch name 
                returnValue = from mem in db.Members
                              where mem.BranchID == db.Branches.Where(i => i.Name.ToUpper() == branchName.ToUpper()).Select(i => i.ID).FirstOrDefault()

                              orderby mem.LastName
                              select new CappedMembers()
                              {
                                  BranchID = mem.BranchID,
                                  MemberID = mem.MemberID,
                                  Title = mem.Title,
                                  Branch = branchName,
                                  FirstName = mem.FirstName,
                                  LastName = mem.LastName,
                                  AddressLineone = mem.AddressLineone,
                                  AddressLinetwo = mem.Addresslinetwo,
                                  Postcode = mem.PostCode,
                                  Town = mem.Town,
                                  Email = mem.EmailAddress,
                                  DOB = mem.DOB,
                                  Country = mem.Country,
                                  Type = mem.MembershipType,
                                  Telephone = mem.Telephone,
                                  AgeCategory = mem.AgeCategory,
                                  Comment = mem.Comment,
                                  Gender = mem.Gender,
                                  Nationality = mem.Nationality,
                                  MaritalStatus = mem.MaritalStatus,
                                  Profession = mem.Profession
                              };


                JavaScriptSerializer sr = new JavaScriptSerializer();
                if (returnValue.Count() > 0)
                    message = sr.Serialize(returnValue);

            }
        }
        catch (Exception ex)
        {

            //throw;
        }

        return message;
    }

    [WebMethod]
    public static string GetMembersByMembershipType(int branchID, string branchName, string memtype)
    {
        string message = "failed getting membership list ";

        try
        {
            IQueryable<CappedMembers> returnValue = null;
            {
                DistrictDBEntities db = new DistrictDBEntities();
                // look for branch name 
                returnValue = from mem in db.Members
                              where mem.BranchID == branchID
                              where mem.MembershipType == memtype
                              orderby mem.LastName
                              select new CappedMembers()
                              {
                                  MemberID                                = mem.MemberID,
                                  Title                                = mem.Title,
                                  Branch                                = branchName,
                                  FirstName                                = mem.FirstName,
                                  LastName                                = mem.LastName,
                                  AddressLineone                                = mem.AddressLineone,
                                  AddressLinetwo                                = mem.Addresslinetwo,
                                  Postcode                                = mem.PostCode,
                                  Town                                = mem.Town,
                                  Email                                = mem.EmailAddress,
                                  DOB                                = mem.DOB,
                                  Country                                = mem.Country,
                                  Type                                = mem.MembershipType,
                                  Telephone                                = mem.Telephone,
                                  AgeCategory                                = mem.AgeCategory,
                                  Comment                                = mem.Comment,
                                  Gender                                = mem.Gender,
                                  Nationality                                = mem.Nationality,
                                  MaritalStatus                                = mem.MaritalStatus
                              };


                JavaScriptSerializer sr = new JavaScriptSerializer();
                if (returnValue.Count() > 0)
                    message = sr.Serialize(returnValue);

            }
        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }
    [WebMethod]
    public static string UpdateMemberDetails(string memberID, string firstName, string lastName, string telephone, string email, string membershipType)
    {
        string message = "Failed updating data";
        try
        {
            if (string.IsNullOrEmpty(memberID)) throw new Exception("Member ID cannot be null or empty");
            if (string.IsNullOrEmpty(firstName)) throw new Exception("First name not specified");
            if (string.IsNullOrEmpty(lastName)) throw new Exception("Last name not specified");
            if (string.IsNullOrEmpty(telephone)) throw new Exception("Telephone number not specified");
            if (string.IsNullOrEmpty(email)) throw new Exception("Email address not specified");
            if (string.IsNullOrEmpty(membershipType)) throw new Exception("Membership type not specified");
            DistrictDBEntities mycontext = new DistrictDBEntities();
            Member entity = mycontext.Members.Find(int.Parse(memberID));
            //Member mypost = new Member();
            entity.FirstName = firstName;
            entity.LastName = lastName;
            entity.Telephone = telephone;
            entity.EmailAddress = email;
            entity.MembershipType = membershipType;
            //'If (original IsNot Nothing) Then

            mycontext.Entry(entity).CurrentValues.SetValues(entity);
            mycontext.SaveChanges();

            message = "update successful";
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string UpdateLoginAccount(string logintype, string memberid, string password)
    {
        string message = "failed created account";
        try
        {
            if (string.IsNullOrEmpty(logintype)) throw new Exception("login type cannot be null or empty");
            if (string.IsNullOrEmpty(memberid)) throw new Exception("memberid not specified");
            if (string.IsNullOrEmpty(password)) throw new Exception("password");

            DistrictDBEntities mycontext = new DistrictDBEntities();
            Member entity = mycontext.Members.Find(int.Parse(memberid));
            //Member mypost = new Member();
            entity.Password = Accounts.Hashed.HashPassword(password);
            entity.PasswordDate = Accounts.TodaysDate();
            entity.LoginType = logintype;
            mycontext.Entry(entity).CurrentValues.SetValues(entity);
            mycontext.SaveChanges();

            message = "Created account successfully";
        }
        catch (Exception)
        {

            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string UpdateAllMemberDetails(UpdateMembershipEntry mem)
    {
        string message = "Updadting member record failed miserably";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();

            //if (db.Members.Where(i => i.EmailAddress == mem.Email && i.MemberID != mem.memberID).Select(i => i.FirstName).ToList().Count == 0)
            //{
            Member entity = db.Members.Find(mem.memberID);

            entity.Title = mem.title;
            entity.FirstName = mem.FirstName;
            entity.LastName = mem.LastName;
            entity.DOB = mem.DOB;
            entity.AddressLineone = mem.Address1;
            entity.Addresslinetwo = mem.Address2;
            entity.PostCode = mem.PostCode;
            entity.Town = mem.Town;
            entity.Country = mem.Country;
            entity.MembershipType = mem.Status;
            entity.Telephone = mem.Telephone;
            entity.EmailAddress = mem.Email;
            entity.AgeCategory = mem.AgeCategory;
            entity.Gender = mem.Gender;
            entity.Comment = mem.Comment;
            ///entity.RecordDate = DateTime.Now.ToString("yyyy-MM-dd");
            entity.MaritalStatus = mem.MaritalStatus;
            entity.Nationality = mem.Nationality;
            entity.Profession = mem.Profession;
            entity.Ethnicity = mem.Ethnicity;
            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();
            message = "updating member record was successful";
            //}
            // else
            //{
            //    message = "email address already taken";
            // }
        }
        catch (Exception ex)
        {
            message = "Adding new member failed";
            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string UpdatePersonalDetails(UpdatePersonalMembershipEntry mem)
    {
        string message = "Updadting member record failed miserably";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();


            Member entity = db.Members.Find(mem.memberID);

            entity.Title = mem.title;
            entity.FirstName = mem.FirstName;
            entity.LastName = mem.LastName;
            entity.DOB = mem.DOB;
            entity.AddressLineone = mem.Address1;
            entity.Addresslinetwo = mem.Address2;
            entity.PostCode = mem.PostCode;
            entity.Town = mem.Town;
            entity.Country = mem.Country;
            entity.MembershipType = mem.Status;
            entity.Telephone = mem.Telephone;
            entity.EmailAddress = mem.Email;
            entity.AgeCategory = mem.AgeCategory;
            entity.Gender = mem.Gender;
            entity.Comment = mem.Comment;
            //entity.RecordDate = DateTime.Now.ToString("yyyy-MM-dd");
            entity.MaritalStatus = mem.MaritalStatus;
            entity.Nationality = mem.Nationality;
            entity.Profession = mem.Profession;
            entity.Ethnicity = mem.Ethnicity;
            db.Entry(entity).CurrentValues.SetValues(entity);
            db.SaveChanges();

            //update baptism table
            //find baptism record if exist and update
            DistrictDBEntities ctx = new DistrictDBEntities();
            MemberBaptism baprecord = ctx.MemberBaptism.Where(i => i.MemberID == mem.memberID).FirstOrDefault();
            if (baprecord != null)
            {
                baprecord.BranchID = entity.BranchID;
                baprecord.IsWaterBaptised = mem.IsWaterBaptised;
                baprecord.IsHolySpiritBaptised = mem.IsHolySpiritBaptised;
                baprecord.IsCommunicant = mem.IsCommunicant;
                baprecord.IsBornagain = mem.IsBornAgain;
                baprecord.DateBornagain = mem.DateBornAgain;
                baprecord.IsNewConvertWaterBaptised = mem.IsNewConvertWaterBaptised;
                baprecord.IsOldMemberHolySpiritBaptised = mem.IsOldMemberHolySpiritBaptised;
                baprecord.RHFDate = mem.DateCommunicant;
                baprecord.DateofBaptism = mem.DateWaterBaptised;
                baprecord.HolySpiritBaptisedDate = mem.DateHolySpiritBaptised;
                baprecord.DateNewConvertWaterBaptised = mem.DateNewConvertWaterBaptised;
                baprecord.DateOldMemberHolySpiritBaptised = mem.DateOldMemberHolySpiritBaptised;
                ctx.Entry(baprecord).CurrentValues.SetValues(baprecord);
                ctx.SaveChanges();
            }
            else
            {
                MemberBaptism mbap = new MemberBaptism()
                {
                    MemberID = entity.MemberID,
                    BranchID = entity.BranchID,
                    IsWaterBaptised = mem.IsWaterBaptised,
                    IsHolySpiritBaptised = mem.IsHolySpiritBaptised,
                    IsCommunicant = mem.IsCommunicant,
                    IsBornagain = mem.IsBornAgain,
                    DateBornagain = mem.DateBornAgain,
                    IsNewConvertWaterBaptised = mem.IsNewConvertWaterBaptised,
                    IsOldMemberHolySpiritBaptised = mem.IsOldMemberHolySpiritBaptised,
                    RHFDate = mem.DateCommunicant,
                    DateofBaptism = mem.DateWaterBaptised,
                    HolySpiritBaptisedDate = mem.DateHolySpiritBaptised,
                    DateNewConvertWaterBaptised = mem.DateNewConvertWaterBaptised,
                    DateOldMemberHolySpiritBaptised = mem.DateOldMemberHolySpiritBaptised,
                };
                ctx.MemberBaptism.Add(mbap);
                ctx.SaveChanges();
            }

            message = "updating member record was successful";

        }
        catch (Exception ex)
        {
            message = "Adding new member failed";
            // throw;
        }
        return message;
    }

    [WebMethod]
    public static string AddNewMember(MembershipEntry mem)
    {
        string message = "Adding member failed miserably";
        try
        {

            // check if member email address doesn't already exist
            int branchID = new DistrictDBEntities().Branches.Where(i => i.Name == mem.branchName).Select(i => i.ID).FirstOrDefault();
            DistrictDBEntities db = new DistrictDBEntities();
            if (mem.Email == "") mem.Email = "Noemail@" + Guid.NewGuid().ToString();
            // check if member email address doesn't already exist

            if (mem.AgeCategory == "Select age category") mem.AgeCategory = "";
            if (mem.title == "Select title") mem.title = "";
            if (mem.Country == "Select country") mem.Country = "";
            if (mem.Nationality == "Select country") mem.Nationality = "";
            if (mem.Status == "Select type of membership") mem.Status = "Member";
            if (mem.Gender == "Select gender") mem.Gender = "";
            if (mem.MaritalStatus == "Select marital status") mem.MaritalStatus = "";
            //get the name of the area grouping name of area and find ID IN AREA TABLE
            //get the name of the area grouping name of District and find ID IN District TABLE
            //get the area and district ID branch
            var area_district = db.Branches.Where(i => i.ID == branchID).Select(i => i).FirstOrDefault();
            Member newmem = new Member()
            {
                AreaID = area_district != null ? area_district.AreaID : mem.AreaID,
                DistrictID = area_district != null ? area_district.DistrictID : mem.DistrictID,
                Title = mem.title,
                FirstName = mem.FirstName,
                LastName = mem.LastName,
                BranchID = branchID,
                DOB = mem.DOB,
                AddressLineone = mem.Address1,
                Addresslinetwo = mem.Address2,
                PostCode = mem.PostCode,
                Town = mem.Town,
                Country = mem.Country,
                MembershipType = mem.Status,
                Telephone = mem.Telephone,
                EmailAddress = mem.Email,
                AgeCategory = mem.AgeCategory,
                Gender = mem.Gender,
                Comment = mem.Comment,
                RecordDate = Accounts.TodaysDate().ToString(),
                Nationality = mem.Nationality,
                MaritalStatus = mem.MaritalStatus,
                Profession = mem.Profession,
                Ethnicity = mem.Ethnicity,
                CreatedBy = mem.CreatedBy,
                CreatedOn = Accounts.TodaysDate(),
            };
            db.Members.Add(newmem);
            db.SaveChanges();
            message = "Adding member was successful";

        }
        catch (Exception)
        {
            message = "Adding new member failed";
            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetMemberInfo(int ID, int branch, string tel)
    {
        JavaScriptSerializer sz = new JavaScriptSerializer();
        DistrictDBEntities db = new DistrictDBEntities();
        string message = sz.Serialize(new { message = "Invalid details", result = new string[] { } });
        try
        {
            var person = db.Members.AsEnumerable()
                .Where(i => i.MemberID == ID)
                .Where(i => i.BranchID == branch)
                .Where(i => i.Telephone == tel.ToString())
                .Select(i => new
                {
                    i.MemberID,
                    i.Title,
                    i.FirstName,
                    i.LastName,
                    i.DOB,
                    i.AddressLineone,
                    i.Addresslinetwo,
                    i.PostCode,
                    i.Town,
                    i.Country,
                    i.MembershipType,
                    i.Telephone,
                    i.EmailAddress,
                    i.AgeCategory,
                    i.Gender,
                    i.Comment,
                    i.RecordDate,
                    i.MaritalStatus,
                    i.Nationality,
                    i.Profession,
                    BapInfo = db.MemberBaptism.Where(p => p.MemberID == i.MemberID).Select(p => new
                    {
                        p.IsCommunicant,
                        p.IsHolySpiritBaptised,
                        p.IsWaterBaptised,
                        p.IsNewConvertWaterBaptised,
                        p.IsOldMemberHolySpiritBaptised,
                        p.RHFDate,
                        p.DateofBaptism,
                        p.HolySpiritBaptisedDate,
                        p.DateNewConvertWaterBaptised,
                        p.DateOldMemberHolySpiritBaptised,
                        p.IsBornagain,
                        p.DateBornagain
                    }).FirstOrDefault()

                }).FirstOrDefault();
            message = sz.Serialize(new { message = "success", result = person });
        }
        catch (Exception)
        {


        }
        return message;
    }
    protected void FileUpload1_DataBinding(object sender, EventArgs e)
    {
        try
        {
            //if bound to data save image


        }
        catch (Exception)
        {

            // throw;
        }
    }

    [WebMethod]
    public static string AddRelationship(RelationMapping relative)
    {
        string message = sz.Serialize(new { message = "failed adding relation", result = new string[] { } });
        try
        {

            MemberRelation rel = new MemberRelation()
            {
                CreatedBy = relative.createdBy,
                CreatedOn = Accounts.TodaysDate(),
                MemberRelativeID = relative.relativeID,
                RelationType = relative.relationType,
                MemberID = relative.memberID,
                BranchID = relative.branchid
            };
            db.MemberRelations.Add(rel);
            db.SaveChanges();
            message = sz.Serialize(new
            {

                message = "success",
                result = GetBranchRelationships(relative.branchid)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    /// <summary>
    /// Get all relationships in branch
    /// </summary>
    /// <param name="relative"></param>
    /// <returns></returns>
    [WebMethod]
    public static object GetBranchRelationships(int branchid)
    {
        var query = db.MemberRelations.AsEnumerable()
            .Where(i => i.BranchID == branchid)
            .Select(i => new
            {
                i.BranchID,
                i.CreatedBy,
                i.CreatedOn,
                i.MemberID,
                i.MemberRelativeID,
                i.RelationID,
                i.RelationType
            }).ToList();

        var retquery = query.Select(i => new
        {
            BranchID = i.BranchID,
            //CreatedBy = i.CreatedBy,
            CreatedOn = i.CreatedOn,
            MemberID = i.MemberID,
            MemberRelativeID = i.MemberRelativeID,
            RelationID = i.RelationID,
            RelationType = i.RelationType,
            Member = db.Members.Where(p => p.MemberID == i.MemberID).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
            IsRelatedTo = db.Members.Where(p => p.MemberID == i.MemberRelativeID).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
            As = i.RelationType,
            CreatedBy = db.Members.Where(p => p.MemberID == i.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
        });
        return retquery;
    }
    /// <summary>
    /// Get all relationships in branch
    /// </summary>
    /// <param name="relative"></param>
    /// <returns></returns>
    [WebMethod]
    public static string GetMemberRelationships(int memberID)
    {
        string message = sz.Serialize(new { message = "failed getting relationships", result = new string[] { } });
        try
        {
            var query = db.MemberRelations.AsEnumerable()
                       .Where(i => i.MemberID == memberID)
                       .Select(i => new
                       {
                           i.BranchID,
                           i.CreatedBy,
                           i.CreatedOn,
                           i.MemberID,
                           i.MemberRelativeID,
                           i.RelationID,
                           i.RelationType
                       }).ToList();

            var retquery = query.Select(i => new
            {
                BranchID = i.BranchID,
                Contact = db.Members.Where(p => p.MemberID == i.MemberRelativeID).Select(p => p.Telephone).FirstOrDefault(),
                CreatedOn = Accounts.UKdate(i.CreatedOn.ToString()),
                MemberID = i.MemberID,
                MemberRelativeID = i.MemberRelativeID,
                RelationID = i.RelationID,
                RelationType = i.RelationType,
                RelativeBranchName = db.Branches.Where(b => b.ID == (db.Members.Where(p => p.MemberID == i.MemberRelativeID).Select(p => p.BranchID).FirstOrDefault())).Select(b => b.Name).FirstOrDefault(),
                Member = db.Members.Where(p => p.MemberID == i.MemberID).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                IsRelatedTo = db.Members.Where(p => p.MemberID == i.MemberRelativeID).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
                As = i.RelationType,
                CreatedBy = db.Members.Where(p => p.MemberID == i.CreatedBy).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
            });
            message = sz.Serialize(new { message = "success", result = retquery }); ;
        }
        catch (Exception)
        {


        }

        return message;
    }
    [WebMethod]
    public static string RemoveRelationship(int relationID)
    {
        string message = sz.Serialize(new { message = "failed deleting relation", result = new string[] { } });
        try
        {
            //find relation and delete record
            MemberRelation mr = db.MemberRelations.Find(relationID);
            if (mr == null) return message;
            db.MemberRelations.Remove(mr);
            db.SaveChanges();
            message = sz.Serialize(new
            {

                message = "success",
                result = new string[] { }
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string DeleteMember(int branchid, int memberid)
    {
        string sql = "";
        string message = "failed deleting member";
        try
        {

            db.Sp_DeleteMember(memberid);
            db.SaveChanges();
            message = "Member Deleted successfully!";
        }
        catch (Exception ex)
        {

        }
        return message;
    }
    [WebMethod]
    public static string CellGroupsAddMember(CellGroupsArg cellarg)
    {
        string message = sz.Serialize(new { message = "failed adding member to cell group", result = new string[] { } });
        try
        {
            if (cellarg == null) return message;
            //create a cellgroup entity and add 
            //check if member is not already part of Group
            //
            var query = db.CellGroups.Where(i => i.MemberID == cellarg.memberID && i.Groupname == cellarg.groupname).Select(i => i).FirstOrDefault();
            if (query != null) return sz.Serialize(new { message = "Member already part of Group", result = new string[] { } });

            CellGroup cell = new CellGroup()
            {

                BranchID = cellarg.branchID,
                MemberID = cellarg.memberID,
                Role = cellarg.role,
                Location = cellarg.location,
                Groupname = cellarg.groupname,
                Meetingday = cellarg.meetingday,
                Meetingtime = cellarg.meetingtime,
                Datejoined = cellarg.datejoined,
                ActiveStatus = cellarg.activeStatus,
                CreatedBy = cellarg.createdBy,
                CreatedOn = cellarg.createdOn,
            };
            db.CellGroups.Add(cell);
            db.SaveChanges();
            message = sz.Serialize(new { message = "success", result = new string[] { } });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMemberCellGroups(int memberID)
    {
        string message = sz.Serialize(new { message = "failed to get member cell groups", result = new string[] { } });
        try
        {
            var query = db.CellGroups.Where(i => i.MemberID == memberID).
                Select(i => new
                {
                    i.ID,
                    i.MemberID,
                    i.BranchID,
                    i.Groupname,
                    i.Role,
                    i.Datejoined,
                    i.ActiveStatus,
                    i.Meetingday,
                    i.Meetingtime,
                    i.Location

                });
            message = sz.Serialize(new { message = "success", result = query });
        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string RemoveGroup(int groupID)
    {
        string message = sz.Serialize(new { message = "failed deleting group", result = new string[] { } });
        try
        {
            //find relation and delete record
            CellGroup cg = db.CellGroups.Find(groupID);
            if (cg == null) return message;
            db.CellGroups.Remove(cg);
            db.SaveChanges();
            message = sz.Serialize(new
            {

                message = "success",
                result = new string[] { }
            });
        }
        catch (Exception)
        {


        }
        return message;
    }

    [WebMethod]
    public static string AddInternalTransfer(data data)
    {

        string message = sz.Serialize(new { message = "failed getting transfers", result = new string[] { } });
        try
        {

            Transfer trs = new Transfer()
            {
                TransferDate = Accounts.intDDMMYYYY(data.transferDate),
                ToBranch = data.transferBranch,
                FromBranch = data.fromBranch,
                CreatedBy = data.createdBy,
                MemberID = data.memberID,
                CreatedOn = Accounts.TodaysDate(),
                TransferMode = "Outgoing",
                Status = "transferred",
                TransferType = data.transferType
            };
            db.Transfers.Add(trs);
            db.SaveChanges();

            //find the branchid and update membership table
            DistrictDBEntities entity = new DistrictDBEntities();
            int tobranchid = entity.Branches.Where(i => i.Name == data.transferBranch).Select(i => i.ID).FirstOrDefault();
            //find member
            var mem = entity.Members.Find(data.memberID);
            if (data.transferType == "Internal")
            {
                mem.BranchID = tobranchid;

            }
            else if (data.transferType == "External")
            {
                mem.MembershipType = "Non-member";
            }
            entity.Entry(mem).CurrentValues.SetValues(mem);
            entity.SaveChanges();

            message = sz.Serialize(new
            {

                message = "success",
                result = GetMemberTransfers(data.memberID)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMemberTransfers(int memberID)
    {

        string message = sz.Serialize(new { message = "failed getting transfers", result = new string[] { } });
        try
        {


            message = sz.Serialize(new
            {
                message = "success",
                result = db.MemberTransfers.
                Where(i => i.MemberID == memberID)
                .Select(i => new
                {
                    AreaName = db.Areas.Where(p => p.ID == i.AreaID).Select(p => p.Name).FirstOrDefault(),
                    DistrictName = db.Districts.Where(p => p.ID == i.DistrictID).Select(p => p.Name).FirstOrDefault(),
                    FromBranch = db.Branches.Where(p => p.ID == i.FromBranch).Select(p => p.Name).FirstOrDefault(),
                    ToBranch = db.Branches.Where(p => p.ID == i.ToBranch).Select(p => p.Name).FirstOrDefault(),
                    TransferDate = i.TransferDate,
                    CreatedBy = i.CreatedBy,
                    CreatedOn = i.CreatedOn,
                })

            });

        }
        catch (Exception)
        {


        }
        return message;
    }

    [WebMethod]
    public static string AddNewTransfer(TransferClass transfer)
    {
        string message = sz.Serialize(new { message = "failed" });
        try
        {

            db.MemberTransfers.Add(new MemberTransfer()
            {
                AreaID = transfer.areaID,
                DistrictID = transfer.distID,
                ToBranch = transfer.toBranch,
                FromBranch = transfer.fromBranch,
                TransferType = transfer.transferType,
                TransferDate = transfer.transferDate,
                MemberID = transfer.memberID,
                CreatedBy = transfer.createdBy,
                CreatedOn = transfer.createdOn,
            });
            db.SaveChanges();
            //find the branchid and update membership table
            DistrictDBEntities entity = new DistrictDBEntities();
            //find member
            var mem = entity.Members.Find(transfer.memberID);
            mem.BranchID = transfer.toBranch;
            mem.AreaID = transfer.areaID;
            mem.DistrictID = transfer.distID;

            entity.Entry(mem).CurrentValues.SetValues(mem);
            entity.SaveChanges();

            message = sz.Serialize(new
            {
                message = "success",
                result = db.MemberTransfers.
                Where(i => i.MemberID == transfer.memberID)
                .Select(i => new
                {
                    AreaName = db.Areas.Where(p => p.ID == transfer.areaID).Select(p => p.Name).FirstOrDefault(),
                    DistrictName = db.Districts.Where(p => p.ID == transfer.distID).Select(p => p.Name).FirstOrDefault(),
                    FromBranch = db.Branches.Where(p => p.ID == transfer.fromBranch).Select(p => p.Name).FirstOrDefault(),
                    ToBranch = db.Branches.Where(p => p.ID == transfer.toBranch).Select(p => p.Name).FirstOrDefault(),
                    TransferDate = i.TransferDate,
                    CreatedBy = i.CreatedBy,
                    CreatedOn = i.CreatedOn,
                })

            });

        }
        catch (Exception ex)
        {


        }
        return message;
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="branchid"></param>
    /// <returns></returns>
    [WebMethod]
    public static string GetMembersCelebratingTheirBirthdayThisMonth(int branchid)
    {
        string message = sz.Serialize(new { message = "failed getting birthdays", });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                result = db.sp_BranchBirthdays(branchid)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public  static object GetAttendanceHistory(int memberID)
    {
        object stats = new object();
        try
        {
              stats = db.sp_AttendanceHistory(memberID).ToList();

        }
        catch (Exception ex)
        {
            return ex.Message;
            
        }
        return stats;
    }
    [WebMethod]
    public static object GetContributionHistory(int memberID)
    {
        object stats = new object();
        try
        {
            stats = db.sp_GivingHistory(memberID).ToList();

        }
        catch (Exception ex)
        {
            return ex.Message;

        }
        return stats;
    }
    [WebMethod]
    public static object GetAppointmentHistory(int memberID)
    {
        object stats = new object();
        try
        {
            stats = db.sp_GetAppointmentHistory(memberID);

        }
        catch (Exception ex)
        {
            return ex.Message;

        }
        return stats;
    }


    protected void buttonImport_Click(object sender, EventArgs e)
    {
        try
        {

             //string serverpath = ;
            string path = Server.MapPath("~/ClientTemplate//" +Guid.NewGuid()+ fileUpload.FileName);

            string filename = Path.GetFileName(fileUpload.PostedFile.FileName);
            if (string.IsNullOrEmpty(filename) || string.IsNullOrWhiteSpace(filename))
            {
                return;
            }

            string csv = new string(filename.Reverse().Take(4).ToArray());
            if (csv != "vsc.")
            {
                string errorMessage = "Invalid file format supplied, expected a Comma Seperated Variable (*.csv) file.\n";
                errorMessage += "Download a copy of template and populate fields and then";
                errorMessage += "upload data";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + errorMessage + "')", true);

                return;
            }

            fileUpload.SaveAs(path);
           
            //open file
            int branchID = int.Parse(HiddenFieldBranchID.Value);
            //Get area ID OF BRANCH
            int? areaID = db.Branches.Where(i => i.ID == branchID).Select(i => i.AreaID).FirstOrDefault();
            int createdBy= int.Parse(HiddenFieldCreatedBy.Value);
            int intcounter = 0;

            using (StreamReader sr = new StreamReader(path))
            {
                while (!sr.EndOfStream)
                {
                    //skip data header
                    if (intcounter>1)
                    {
                        string line = sr.ReadLine();
                        //string line by tab
                        string[] parts = line.Split(',');
                        Member member = new Member()
                        {
                            AreaID = areaID,
                            BranchID = branchID,
                            FirstName = parts[0],
                            LastName = parts[1],
                            MembershipType="Member",
                            CreatedOn=Accounts.TodaysDate(),
                            CreatedBy=createdBy
                            
                        };
                        db.Members.Add(member);
                        db.SaveChanges();
                    }
                    intcounter++;

                }
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('" + ex.Message + "')", true);


        }
    }

}
public class TransferClass
{
    public int areaID { get; set; }
    public int distID { get; set; }
    public int toBranch { get; set; }
    public int fromBranch { get; set; }
    public string transferType { get; set; }
    public string transferDate { get; set; }
    public int memberID { get; set; }
    public int createdBy { get; set; }
    public int createdOn { get; set; }
}
public class data
{
    public int createdBy { get; set; }
    public int createdOn { get; set; }
    public string fromBranch { get; set; }
    public int memberID { get; set; }
    public string toBranch { get; set; }
    public string transferBranch { get; set; }
    public string transferDate { get; set; }
    public string transferType { get; set; }
}
public class RelationMapping
{
    public int branchid { get; set; }
    public int memberID { get; set; }
    public int relativeID { get; set; }
    public string relationType { get; set; }
    public int createdBy { get; set; }
    public int createdOn { get; set; }
}

public class UpdatePersonalMembershipEntry : MembershipEntry
{
    public int memberID { get; set; }
    public string IsCommunicant { get; set; }
    public string IsWaterBaptised { get; set; }
    public string IsHolySpiritBaptised { get; set; }
    public string IsNewConvertWaterBaptised { get; set; }
    public string IsOldMemberHolySpiritBaptised { get; set; }
    public string DateCommunicant { get; set; }
    public string DateWaterBaptised { get; set; }
    public string DateHolySpiritBaptised { get; set; }
    public string DateNewConvertWaterBaptised { get; set; }
    public string DateOldMemberHolySpiritBaptised { get; set; }
    public string DateBornAgain { get; set; }
    public string IsBornAgain { get; set; }

}
public class UpdateMembershipEntry : MembershipEntry
{
    public int memberID { get; set; }
}
public class MembershipEntry
{
    public int AreaID { get; set; }
    public int DistrictID { get; set; }
    public string title { get; set; }
    public string branchName { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Address1 { get; set; }
    public string Address2 { get; set; }
    public string PostCode { get; set; }
    public string Town { get; set; }
    public string Email { get; set; }
    public string DOB { get; set; }
    public string Country { get; set; }
    public string Status { get; set; }
    public string Telephone { get; set; }
    public string AgeCategory { get; set; }
    public string Comment { get; set; }
    public string Gender { get; set; }
    public string Nationality { get; set; }
    public string MaritalStatus { get; set; }
    public string Profession { get; set; }
    public string Ethnicity { get; set; }
    public int CreatedBy { get; set; }
}
public class CappedMembers
{
    public string FirstName { get; set; }

    public string LastName { get; set; }

    public string Telephone { get; set; }

    public string Email { get; set; }
    public string MembershipType { get; internal set; }
    public int MemberID { get; internal set; }
    public string AddressLineone { get; internal set; }
    public string Branch { get; internal set; }
    public string Title { get; internal set; }
    public string AddressLinetwo { get; internal set; }
    public string Postcode { get; internal set; }
    public string Town { get; internal set; }
    public string DOB { get; internal set; }
    public string Country { get; internal set; }
    public string Type { get; internal set; }
    public string AgeCategory { get; internal set; }
    public string Comment { get; internal set; }
    public string Gender { get; internal set; }
    public string Nationality { get; internal set; }
    public string MaritalStatus { get; internal set; }
    public string Profession { get; internal set; }
    public string Ethnicity { get; internal set; }
    public int BranchID { get; internal set; }
}
public class CellGroupsArg
{
    public int ID { get; set; }
    public int branchID { get; set; }
    public int memberID { get; set; }
    public string role { get; set; }
    public string location { get; set; }
    public string groupname { get; set; }
    public string meetingday { get; set; }
    public string meetingtime { get; set; }
    public string datejoined { get; set; }
    public string activeStatus { get; set; }
    public int createdBy { get; set; }
    public int createdOn { get; set; }
}