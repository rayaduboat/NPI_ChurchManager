using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Census : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    protected void Page_Load(object sender, EventArgs e)
    {
        //
        try
        {
            //check if is census year and let user stay, else throw them to home page
            var query = from match in db.Dictionaries.AsEnumerable()
                        where match.PageName == "Census"
                        where match.Name == "CensusYear"
                        where match.Value == DateTime.Now.Year.ToString()
                        select new
                        {
                            CensusYear = match.Value
                        };
            
           if (query.Count() == 0)
            {
                //not a census year redirect user to login page
                Response.Redirect("../Default.aspx");
            }
        }
        catch (Exception)
        {
            
            //throw;
        }
    }
    [WebMethod]
    public static string PostRecord(string AssemblyName,
                                     string Title,
                                     string FirstName,
                                     string Surname,
                                     string MiddleName,
                                     string Telephone,
                                     string MobileNumber,
                                     string MaritalStatus,
                                     string ContactPerson,
                                     string Profession,
                                     string ActiveArea,
                                     string Occupation,
                                     string HasBornAgain,
                                     string DateBornAgain,
                                     string HasWaterBaptised,
                                     string DateWaterBaptised,
                                     string HasHolyGhostBaptised,
                                     string DateHolyGhostBaptised,
                                     string PreviousChurch,
                                     string DateFirstVisit,
                                     string ChurchContactPerson,
                                     string UrgentPrayerRequest,
                                     string PrayerRequestDetails,
                                     string DateOfBirth,
                                     string Email
        )
    {
        string message = "adding  data failed";


        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            //check if details hasn't already been entered
            string censusyear = DateTime.Now.Year.ToString();
            int isalreadyentered = (from match in db.Table_Census
                                    where match.FirstName.ToLower() == FirstName.ToLower()
                                    where match.Surname.ToLower() == Surname.ToLower()
                                    where match.Telephone.ToLower() == Telephone.ToLower()
                                    where match.CensusYear.ToLower() == censusyear.ToLower()
                                    select match).ToList().Count;
            if (isalreadyentered > 0)
            {
                message = FirstName + " " + Surname + " has already been registered for census";
                throw new Exception(message);
            }
            Table_Census mypost = new Table_Census();
            mypost.AssemblyName = AssemblyName;
            mypost.BranchID = db.Branches.Where(i => i.Name == AssemblyName).Select(i => i.ID).FirstOrDefault();
            mypost.Title = Title;
            mypost.FirstName = FirstName;
            mypost.Surname = Surname;
            mypost.MiddleName = MiddleName;
            mypost.Telephone = Telephone;
            mypost.MobileNumber = MobileNumber;
            mypost.MaritalStatus = MaritalStatus;
            mypost.ContactPerson = ContactPerson;
            mypost.Profession = Profession;
            mypost.ActiveArea = ActiveArea;
            mypost.Occupation = Occupation;
            mypost.HasBornAgain = HasBornAgain == "Yes" ? "True" : "False";
            mypost.DateBornAgain = DateBornAgain;
            mypost.HasWaterBaptised = HasWaterBaptised == "Yes" ? "True" : "False";
            mypost.DateWaterBaptised = DateWaterBaptised;
            mypost.HasHolyGhostBaptised = HasHolyGhostBaptised == "Yes" ? "True" : "False";
            mypost.DateHolyGhostBaptised = DateHolyGhostBaptised;
            mypost.PreviousChurch = PreviousChurch;
            mypost.DateFirstVisit = DateFirstVisit;
            mypost.ChurchContactPerson = ChurchContactPerson;
            mypost.UrgentPrayerRequest = UrgentPrayerRequest;
            mypost.PrayerRequestDetails = PrayerRequestDetails;
            mypost.CensusYear = DateTime.Now.Year.ToString();
            mypost.DateOfBirth = DateOfBirth;
            mypost.Email = Email;

            db.Table_Census.Add(mypost);
            db.SaveChanges();
            message = "successfully registered";
        }
        catch (Exception ex)
        {

            //throw;
        }


        return message;
    }
    [WebMethod]
    public static IQueryable<CensusRecord> GetCensusRecords(string branchName)
    {
        IQueryable<CensusRecord> message = null;
        try
        {
            string year = "2018";
            message =
                db.Table_Census.
                Where(i => i.AssemblyName == branchName && i.CensusYear == year)
                .OrderBy(i => i.Surname)
                .OrderByDescending(i => i.Id)
                .Select(i => new CensusRecord()
                {
                    LastName = i.Surname,
                    FirstName = i.FirstName,
                    Telephone = i.Telephone,
                    IsHolySpiritBaptised = i.HasHolyGhostBaptised,
                    IsBornAgain = i.HasBornAgain,
                    IsWaterBaptised = i.HasWaterBaptised
                })
                ;

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static IQueryable<CensusRecord> GetCensusRecordsByYear(string branchName,string censusYear)
    {
        IQueryable<CensusRecord> message = null;
        try
        {
            //string year = "2018";
            message =
                db.Table_Census.
                Where(i => i.AssemblyName == branchName && i.CensusYear == censusYear)
                .OrderBy(i => i.Surname)
                .OrderByDescending(i => i.Id)
                .Select(i => new CensusRecord()
                {
                    LastName = i.Surname,
                    FirstName = i.FirstName,
                    Telephone = i.Telephone,
                    IsHolySpiritBaptised = i.HasHolyGhostBaptised,
                    IsBornAgain = i.HasBornAgain,
                    IsWaterBaptised = i.HasWaterBaptised
                })
                ;

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static IQueryable<CensusStatistics> CensusStatistics(string branchName)
    {
        IQueryable<CensusStatistics> message = null; //"failed getting census statistics";
        try
        {
           // string year = "2018";
            message = from match in db.Table_Census
                      //where match.CensusYear == year
                      where match.AssemblyName == branchName
                      group match by new { match.CensusYear, match.AssemblyName } into newGroup
                      orderby newGroup.Key
                      select new CensusStatistics()
                      {
                          BranchName = newGroup.Key.AssemblyName,
                          CensusYear = newGroup.Key.CensusYear,
                          TotalRegistered = newGroup.Count(i => i.FirstName.Length > 0),
                          TotalHolySpiritBaptised = newGroup.Count(i => i.HasHolyGhostBaptised == "True"),
                          TotalWaterBaptised = newGroup.Count(i => i.HasWaterBaptised == "True"),
                          TotalBornAgain = newGroup.Count(i => i.HasBornAgain == "True")
                      }
               ;
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static IQueryable<CensusStatistics> CensusStatisticsByYear(string branchName,string censusYear)
    {
        IQueryable<CensusStatistics> message = null; //"failed getting census statistics";
        try
        {
            //string year = "2018";
            message = from match in db.Table_Census
                      where match.CensusYear == censusYear
                      where match.AssemblyName == branchName
                      group match by new { match.CensusYear, match.AssemblyName } into newGroup
                      orderby newGroup.Key
                      select new CensusStatistics()
                      {
                          BranchName = newGroup.Key.AssemblyName,
                          CensusYear = newGroup.Key.CensusYear,
                          TotalRegistered = newGroup.Count(i => i.FirstName.Length > 0),
                          TotalHolySpiritBaptised = newGroup.Count(i => i.HasHolyGhostBaptised == "True"),
                          TotalWaterBaptised = newGroup.Count(i => i.HasWaterBaptised == "True"),
                          TotalBornAgain = newGroup.Count(i => i.HasBornAgain == "True")
                      }
               ;
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string LoadCensusDataset(string branchName)
    {
        string message = "failed getting census data";
        try
        {
            if (message == "Select branch") throw new Exception("Select branch");
            message = sz.Serialize(new
            {
                CensusData = GetCensusRecords(branchName),
                CensusStatistics = CensusStatistics(branchName),
                UniqueCensusYears = db.Table_Census.Select(i => i.CensusYear).Distinct()
            });
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    
    [WebMethod]
    public static string LoadCensusDatasetByYear(string branchName, string censusYear)
    {
        string message = "failed getting census data";
        try
        {
            if (message == "Select branch") throw new Exception("Select branch");
            message = sz.Serialize(new
            {
                CensusData = GetCensusRecordsByYear(branchName, censusYear),
                CensusStatistics = CensusStatisticsByYear(branchName, censusYear),
                UniqueCensusYears = db.Table_Census.Select(i => i.CensusYear).Distinct()
            });
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }

}

public class CensusRecord
{
    public string LastName { get; set; }
    public string FirstName { get; set; }
    public string Telephone { get; set; }
    public string IsHolySpiritBaptised { get; set; }
    public string IsBornAgain { get; set; }
    public string IsWaterBaptised { get; set; }
}

public class CensusStatistics
{
    public CensusStatistics()
    {
    }

    public string BranchName { get; set; }
    public string CensusYear { get; set; }
    public int TotalRegistered { get; set; }
    public int TotalHolySpiritBaptised { get; set; }
    public int TotalWaterBaptised { get; set; }
    public int TotalBornAgain { get; set; }
}