using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AttendanceReportModel
/// </summary>
public class AttendanceReportModel
{
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Temperature { get; set; }
    public string ActivityName { get; set; }
    public string AttendDate { get; set; }
    public string BranchName { get; set; }
    public string Telephone { get; set; }
    public int TotalMembers { get; set; }
}
