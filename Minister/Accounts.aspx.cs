using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Minister_Accounts : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static DistrictDBEntities db = new DistrictDBEntities();
    static string message = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ////get the logged in user
            //if (Session["User"] == null) Response.Redirect("../default.aspx");
            //JavaScriptSerializer sz = new JavaScriptSerializer();
            //var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
            ////Chart cht = new Chart() {  };
            //cht.ChartAreas.Add(new ChartArea() { });
            //IEnumerable match = new List<Point>(){ new Point(10,10) ,
            //    new Point(10,10),
            //    new Point(10,10),
            //    new Point(10,10),
            //    new Point(10,10),
            //};
            //Series series = new Series() { ChartType = SeriesChartType.Line  };
            //series.Points.DataBind(match, "X", "Y", null);
            //cht.Series.Add(series);
            //this.Controls.Add(cht);
            //Series lineseries = new Series() { ChartType= SeriesChartType.Line };
            //lineseries.Points.DataBind(
            //     db.AuditTrails.AsEnumerable()
            //     //.Where(i=>i.BranchID==user.BranchID)
            //     .GroupBy(i => i.DateLoggedIn)
            //     .Select(i => new
            //     {
            //         date = i.Key,
            //         count = i.Count()

            //     })

            //    , "date", "count", null);
            //chartContainer.Controls.Add(cht);

            //ChartuniqueVisitors.Series.Clear();
            //ChartuniqueVisitors.Series.Add(new Series() { ChartType = SeriesChartType.Column, BorderWidth = 5 });
            //ChartuniqueVisitors.Series[0].Points.DataBind(
            //     db.AuditTrails.AsEnumerable()
            //     //.Where(i=>i.BranchID==user.BranchID)
            //     .GroupBy(i => i.DateLoggedIn)
            //     .Select(i => new
            //     {
            //         date = i.Key,
            //         count = i.Count()

            //     })

            //    , "date", "count", null);

            //ChartfrequentVisitors.Series.Clear();
            //ChartfrequentVisitors.Series.Add(new Series() { ChartType = SeriesChartType.Column, BorderWidth = 5 });
            //ChartfrequentVisitors.Series[0].Points.DataBind(
            //     db.AuditTrails.AsEnumerable()
            //     //.Where(i=>i.BranchID==user.BranchID)
            //     .GroupBy(i => i.MemberID)
            //     .Select(i => new
            //     {
            //         date = db.Members.Where(p => p.MemberID == i.Key).Select(p => p.LastName + " " + p.FirstName).FirstOrDefault(),
            //         count = i.Count()

            //     })

            //    , "date", "count", null);

            //ChartpopularPages.Series.Clear();
            //ChartpopularPages.Series.Add(new Series() { ChartType = SeriesChartType.Column, BorderWidth = 5 });
            //ChartpopularPages.ChartAreas[0].AxisX.Interval = 1;
            //ChartpopularPages.Series[0].Points.DataBind(
            //     db.AuditTrails.AsEnumerable()
            //     //.Where(i=>i.PageVisited != "ManagementList")
            //     .GroupBy(i => i.PageVisited)
            //     .Select(i => new
            //     {
            //         page = i.Key,
            //         count = i.Count()

            //     })

            //    , "page", "count", null);


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
    public static string AddPagePermission(string pageName, string memberid, string branchid, string createdby)
    {
        string message = "failed adding page permission";
        Func<string, string> twodigitday = (d) => { return d.Length == 1 ? "0" + d : d; };
        try
        {   //check if member has not already  been given permission to page
            DistrictDBEntities db = new DistrictDBEntities();
            int brnid = int.Parse(branchid);
            int memid = int.Parse(memberid);
            var isAlreadyAuthorised = (from match in db.LoginPermissionSets
                                       where match.MemberID == memid
                                       where match.PagePermission == pageName
                                       select match).ToList();
            if (isAlreadyAuthorised.Count > 0)
            {
                message = "Member already has page permission";
                return (message);
            }

            LoginPermissionSet perm = new LoginPermissionSet();
            perm.BranchID = brnid;
            perm.PagePermission = pageName;
            perm.MemberID = int.Parse(memberid);
            perm.CreateBy = createdby;
            perm.DateCreated = int.Parse(DateTime.Now.Year.ToString() + twodigitday(DateTime.Now.Month.ToString()) + twodigitday(DateTime.Now.Day.ToString()));
            db.LoginPermissionSets.Add(perm);
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "successfully added permission",
                PagePermissions = db.LoginPermissionSets
                                        .Where(i => i.MemberID == memid)
                                        .Select(i => new
                                        {
                                            PagePermission = i.PagePermission,
                                            ID = i.ID,

                                        })
            });

        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string AddNewBranch(string name, string address, string telephone,
                                      string website, string presidingofficer,
                                      string email)
    {
        message = "Creating branch failed";
        try
        {

            // validate inputs
            //********************************************************************************************
            if (string.IsNullOrEmpty(name)) return ("Invalid name specified");
            if (string.IsNullOrEmpty(address)) return ("Invalid address");
            if (string.IsNullOrEmpty(telephone)) return ("Invalid telephone specified");
            //if (string.IsNullOrEmpty(website))          return ("Invalid name specified");
            if (string.IsNullOrEmpty(presidingofficer)) return ("Invalid name specified");
            //if (string.IsNullOrEmpty(email))            return ("Invalid name specified");
            //********************************************************************************************
            if (db.Branches.Where(i => i.Name == name).Select(i => i).Count() > 0) return "Branch name already taken";

            db.Branches.Add(new Branch()
            {
                Name = name,
                Address = address,
                Telephone = telephone,
                Website = website,
                PresidingElder = presidingofficer,
                EmailAddress = email

            });
            db.SaveChanges();
            message = "New branch created";
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }

    [WebMethod]
    public static string GetPagePermission(string memberid, string branchid)
    {
        string message = "failed adding page permission";

        try
        {   //check if member has not already  been given permission to page

            int brnid = int.Parse(branchid);
            int memid = int.Parse(memberid);

            message = sz.Serialize(new
            {
                message = "successfully added permission",
                PagePermissions = db.LoginPermissionSets
                                        .Where(i => i.MemberID == memid)
                                        .Select(i => new
                                        {
                                            PagePermission = i.PagePermission,
                                            ID = i.ID,

                                        })
            });

        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string PagePermissions()
    {
        string message = sz.Serialize(new { message = "failed getting permissions", result = new string[] { } });

        try
        {   //check if member has not already  been given permission to page




            message = sz.Serialize(new
            {
                message = "successfully added permission",
                PagePermissions = db.LoginPermissionSets

                                        .Select(i => new
                                        {
                                            i.PagePermission,
                                            i.ID,
                                            i.MemberID,
                                            i.BranchID

                                        })
            });

        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string DeletePermission(string ID)
    {
        string message = "failed deleting permission";
        try
        {
            int id = Convert.ToInt16(ID);
            LoginPermissionSet p = db.LoginPermissionSets.Find(int.Parse(ID));
            db.LoginPermissionSets.Remove(p);
            db.SaveChanges();
            message = "Permission for user deleted";
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    /// <summary>
    /// track pages user has visited
    /// </summary>
    /// <param name="memid"></param>
    /// <param name="brnchid"></param>
    /// <param name="pagevisited"></param>
    /// <returns></returns>
    [WebMethod]
    public static string AddAudit(string memid, string brnchid, string pagevisited)
    {
        message = "failed adding audit trail";
        try
        {
            Func<string, string> formatXX = (x) => { return x.Length == 1 ? "0" + x : x; };
            DateTime date = DateTime.Now;
            //int intdate = Convert.ToInt32(datevisited);
            db.AuditTrails.Add(new AuditTrail()
            {
                BranchID = Convert.ToInt32(brnchid),
                MemberID = Convert.ToInt32(memid),
                DateLoggedIn = Convert.ToInt32(date.Year.ToString() + formatXX(date.Month.ToString()) + formatXX(date.Day.ToString())),
                TimeLoggedIn = formatXX(date.Hour.ToString()) + ":" + formatXX(date.Minute.ToString()) + ":" + formatXX(date.Second.ToString()),
                PageVisited = pagevisited
            });
            db.SaveChanges();
            message = "successfully added audit";
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetAuditTrail(string branchName)
    {
        message = "failed getting audit trail";
        try
        {
            int branchid = db.Branches.Where(i => i.Name == branchName).Select(i => i.ID).First();
            message = sz.Serialize(new
            {
                message = "successfully added audit",
                audits = db.AuditTrails
                .Where(i => i.BranchID == branchid)
                .OrderByDescending(i => i.DateLoggedIn)
                .Select(i => new
                {
                    ID = i.ID,
                    BranchName = branchName,
                    MemberName = db.Members.Where(p => p.MemberID == i.MemberID).Select(p => p.LastName + " " + p.FirstName),
                    DateVisited = i.DateLoggedIn,
                    TimeLoggedIn = i.TimeLoggedIn,
                    PageVisited = i.PageVisited
                })

            });


        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string RevokeAccount(string memberid, string revokeType)
    {
        message = "failed revoking account";
        try
        {
            int id = Convert.ToInt32(memberid);
            Member mem = db.Members.Find(id);
            if (mem.LoginType == "SuperUser") return "Cant revoke a super user account";
            if (revokeType == "Delete account")
            {
                mem.Password = "Deleted";
            }
            else if (revokeType == "Temporary lock")
            {
                mem.Password = mem.Password + ":Lock";
            }
            db.SaveChanges();
            message = "account revocation applied";
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetAssignedLogins()
    {
        message = sz.Serialize(new { message = "failed revoking account", result = new string[] { } });
        try
        {
            //select all members who have login accounts
            var querylogins = db.Members.AsEnumerable().Where(i => i.Password != "" && i.Password != null).Select(i => new
            {
                BranchID = i.BranchID,
                MemberID = i.MemberID,
                FirstName = i.FirstName,
                LastName = i.LastName,
                LoginType = i.LoginType,
                Password = i.Password

            }).ToList();
            var branches = db.Branches.Select(y => y).ToList();
            var permissions = db.LoginPermissionSets.AsEnumerable().Select(y => new { MemberID = y.MemberID, PagePermission = y.PagePermission, PermissionID = y.ID }).ToList();
            //get all login accounts assigned to members with accounts
            var queryloginaccounts = querylogins.Select(i => new
            {
                BranchID = i.BranchID,
                BranchName = branches.Where(y => y.ID == i.BranchID).Select(y => y.Name).FirstOrDefault(),
                FullName = i.LastName + " " + i.FirstName,
                LoginType = i.LoginType,
                Password = i.Password,
                MemberID = i.MemberID,
                PermissionID = permissions.Where(p => p.MemberID == i.MemberID).Select(p => p.PermissionID).FirstOrDefault(),
                Attendance = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Attendance").Select(p => new { PermissionID = p.PermissionID }),
                Appointment = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Appointment").Select(p => new { PermissionID = p.PermissionID }),
                Baptism = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Baptism").Select(p => new { PermissionID = p.PermissionID }),
                Census = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Census").Select(p => new { PermissionID = p.PermissionID }),
                Events = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Events").Select(p => new { PermissionID = p.PermissionID }),
                Finances = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Finances").Select(p => new { PermissionID = p.PermissionID }),
                FollowUp = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Follow-up").Select(p => new { PermissionID = p.PermissionID }),
                GiftAid = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Gift Aid").Select(p => new { PermissionID = p.PermissionID }),
                MembershipList = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Membership List").Select(p => new { PermissionID = p.PermissionID }),
                StandardReports = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Standard Reports").Select(p => new { PermissionID = p.PermissionID }),
                WeeklyServiceReport = permissions.Where(p => p.MemberID == i.MemberID).Where(p => p.PagePermission == "Weekly service report").Select(p => new { PermissionID = p.PermissionID }),


            });

            message = sz.Serialize(new { message = "success", result = queryloginaccounts.OrderBy(p => p.BranchName) });
        }
        catch (Exception ex)
        {

            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string PersonalDataUpdateActivate()
    {
        string message = "failed to activate personal data update";
        try
        {

            // add an entry into dictionary
            var query = from match in db.Dictionaries.AsEnumerable()
                        where match.PageName == "MemberUpdate"
                        where match.Name == "PersonalDetails"
                        where match.Value == "Open"
                        select new
                        {
                            CensusYear = match.Value
                        };
            if (query.Count() > 0) { message = "Personal data update already active"; return message; }
            db.Dictionaries.Add(new Dictionary()
            {
                PageName = "MemberUpdate",
                Name = "PersonalDetails",
                Value = "Open"
            });
            db.SaveChanges();
            message = "Personal data update activated";
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Census year for year " + DateTime.Now.Year.ToString() + " is now active');", true);

        }
        catch (Exception)
        {
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true);
            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string PersonalDataUpdateDeActivate()
    {
        string message = "failed to deactivate personal data update";
        try
        {

            // add an entry into dictionary

            var id = (from match in db.Dictionaries.AsEnumerable()
                      where match.PageName == "MemberUpdate"
                      where match.Name == "PersonalDetails"
                      where match.Value == "Open"
                      select match.ID).FirstOrDefault();

            Dictionary dictionary = db.Dictionaries.Find(id);
            db.Dictionaries.Remove(dictionary);

            db.SaveChanges();

            message = "Personal data update deactivated";
        }
        catch (Exception ex)
        {

        }
        return message;
    }
    [WebMethod]
    public static string CheckPersonalDataUpdateStatus()
    {
        string message = sz.Serialize(new { message = "failure", CensusStatus = "", PersonalStatus = "" });
        try
        {

            // add an entry into dictionary
            var query = from match in db.Dictionaries.AsEnumerable()
                        where match.PageName == "MemberUpdate"
                        where match.Name == "PersonalDetails"
                        where match.Value == "Open"
                        select new
                        {
                            CensusYear = match.Value
                        };
            // add an entry into dictionary
            var query2 = from match in db.Dictionaries.AsEnumerable()
                         where match.PageName == "Census"
                         where match.Name == "CensusYear"
                         where match.Value == DateTime.Now.Year.ToString()
                         select new
                         {
                             CensusYear = match.Value
                         };
            var personalstatus = string.Empty;
            var censusstatus = string.Empty;

            if (query2.Count() > 0)
            {
                censusstatus = "active";
            }
            else
            {
                censusstatus = "inactive";
            }

            if (query.Count() > 0)
            {
                personalstatus = "active";
            }
            else
            {
                personalstatus = "inactive";
            }

            message = sz.Serialize(new { message = "success", CensusStatus = censusstatus, PersonalStatus = personalstatus });

            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('Census year for year " + DateTime.Now.Year.ToString() + " is now active');", true);

        }
        catch (Exception)
        {
            //ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('" + ex.Message + "');", true);
            //throw;
        }
        return message;
    }
    [WebMethod]
    public static string AddDictionary(string array, string name, string pageName)
    {
        string message = sz.Serialize(new { message = "failed adding dictionary", result = new string[] { } });

        try
        {
            Func<string, bool> IsAbsent = (item) =>
            {
                return db.Dictionaries.Where(i => i.PageName == pageName)
                                      .Where(i => i.Name == name)
                                      .Where(i => i.Value == item)
                                      .Count() == 0;
            };


            foreach (string item in array.Split(','))
            {
                //check if item is not already present 
                if (IsAbsent(item))
                {
                    DistrictDBEntities myentities = new DistrictDBEntities();
                    myentities.Dictionaries.Add(new Dictionary()
                    {
                        Name = name,
                        Value = item,
                        PageName = pageName
                    });

                    myentities.SaveChanges();
                }
            }
            message = sz.Serialize(new { message = "success", result = GetDictionary(pageName, name) });


        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static IEnumerable<string> GetDictionary(string pageName, string filterName)
    {
        IEnumerable<string> message = new List<string>() { };
        try
        {
            message = db.Dictionaries.AsEnumerable()
                .Where(i => i.PageName == pageName)
                .Where(i => i.Name == filterName)
                .OrderBy(i => i.Value)
                .Select(i => i.Value.Trim()).Distinct();

        }
        catch (Exception)
        {


        }
        return message;
    }

    protected void buttonUpdatePlots_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    ChartuniqueVisitors.Series.Add(new Series() { ChartType = SeriesChartType.Line, BorderWidth = 4 });
        //    ChartuniqueVisitors.Series[0].Points.DataBind(
        //         db.AuditTrails.AsEnumerable()
        //         .GroupBy(i => i.DateLoggedIn)
        //         .Select(i => new
        //         {
        //             date = i.Key,
        //             count = i.Count()

        //         })

        //        , "date", "count", null);
        //}
        //catch (Exception)
        //{


        //}


    }

    [WebMethod]
    public static string AssignBranchToMember(AssignedToBranchproperties assigned)
    {
        string message = sz.Serialize(new { message = "failed assigning branch to member", });
        try
        {
            //validate entries
            if (assigned.MemberID == null) return message;
            if (assigned.MemberBranchID == null) return message;
            if (assigned.AssignedBranchID == null) return message;
            //check if member is not is not already assigned branch
            var isassigned = db.AssignedBranches.Where(i => i.MemberID == assigned.MemberID)
                                              .Where(i => i.AssignedBranchID == assigned.AssignedBranchID)
                                              .Select(i => i).FirstOrDefault();
            if (isassigned == null)
            {
                db.AssignedBranches.Add(new AssignedBranch()
                {
                    //ID                  =assigned.ID                 ,
                    MemberID = assigned.MemberID,
                    MemberBranchID = assigned.MemberBranchID,
                    AssignedBranchID = assigned.AssignedBranchID,
                    CreatedBy = assigned.CreatedBy,
                    CreatedOn = Accounts.TodaysDate(),
                });
                db.SaveChanges();
            }
            else
            {
                return (message = sz.Serialize(new
                {
                    message = "member already assigned branch",
                    AssignedBranches = GetAssignedBranches(Convert.ToInt16(assigned.MemberID))
                }));
            }


            message = sz.Serialize(new
            {
                message = "success",
                AssignedBranches = GetAssignedBranches(Convert.ToInt16(assigned.MemberID))
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    private static IEnumerable<object> GetAssignedBranches(int memberID)
    {
        IEnumerable<object> retval = new List<object>();
        try
        {
            retval = db.AssignedBranches
                          .Where(i => i.MemberID == memberID)
                          .Select(i => new
                          {
                              i.ID,
                              i.MemberID,
                              i.MemberBranchID,
                              i.AssignedBranchID,
                              i.CreatedBy,
                              i.CreatedOn,
                              AssignedBranchName = db.Branches.Where(p => p.ID == i.AssignedBranchID).Select(p => p.Name).FirstOrDefault()
                          }).ToList();
        }
        catch (Exception)
        {


        }

        return retval;
    }
    [WebMethod]
    public static string GetMemberAssignedBranches(int memberID)
    {
        string message = sz.Serialize(new { message = "failed getting assigned branches" });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                AssignedBranches = GetAssignedBranches(memberID)
            });
        }
        catch (Exception ex)
        {


        }

        return message;
    }

    [WebMethod]
    public static string RemovedAssignedBranch(int ID)
    {
        string message = sz.Serialize(new { message = "failed removing branch" });
        try
        {
            db.AssignedBranches.Remove(db.AssignedBranches.Where(i => i.ID == ID).Select(i => i).FirstOrDefault());
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "success",
                // AssignedBranches = GetAssignedBranches(memberID)
            });
        }
        catch (Exception ex)
        {


        }

        return message;
    }
    [WebMethod]
    public static string AddBranchGroup(BranchesGroup item)
    {
        string message = sz.Serialize(new { message = "failed adding group" });
        try
        {
            if (item.BranchID == 0) return sz.Serialize(new { message = "Invalid branch" });
            if (item.BranchGroupingType == "Select grouping") return sz.Serialize(new { message = "Invalid branch" });
            if (item.BranchName == "Select branch") return sz.Serialize(new { message = "Invalid branch" });
            if (string.IsNullOrEmpty(item.GroupingName) || string.IsNullOrWhiteSpace(item.GroupingName)) return sz.Serialize(new { message = "Invalid grouping name entered" });
            var found = db.BranchGroupings
                            .Where(i => i.BranchID == item.BranchID)
                            .Where(i => i.BranchGroupingType == item.BranchGroupingType)
                            .Where(i => i.GroupingName == item.GroupingName)
                            .Where(i => i.BranchName == item.BranchName)
                            .Select(i => i).FirstOrDefault();
            if (found != null) return sz.Serialize(new { message = "Branch group already exist" });


            db.BranchGroupings.Add(new BranchGrouping()
            {

                BranchID = item.BranchID,
                BranchGroupingType = item.BranchGroupingType,
                GroupingName = item.GroupingName,
                BranchName = item.BranchName,

            });
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "success",
                result = db.BranchGroupings.OrderByDescending(i => i.ID).Select(i => i)
            });
        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetGroupBranches()
    {
        string message = sz.Serialize(new { message = "failed adding group" });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                result = db.BranchGroupings.OrderByDescending(i => i.ID).Select(i => i)
            });
        }
        catch (Exception)
        {


        }
        return message;

    }
    [WebMethod]
    public static string DeleteGroupBranches(int ID)
    {
        string message = sz.Serialize(new { message = "failed adding group" });
        try
        {
            db.BranchGroupings.Remove(db.BranchGroupings.Find(ID));
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "success",

            });
        }
        catch (Exception)
        {


        }
        return message;

    }
    [WebMethod]
    public static string GetMemberBranchGrouping()
    {
        string message = sz.Serialize(new { message = "failed adding group" });
        try
        {


            message = sz.Serialize(new
            {
                message = "success",
                result = db.BranchGroupings.OrderByDescending(i => i.ID).Select(i => i)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    [WebMethod]
    public static string AssignGroup(string groupName, int memberID)
    {
        string message = sz.Serialize(new { message = "failed assigning group" });
        try
        {
            //find the member and then update the groupingName column
            DistrictDBEntities districtDBEntities = new DistrictDBEntities();
            Member member = districtDBEntities.Members.Find(memberID);
            if (member == null) return message;
            member.AssignedBranchGroups = groupName;
            districtDBEntities.Entry(member).CurrentValues.SetValues(member);
            districtDBEntities.SaveChanges();
            //return all people with group assignment within
            //members branch
            var retval = (GetMemberAdministrativeBranches(memberID));
            //if (retval != null)
            //{
            //    retval = retval.GetType().GetProperty("result").GetValue(retval, null);
            //}
            message = sz.Serialize(new
            {
                message = "success",
                result = retval//sz.Deserialize<object>(GetMemberAdministrativeBranches(memberID))

            });

        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetMemberAdministrativeBranches(int memberID)
    {
        string message = sz.Serialize(new { message = "failed assigning group" });
        try
        {
            var mem = db.Members.Find(memberID);//.AssignedBranchGroups
            var query = db.Members.AsEnumerable().Where(i => i.BranchID == mem.BranchID)
                .Where(i => i.AssignedBranchGroups != string.Empty)
                .Where(i => i.AssignedBranchGroups != null)
                .OrderBy(i => i.LastName)
                .Select(i => new
                {
                    memberID = i.MemberID,
                    FullName = i.LastName + " " + i.FirstName,
                    GroupName = i.AssignedBranchGroups
                });
            message = sz.Serialize(new
            {
                message = "success",
                result = query
            });
        }
        catch (Exception)
        {


        }
        return message;

    }
    [WebMethod]
    public static string RemoveAssignedGroup(int memberID)
    {
        string message = sz.Serialize(new { message = "failed assigning group" });
        try
        {
            //REMOVE ASSIGNED GROUP ATTRIBUTE
            var member = db.Members.Find(memberID);
            member.AssignedBranchGroups = string.Empty;
            db.Entry(member).CurrentValues.SetValues(member);
            db.SaveChanges();
            message = sz.Serialize(new
            {
                message = "success",
                result = GetMemberAdministrativeBranches(memberID)
            });
        }
        catch (Exception)
        {


        }
        return message;
    }
    //////[WebMethod]
    //////public static string ForcePasswordReset()
    //////{
    //////    string message = "failed to reset passwords";
    //////    try
    //////    {
    //////        //update PasswordDate to today's date

    //////        db.ForcePasswordReset(null);
    //////        db.SaveChanges();
    //////        message = "success";
    //////    }
    //////    catch (Exception)
    //////    {


    //////    }
    //////    return message;
    //////}
    [WebMethod]
    public static string SetExpiryDate(int numdays)
    {
        string message = "failed to password change days";
        try
        {
            //check if expiry
            var config = db.Configurations.Where(i => i.Name == "PasswordExpiry").Select(i => i).FirstOrDefault();
            if (config == null)//configuration not set
            {
                db.Configurations.Add(new Configuration() { Name = "PasswordExpiry", Value = numdays.ToString() });
                db.SaveChanges();
            }
            else
            {
                var ctx = new DistrictDBEntities();
                var match = ctx.Configurations.Find(config.ID);
                match.Value = numdays.ToString();
                ctx.Entry(match).CurrentValues.SetValues(match);
                ctx.SaveChanges();
                message = "success";
            }
        }
        catch (Exception ex)
        {


        }
        return message;
    }
    [WebMethod]
    public static string GetDistrictAndAreas()
    {
        string message = sz.Serialize(new { message = "failed" });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                result = db.BranchGroupings.Select(i => new
                {
                    i.BranchGroupingType,
                    i.GroupingName,
                    i.BranchName,
                    i.BranchID,
                    i.ID,
                }),

                Areas = db.Areas
                .OrderBy(i => i.Name)
                .Select(p => new
                {
                    ID = p.ID,
                    Name = p.Name,
                    Districts = db.Districts.Where(i => i.AreaID == p.ID).OrderBy(i => i.Name).Select(i => new
                    {
                        Name = i.Name,
                        ID = i.ID,

                    })
                }),
            });
        }
        catch (Exception)
        {

            throw;
        }
        return message;
    }
    [WebMethod]
    public static string GetLocals(int areaID, int distID)
    {
        string message = sz.Serialize(new { message = "failed" });
        try
        {
            message = sz.Serialize(new
            {
                message = "success",
                result = db.Branches
                .Where(i => i.AreaID == areaID)
                .Where(i => i.DistrictID == distID)
                .OrderBy(i=>i.Name)
                .Select(i => new {
                    i.ID,
                    i.Name,
                    i.AreaID,
                    i.DistrictID
                    
                })

            });
        }
        catch (Exception)
        {

            //throw;
        }
        return message;
    }
}
public class BranchesGroup
{
    public int ID { get; set; }
    public int BranchID { get; set; }
    public string BranchGroupingType { get; set; }
    public string GroupingName { get; set; }
    public string BranchName { get; set; }
}
public class AssignedToBranchproperties
{
    public int? ID { get; set; }
    public int? MemberID { get; set; }
    public int? MemberBranchID { get; set; }
    public int? AssignedBranchID { get; set; }
    public int? CreatedBy { get; set; }
    public int? CreatedOn { get; set; }
}