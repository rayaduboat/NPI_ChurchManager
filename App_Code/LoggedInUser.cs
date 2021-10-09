using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
public class LoggedInUser
{
    public LoggedInUser()
    {
    }

    public int BranchID { get; set; }
    public int MemberID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string LoginType { get; set; }
}