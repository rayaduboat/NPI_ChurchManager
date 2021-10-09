using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class PiwcMember
{
    public int MemberID { get; set; }

    public string Title { get; set; }

    public string FirstName { get; set; }

    public string LastName { get; set; }

    public int BranchId { get; set; }
    public int BranchID { get; set; }
    public string DOB { get; set; }

    public string AddressLineOne { get; set; }

    public string AddressLineTwo { get; set; }

    public string PostCode { get; set; }

    public string Country { get; set; }

    public string MembershipType { get; set; }

    public string Telephone { get; set; }

    public string EmailAddress { get; set; }
    public string BranchName { get; set; }
    public string LoginType { get; set; }
    public string LoginSuccessful { get; set; }
    public IQueryable<string> Permissionset { get; set; }
    public IQueryable<Client> ClientsInfo { get; set; }
    public IQueryable<Configuration> Config { get; set; }
    public IEnumerable<object> AssignedBranches { get;   set; }
    public object AssignedBranchGroups { get;  set; }
    public int? PasswordDate { get; set; }
    public int? AreaID { get; set; }
    public int? DistrictID { get; set; }
    public int? ThemeID { get; set; }
}
