using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Attendance : System.Web.UI.Page
{
    static DistrictDBEntities db = new DistrictDBEntities();
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ////get the logged in user
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
    /// <summary>
    /// returns a json string of activity names
    /// </summary>
    /// <returns></returns>
    [WebMethod]
    public static string GetActivities()
    {
        string message = "Failed getting activities";
        try
        {
            var query = new DistrictDBEntities()
                .Activities
                .Select(i => new
                {
                    activityName = i.ActivityName,
                    ID = i.ActivityID
                }).Distinct();

            JavaScriptSerializer sz = new JavaScriptSerializer();
            message = sz.Serialize(query.OrderBy(i => i.activityName));

        }
        catch (Exception ex)
        {
            message = ex.Message;
            // throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddNewActivities(string arraystring)
    {
        string message = "Failed adding activities";
        try
        {
            string[] array = arraystring.Split(',');
            foreach (string item in array)
            {
                if (db.Activities.AsEnumerable().Where(i => i.ActivityName.ToLower() == item.ToLower()).Count() == 0)
                {
                    Activity ac = new Activity()
                    {
                        ActivityName = item.Trim(),
                        Location = "",
                        Message = "",
                        Speaker = "",
                        CreatedOn = DateTime.Now,
                        CreatedBy = "",
                    };
                    db.Activities.Add(ac);
                    db.SaveChanges();

                }
            }

        }
        catch (Exception ex)
        {
            message = ex.Message;
            // throw;
        }
        return GetActivities();
    }
    [WebMethod]
    public static string MarkAttendance(string memberID, string branchID, string activityName)
    {
        string message = "failed marking attendance";
        try
        {
            //check if attendance is not already marked for member for activity on for today
            DateTime date = DateTime.Today; //Convert.ToDateTime(DateTime.Now.ToShortDateString());
            int memid = int.Parse(memberID);
            int branchid = int.Parse(branchID);
            string branchName = new DistrictDBEntities().Branches.Where(i => i.ID == branchid).Select(i => i.Name).FirstOrDefault();
            int actid = new DistrictDBEntities().Activities.Where(i => i.ActivityName == activityName).Select(i => i.ActivityID).First();

            if (new DistrictDBEntities().Attendances
                                        .Where(i => i.MemberID == memid &&
                                               i.ActivityID == actid &&
                                               i.AttendanceDate == date)
                                        .Select(i => i).Count() > 0)
            {
                message = GetActivityAttendees(branchName, actid.ToString()); //"Attendance already marked";
                                                                              // message = GetMembersByBranch(branchName, activityName);// "Attendance marked successfully";
                                                                              //
            }
            else
            {
                DistrictDBEntities db = new DistrictDBEntities();

                db.Attendances.Add(new Attendance() { ActivityID = actid, MemberID = memid, BranchID = branchid, AttendanceDate = date, ActivityName = activityName });
                db.SaveChanges();
                message = GetActivityAttendees(branchName, actid.ToString());
                // = GetMembersByBranch(branchName, activityName);// "Attendance marked successfully";

            }
        }
        catch (Exception ex)
        {
            message = ex.Message;
            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetMembersByBranch(string branchName, string activityName)
    {
        string message = "failed getting membership list";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = db.Activities.Where(i => i.ActivityName == activityName).Select(i => i.ActivityID).FirstOrDefault();
            string date = DateTime.Today.ToShortDateString();
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = from mem in db.Members
                                  join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                  where mem.BranchID == branchID
                                  where attendees.ActivityID == actID
                                  where attendees.AttendanceDate == dateCompare
                                  select mem;

            //select  branch
            var members = from match in db.Members
                          where match.BranchID == branchID
                          select match;

            //select all members who did not attend
            var exceptMembers = Enumerable.Except(members, membersAttended);
            message = new JavaScriptSerializer().Serialize(exceptMembers
                //.Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new
                {
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    MemberID = i.MemberID,
                    BranchID = i.BranchID,

                    AgeCategory = i.AgeCategory,
                    Gender = i.Gender

                }));


        }
        catch (Exception ex)
        {

            //throw;
        }
        //try
        //{
        //    List<Member> members1 = new DistrictDBEntities().Members.Select(i => i).ToList();
        //    //DateTime t = Convert.ToDateTime(DateTime.Now.ToString("dd/MM/yyyy 00:00:00"));
        //    //MessageBox.Show(DateTime.Today.ToString());
        //    DistrictDBEntities db = new DistrictDBEntities();
        //    List<Member> onlymem = (from mem in db.Members
        //                            join att in db.Attendances on mem.MemberID equals att.MemberID
        //                            where (att.AttendanceDate  == DateTime.Today )
        //                            //where (att.ActivityName==activityName)
        //                            select mem).ToList();

        //    var res = Enumerable.Except(members1, onlymem);

        //    if (branchName == "Please select branch") throw new Exception("Please select branch");
        //    int id = new DistrictDBEntities().Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
        //    message = new JavaScriptSerializer().Serialize(res

        //        .Where(i => i.BranchID == id)
        //        .OrderBy(i => i.LastName).
        //        Select(i => new { FullName = i.LastName + " " + i.FirstName, MemberID = i.MemberID, BranchID = i.BranchID }));
        //}
        //catch (Exception ex)
        //{

        //    //throw;
        //}
        return message;
    }
    [WebMethod]
    public static string GetActivitiesDates(string activityID)
    {
        string message = "failed getting activity dates";
        try
        {

            int id = int.Parse(activityID);
            List<String> mydates = new List<string>();
            var dates = new DistrictDBEntities()
                .Attendances
                .Where(i => i.ActivityID == id)
                .OrderBy(i => i.AttendanceDate)
                .Select(i => i.AttendanceDate)
                ;
            foreach (DateTime item in dates)
            {
                if (!mydates.Contains(item.ToShortDateString())) mydates.Add(item.ToShortDateString());

            }
            message = new JavaScriptSerializer().Serialize(mydates);


        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetActivityAbsenteesDates(string branchName, string activityID, string date)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = from mem in db.Members
                                  join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                  where mem.BranchID == branchID
                                  where attendees.ActivityID == actID
                                  where attendees.AttendanceDate == dateCompare
                                  select mem;

            //select  branch
            var members = from match in db.Members
                          where match.BranchID == branchID
                          select match;

            //select members who did not attend
            var exceptMembers = Enumerable.Except(members, membersAttended);
            message = new JavaScriptSerializer().Serialize(exceptMembers
                .Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new
                {
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    Telephone = i.Telephone,
                    Email = i.EmailAddress

                }));

            //var retVal = new {Absentees= exceptMembers
            //    .Where(i => i.MembershipType == "Member")
            //    .OrderBy(i => i.LastName)
            //    .Select((i, index) => new {
            //        Index = index,
            //        FullName = i.LastName + " " + i.FirstName,
            //        Telephone = i.Telephone,
            //        Email = i.EmailAddress

            //    }),
            //    Statistics = GetActivityAbsenteesStats(branchName,activityID,date) };
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string GetActivityAttendeesAndDates(string branchName, string activityID, string date)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = (from mem in db.Members
                                   join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                   where mem.BranchID == branchID
                                   where attendees.ActivityID == actID
                                   where attendees.AttendanceDate == dateCompare
                                   select mem).AsEnumerable();

            //select  branch
            var members = from match in db.Members
                          where match.BranchID == branchID
                          select match;

            //select members who did not attend
            //var exceptMembers = Enumerable.Except(members, membersAttended);
            message = new JavaScriptSerializer().Serialize(membersAttended
                .Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new
                {
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    Telephone = i.Telephone,
                    Email = i.EmailAddress

                }));

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetActivityAbsenteesDatesStats(string branchName, string activityID, string date)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = (from mem in db.Members
                                   join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                   where mem.BranchID == branchID
                                   where attendees.ActivityID == actID
                                   where attendees.AttendanceDate == dateCompare
                                   select mem).AsEnumerable();

            //select  branch
            var members = from match in db.Members
                          where match.BranchID == branchID
                          select match;

            //select members who did not attend
            var exceptMembers = Enumerable.Except(members, membersAttended);
            var query = exceptMembers
                .Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new
                {
                    MemberID = i.MemberID,
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    Telephone = i.Telephone,
                    Email = i.EmailAddress,
                    branchID = branchID,
                    activityID = actID,
                    date = date
                });
            var stats =
                         new
                         {

                             AgeAbove35 = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Above 35"),
                             Children_0_to_12 = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Children (0-12)"),
                             Teenage_13_to_19 = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Teenage(13-19)"),
                             YoungAdult_20_to_35 = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Young Adults(20-35)"),
                             Male = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.Gender == "Male"),
                             Female = exceptMembers.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.Gender == "Female"),
                         };

            message = new JavaScriptSerializer().Serialize(new { attendees = query, stats = stats });
        }
        catch (Exception ex)
        {

            //throw;
        }



        return message;
    }


    [WebMethod]
    public static string GetActivityAttendees(string branchName, string activityID)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = DateTime.Today;
            var membersAttended = from mem in db.Members
                                  join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                  where mem.BranchID == branchID
                                  where attendees.ActivityID == actID
                                  where attendees.AttendanceDate == dateCompare
                                  orderby mem.LastName
                                  select new
                                  {
                                      attendanceID = attendees.AttendanceID,
                                      index = attendees.AttendanceID,
                                      FullName = mem.LastName + " " + mem.FirstName,
                                      Gender = mem.Gender,
                                      AgeCategory = mem.AgeCategory
                                      //Telephone = mem.Telephone,
                                      //Email = mem.EmailAddress

                                  };

            message = new JavaScriptSerializer().Serialize(
                new
                {
                    data = membersAttended.OrderByDescending(i => i.index).Select(p => new { Fullname = p.FullName, AttendanceID = p.attendanceID }),
                    Total = membersAttended.Count(),
                    Male = membersAttended.Where(i => i.Gender == "Male").Count(),
                    Female = membersAttended.Where(i => i.Gender == "Female").Count(),
                    Children = membersAttended.Where(i => i.AgeCategory == "Children (0-12)").Count(),
                    Teenage = membersAttended.Where(i => i.AgeCategory == "Teenage(13-19)").Count(),
                    YoungAdult = membersAttended.Where(i => i.AgeCategory == "Young Adults(20-35)").Count(),
                    Above35 = membersAttended.Where(i => i.AgeCategory == "Above 35").Count(),
                    Unmarked = GetMembersByBranch(branchName, activityID)

                });

        }
        catch (Exception ex)
        {


        }
        return message;
    }



    [WebMethod]
    public static string GetActivityAttendeesStats(string branchName, string activityID, string date)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = (from mem in db.Members
                                   join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                   where mem.BranchID == branchID
                                   where attendees.ActivityID == actID
                                   where attendees.AttendanceDate == dateCompare
                                   select mem).AsEnumerable();

            //select  branch
            var members = from match in db.Members
                          where match.BranchID == branchID
                          select match;

            //select members who did not attend
            //var exceptMembers = Enumerable.Except(members, membersAttended);
            var query = membersAttended
                .Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new
                {
                    MemberID = i.MemberID,
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    Telephone = i.Telephone,
                    Email = i.EmailAddress,
                    branchID = branchID,
                    activityID = actID,
                    date = date
                });
            var stats =
                         new
                         {

                             AgeAbove35 = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Above 35"),
                             Children_0_to_12 = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Children (0-12)"),
                             Teenage_13_to_19 = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Teenage(13-19)"),
                             YoungAdult_20_to_35 = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.AgeCategory == "Young Adults(20-35)"),
                             Male = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.Gender == "Male"),
                             Female = membersAttended.Count(i => i.BranchID == branchID && i.MembershipType == "Member" && i.Gender == "Female"),
                         };

            message = new JavaScriptSerializer().Serialize(new { attendees = query, stats = stats });
        }
        catch (Exception ex)
        {

            //throw;
        }



        return message;
    }

    [WebMethod]
    public static string GetAttendanceDictionary()
    {
        string message = "failed to get dictionary";
        try
        {
            message = sz.Serialize(db.Dictionaries
                .Where(i => i.Name == "ActivityName" && i.PageName == "Attendance")
                .Select(i => i.Value).Distinct());
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string AddToDictionary(string arraystring)
    {
        //string message = "failed to add to dictionary";
        //try
        //{
        //    if (string.IsNullOrEmpty(arraystring)) { message = "activity name(s) to add cannot be empty"; return message; };

        //    foreach (string item in arraystring.Split(','))
        //    {
        //        db.Dictionaries.Add(new Dictionary()
        //        {
        //            Name = "ActivityName",
        //            Value = item,
        //            PageName = "Attendance"
        //        });
        //        db.SaveChanges();
        //    }
        //    message = GetAttendanceDictionary();
        //}
        //catch (Exception)
        //{


        //}
        return AddNewActivities(arraystring);
    }
    [WebMethod]
    public static string UnmarkAttendees(int attendanceID)
    {
        string message = "failed umarking";
        try
        {
            Attendance at = db.Attendances.Find(attendanceID);
            if (at != null)
            {
                db.Attendances.Remove(at);
                db.SaveChanges();
                message = "success";
            }
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string UnmarkHistoryAttendees(int branchID, int activityID, int MemberID, string date)
    {
        string message = "failed umarking";
        try
        {
            //find id of attendance in past
            int attendanceID = db.Attendances.AsEnumerable()
                           .Where(i => i.ActivityID == activityID)
                           .Where(i => i.MemberID == MemberID)
                           .Where(i => i.AttendanceDate == Convert.ToDateTime(date))
                           .Select(i => i.AttendanceID).FirstOrDefault();
            if (attendanceID != 0)
            {
                Attendance at = db.Attendances.Find(attendanceID);
                if (at != null)
                {
                    db.Attendances.Remove(at);
                    db.SaveChanges();
                    message = "success";
                }
            }

        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string MarkHistoricAttendance(int branchID, int activityID, int MemberID, string date)
    {
        string message = "failed marking";
        try
        {
            DistrictDBEntities entity = new DistrictDBEntities();
            entity.Attendances.Add(new Attendance()
            {
                MemberID = MemberID,
                BranchID = branchID,
                ActivityID = activityID,
                AttendanceDate = Convert.ToDateTime(date),
                ActivityName = db.Activities.Where(i => i.ActivityID == activityID).Select(i => i.ActivityName).FirstOrDefault()
            });
            entity.SaveChanges();
            message = "success";
        }
        catch (Exception)
        {


        }
        return message;
    }


    [WebMethod]
    public static string GetActivityProfileStatistics(int branchID, string activityName)
    {
        string message = sz.Serialize(new { message = "failed computing statistics", result = new string[] { } });
        try
        {
            //get the  people who attended church and for activity 
            //int actID=db.Activity1.Where(i=>i.ActivityName==activityName).Select(i=>i.)
            var membersAttended = (from mem in db.Members
                                   join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                   where mem.BranchID == branchID
                                   where attendees.ActivityName == activityName

                                   select new
                                   {
                                       Date = attendees.AttendanceDate,
                                       AgeCategory = mem.AgeCategory,
                                       Gender = mem.Gender,
                                       Membership = mem.MembershipType
                                   }).ToList();
            var query = (from match in membersAttended
                         group match by match.Date into newGroup
                         orderby newGroup.Key
                         select new
                         {
                             Date = newGroup.Key.ToShortDateString(),
                             Children = newGroup.Count(i => i.AgeCategory == "Children (0-12)"),
                             Teenage = newGroup.Count(i => i.AgeCategory == "Teenage(13-19)"),
                             YoungAdult = newGroup.Count(i => i.AgeCategory == "Young Adults(20-35)"),
                             Above35 = newGroup.Count(i => i.AgeCategory == "Above 35"),
                             Total = newGroup.Count(),
                             MaleTotal = newGroup.Count(i => i.Gender == "Male  "),
                             FemaleTotal = newGroup.Count(i => i.Gender == "Female"),
                             TotalMembers = newGroup.Count(i => i.Membership == "Member"),
                             TotalNonMembers = newGroup.Count(i => i.Membership == "Non-Member")

                         }).ToList();
            //get the percentage of people who attended church
            message = sz.Serialize(new { message = "success", result = query.OrderByDescending(i => Convert.ToDateTime(i.Date)).Take(52) });

        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string RefreshStatisticAndMembers(int branchID, int activityID, string branchName, string activityName)
    {
        string message = sz.Serialize(new { message = "failed refresh", stats = new string[] { }, members = new string[] { } });
        try
        {
            if (branchName != "Master")
            {
                message = sz.Serialize(new
                {
                    message = "success",
                    stats = GetActivityAttendees(branchName, activityID.ToString()),
                    members = GetMembersByBranch(branchName, activityName)
                });
            }
            else
            {
                message = sz.Serialize(new
                {
                    message = "success",
                    stats = GetMasterActivityAttendees(branchName, activityID.ToString()),
                    members = GetMasterMembersByBranch(branchName, activityName)
                });
            }

        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string FilterStatistisBy(int branchID, int activityID, string branchName, string activityName)
    {
        string message = sz.Serialize(new { message = "failed refresh", stats = new string[] { }, members = new string[] { } });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                stats = GetActivityAttendees(branchName, activityID.ToString()),
                members = GetMembersByBranch(branchName, activityName)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMasterActivityAttendees(string branchName, string activityID)
    {
        string message = "failed getting activity dates";
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            //int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = int.Parse(activityID);
            //select members who attended
            DateTime dateCompare = DateTime.Today;
            var membersAttended = from mem in db.Members
                                  join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                  //where mem.BranchID == branchID
                                  where attendees.ActivityID == actID
                                  where attendees.AttendanceDate == dateCompare
                                  orderby mem.LastName
                                  select new
                                  {
                                      attendanceID = attendees.AttendanceID,
                                      index = attendees.AttendanceID,
                                      FullName = mem.LastName + " " + mem.FirstName,
                                      Gender = mem.Gender,
                                      AgeCategory = mem.AgeCategory,
                                      BranchName = db.Branches.Where(p => p.ID == mem.BranchID).Select(p => p.Name).FirstOrDefault(),
                                      //Email = mem.EmailAddress

                                  };

            message = new JavaScriptSerializer().Serialize(
                new
                {
                    data = membersAttended.OrderByDescending(i => i.index).Select(p => new { Fullname = p.FullName, AttendanceID = p.attendanceID, p.BranchName }),
                    Total = membersAttended.Count(),
                    Male = membersAttended.Where(i => i.Gender == "Male").Count(),
                    Female = membersAttended.Where(i => i.Gender == "Female").Count(),
                    Children = membersAttended.Where(i => i.AgeCategory == "Children (0-12)").Count(),
                    Teenage = membersAttended.Where(i => i.AgeCategory == "Teenage(13-19)").Count(),
                    YoungAdult = membersAttended.Where(i => i.AgeCategory == "Young Adults(20-35)").Count(),
                    Above35 = membersAttended.Where(i => i.AgeCategory == "Young AduAbove 35").Count(),
                    Unmarked = GetMembersByBranch(branchName, activityID)

                });

        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMasterMembersByBranch(string branchName, string activityName)
    {
        string message = "failed getting membership list";
        try
        {
            message = sz.Serialize(GetUnmarked(branchName, activityName));

        }
        catch (Exception ex)
        {


        }

        return message;
    }

    private static IEnumerable<SelectedMembers> GetUnmarked(string branchName, string activityName)
    {
        IEnumerable<SelectedMembers> message = new List<SelectedMembers>();
        try
        {
            DistrictDBEntities db = new DistrictDBEntities();
            int branchID = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).FirstOrDefault();
            int actID = db.Activities.Where(i => i.ActivityName == activityName).Select(i => i.ActivityID).FirstOrDefault();
            string date = DateTime.Today.ToShortDateString();
            //select members who attended
            DateTime dateCompare = Convert.ToDateTime(date);
            var membersAttended = from mem in db.Members
                                  join attendees in db.Attendances on mem.MemberID equals attendees.MemberID
                                  //where mem.BranchID == branchID
                                  where attendees.ActivityID == actID
                                  where attendees.AttendanceDate == dateCompare
                                  select mem;

            //select  branch
            var members = from match in db.Members
                              //where match.BranchID == branchID
                          select match;

            //select all members who did not attend
            var exceptMembers = Enumerable.Except(members, membersAttended);
            message = exceptMembers
                //.Where(i => i.MembershipType == "Member")
                .OrderBy(i => i.LastName)
                .Select((i, index) => new SelectedMembers()
                {
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    MemberID = i.MemberID,
                    BranchID = i.BranchID,
                    AgeCategory = i.AgeCategory,
                    Gender = i.Gender,
                    BranchName = db.Branches.Where(p => p.ID == i.BranchID).Select(p => p.Name).FirstOrDefault(),
                });
        }
        catch (Exception)
        {


        }

        return message;
    }

    [WebMethod]
    public static string GetAttendanceStatistics(attendanceBreakdown obj)
    {
        string message = sz.Serialize(new { message = "failed miserably" });
        try
        {
            //for every branch get their total membership
            //get people who attended service
            //perform a percentage calculation
            if (obj.branchID == 1000)
            {
                #region

                var query = db.Attendances
                               .AsEnumerable()
                               .Where(i => i.ActivityName == obj.activityName)
                               .Where(i => i.AttendanceDate == Convert.ToDateTime(obj.date))
                               //.Where(i => i.BranchID == obj.branchID)
                               .GroupBy(i => i.BranchID)
                               .Select(i => new
                               {
                                   Branch = db.Branches.Where(p => p.ID == i.Key).Select(p => p.Name).FirstOrDefault(),
                                   ChildrenAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                              where mem.AgeCategory == "Children (0-12)"
                                                              join att in i on mem.MemberID equals att.MemberID
                                                              select mem).Count()
                                                                          ,
                                   YouthAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                           where mem.AgeCategory == "Teenage(13-19)"
                                                           join att in i on mem.MemberID equals att.MemberID
                                                           select mem).Count()
                                                                 ,
                                   YoungAdultAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                                where mem.AgeCategory == "Young Adults(20-35)"
                                                                join att in i on mem.MemberID equals att.MemberID
                                                                select mem).Count()
                                                                ,
                                   Abouve35AttendanceCount = (from mem in db.Members.AsEnumerable()
                                                              where mem.AgeCategory == "Above 35"
                                                              join att in i on mem.MemberID equals att.MemberID
                                                              select mem).Count()
                                                                  ,
                                   ChildrenTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Children (0-12)").Count()),
                                   YouthTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Teenage(13-19)").Count()),
                                   YoungAdultsTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Young Adults(20-35)").Count()),
                                   Above35Total = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Above 35").Count()),
                                   TotalMembership = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member").Count()),
                                   OverallPercentageAttendance = Math.Round((Convert.ToDouble(i.Count()) / Convert.ToDouble(db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member").Count())) * 100, 2),
                                   AttendanceCount = i.Count(),

                               }).ToList();

                var querypercentage = query.Select(i => new
                {
                    Branch = i.Branch,
                    result = i,
                    children = i.ChildrenTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.ChildrenAttendanceCount) / Convert.ToDouble(i.ChildrenTotal)) * 100),
                    youth = i.YouthTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.YouthAttendanceCount) / Convert.ToDouble(i.YouthTotal)) * 100),
                    youngAdult = i.YoungAdultsTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.YoungAdultAttendanceCount) / Convert.ToDouble(i.YoungAdultsTotal)) * 100),
                    Adult35 = i.Above35Total == 0 ? 0 : Math.Round((Convert.ToDouble(i.Abouve35AttendanceCount) / Convert.ToDouble(i.Above35Total)) * 100)
                }).ToList();
                message = sz.Serialize(new
                {
                    message = "failed miserably",
                    result = new
                    {
                        attendance = query,
                        percentage = querypercentage
                    }
                });
                #endregion
            }
            else
            {
                #region

                var query = db.Attendances
                    .AsEnumerable()
                    .Where(i => i.ActivityName == obj.activityName)
                    .Where(i => i.AttendanceDate == Convert.ToDateTime(obj.date))
                    .Where(i => i.BranchID == obj.branchID)
                    .GroupBy(i => i.BranchID)
                    .Select(i => new
                    {
                        Branch = db.Branches.Where(p => p.ID == i.Key).Select(p => p.Name).FirstOrDefault(),
                        ChildrenAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                   where mem.AgeCategory == "Children (0-12)"
                                                   join att in i on mem.MemberID equals att.MemberID
                                                   select mem).Count()
                                                              ,
                        YouthAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                where mem.AgeCategory == "Teenage(13-19)"
                                                join att in i on mem.MemberID equals att.MemberID
                                                select mem).Count()
                                                      ,
                        YoungAdultAttendanceCount = (from mem in db.Members.AsEnumerable()
                                                     where mem.AgeCategory == "Young Adults(20-35)"
                                                     join att in i on mem.MemberID equals att.MemberID
                                                     select mem).Count()
                                                     ,
                        Abouve35AttendanceCount = (from mem in db.Members.AsEnumerable()
                                                   where mem.AgeCategory == "Above 35"
                                                   join att in i on mem.MemberID equals att.MemberID
                                                   select mem).Count()
                                                       ,
                        ChildrenTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Children (0-12)").Count()),
                        YouthTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Teenage(13-19)").Count()),
                        YoungAdultsTotal = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Young Adults(20-35)").Count()),
                        Above35Total = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member" && p.AgeCategory == "Above 35").Count()),
                        TotalMembership = (db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member").Count()),
                        OverallPercentageAttendance = Math.Round((Convert.ToDouble(i.Count()) / Convert.ToDouble(db.Members.Where(p => p.BranchID == i.Key && p.MembershipType == "Member").Count())) * 100, 2),
                        AttendanceCount = i.Count(),

                    }).ToList();

                var querypercentage = query.Select(i => new
                {
                    Branch = i.Branch,
                    result = i,
                    children = i.ChildrenTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.ChildrenAttendanceCount) / Convert.ToDouble(i.ChildrenTotal)) * 100),
                    youth = i.YouthTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.YouthAttendanceCount) / Convert.ToDouble(i.YouthTotal)) * 100),
                    youngAdult = i.YoungAdultsTotal == 0 ? 0 : Math.Round((Convert.ToDouble(i.YoungAdultAttendanceCount) / Convert.ToDouble(i.YoungAdultsTotal)) * 100),
                    Adult35 = i.Above35Total == 0 ? 0 : Math.Round((Convert.ToDouble(i.Abouve35AttendanceCount) / Convert.ToDouble(i.Above35Total)) * 100)
                }).ToList();


                message = sz.Serialize(new
                {
                    message = "failed miserably",
                    result = new
                    {
                        attendance = query,
                        percentage = querypercentage
                    }
                });
                #endregion
            }



        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string LoadOfficers(LoadFilter[] loadFilter, string activityName, int activityID)
    {
        string message = sz.Serialize(new { message = "failed", result = new string[] { } });
        try
        {
            //get all members in branches who are officers
            //get all branch ids
            var ids = loadFilter.Select(i => i.BranchID).ToList();
           // Func<string, bool> compare = (title) => { return title.Trim()=="Elder"; };
            var members = db.Members.AsEnumerable() 
                .Where(i => ids.Contains(i.BranchID))
                //.Where(i=>i.Title.Trim()== "Elder"||i.Title.Trim() == "Deacon"||i.Title.Trim() == "Deaconess")
                .Where(p=>"Elder,Deacon,Deaconess".Contains(p.Title))
                .OrderByDescending(i=>i.LastName)
                .Select((i,index )=> new SelectedMembers()
                {
                    Index = index,
                    FullName = i.LastName + " " + i.FirstName,
                    MemberID = i.MemberID,
                    BranchID = i.BranchID,
                    AgeCategory = i.AgeCategory,
                    Gender = i.Gender,
                    BranchName = db.Branches.Where(p => p.ID == i.BranchID).Select(p => p.Name).FirstOrDefault(),
                });
            message = sz.Serialize(new
            {
                message = "success",
                stats = 0,
                members = members
            });

        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetGroupNames(LoadFilter[] loadFilter, string activityName, int activityID)
    {
        string message = sz.Serialize(new { message = "failed" });
        try
        {
            var ids = loadFilter.Select(i => i.BranchID).ToList();

            message = sz.Serialize(new
            {
                message = "success",
                result = db.CellGroups.AsEnumerable().Where(i => ids.Contains(i.BranchID))
                .Select((i, index) => new 
                {
                    i.Groupname,
                    Index = index,
                    FullName = db.Members.Where(p=>p.MemberID==i.MemberID).Select(p=> p.LastName + " " + p.FirstName).FirstOrDefault(),
                    MemberID = i.MemberID,
                    BranchID = i.BranchID,
                    AgeCategory = db.Members.Where(p => p.MemberID == i.MemberID).Select(p => p.AgeCategory).FirstOrDefault() ,
                    Gender = db.Members.Where(p => p.MemberID == i.MemberID).Select(p => p.Gender).FirstOrDefault() ,
                    BranchName = db.Branches.Where(p => p.ID == i.BranchID).Select(p => p.Name).FirstOrDefault(),
                }
                
                )

            });
        }
        catch (Exception ex)
        {


        }
        return message;
    }
}
public class attendanceBreakdown
{
    public int branchID { get; set; }
    public string activityName { get; set; }
    public string date { get; set; }
}
public class LoadFilter
{
    public int BranchID { get; set; }
    public string BranchName { get; set; }
}

public class SelectedMembers
{
    public SelectedMembers()
    {
    }

    public int Index { get; set; }
    public string FullName { get; set; }
    public int MemberID { get; set; }
    public int BranchID { get; set; }
    public string AgeCategory { get; set; }
    public string Gender { get; set; }
    public string BranchName { get; set; }
}