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

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Application.Lock();
        //int totaldaysleft = ((DateTime)Application["endDate"]).Subtract(DateTime.Now).Days;
         
        //Application.UnLock();

        //if (totaldaysleft == 25) Response.Redirect("http://www.rabantsolutions.com");
    }
    //
    // TODO: Add constructor logic here
    //
    [WebMethod]
    public static string IsValidEmail(string email)
    {
        string isValid = "false";
        try
        {
            //new ServiceRepository.DistrictDBEntities().
            isValid = new DistrictDBEntities().Members.Where(i => i.EmailAddress == email).Select(i => i.EmailAddress).FirstOrDefault();
            if (isValid != null) return "true";

        }
        catch (Exception ex)
        {


        }
        return isValid;
    }
    [WebMethod]
    public static string ValidateCredentials(string email, string pwd)
    {
        string message = "Invalid credentials or member not known";
        try
        {

            //string churchName = "Pentecost";

            DistrictDBEntities db = new DistrictDBEntities();
            string pass = Hashed.HashPassword(pwd);
            PiwcMember foundMember = (from match in db.Members
                                      where (match.EmailAddress == email && match.Password == pass)
                                      select new PiwcMember()
                                      {   Config=db.Configurations.Select(i=>i),
                                          AssignedBranchGroups = db.BranchGroupings
                                          .Where(i=>i.GroupingName==match.AssignedBranchGroups)
                                          .OrderBy(i=>i.BranchName)
                                          .Select(i=>new {
                                              BranchID=i.BranchID,
                                              BranchName=i.BranchName
                                          }),
                                          AssignedBranches=new string[] { },
                                          AreaID                                        =match.AreaID,
                                          DistrictID                                       =match.DistrictID,
                                          BranchID                                        =match.BranchID,
                                          LoginSuccessful                                       ="successfully logged in",
                                          LoginType                                       =match.LoginType,
                                          MemberID                                        = match.MemberID,
                                          Title                                        = match.Title,
                                          FirstName                                        = match.FirstName,
                                          LastName                                        = match.LastName,
                                          BranchId                                        = match.BranchID,
                                          DOB                                        = match.DOB,
                                          ThemeID                                    = match.ThemeID,
                                          AddressLineOne                                        = match.AddressLineone,
                                          AddressLineTwo                                        = match.Addresslinetwo,
                                          PostCode                                        = match.PostCode,
                                          Country                                        = match.Country,
                                          MembershipType                                        = match.MembershipType,
                                          Telephone                                        = match.Telephone,
                                          PasswordDate                                        = match.PasswordDate,
                                          EmailAddress                                        = match.EmailAddress,
                                          BranchName                                        = db.Branches.Where(i => i.ID == match.BranchID).Select(i => i.Name).FirstOrDefault(),
                                          Permissionset                                       =db.LoginPermissionSets.Where(i=>i.MemberID==match.MemberID).Select(i=>i.PagePermission)
                                          
                                      }).FirstOrDefault();
            if (foundMember == null) throw new Exception(message);
            //////var admins = db.Sp_ValidateUserCredentials(emailAddress, Hashed.HashPassword(password), churchName, new System.Data.Objects.ObjectParameter("message", ""));
            DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(PiwcMember));
            JavaScriptSerializer js = new JavaScriptSerializer();
            message=js.Serialize(foundMember);
        }
        catch (System.Exception ex)
        {
            // message = ex.Message;
            //loginMessagectl.InnerHtml = "<h3>Invalid email address or password</h3>";
        }
        return message;
    }




    /// <summary>
    /// password algorithm for rabkenant
    /// </summary>
    public static class Hashed
    {

        public static string HashPassword(string Password)
        {
            byte[] PasswordText;
            PasswordText = ASCIIEncoding.Unicode.GetBytes(Password);
            string Result;

            SHA256Managed FinalHash = new SHA256Managed(); //.ComputeHash(PasswordText);
            Result = Convert.ToBase64String(FinalHash.ComputeHash(PasswordText));
            //string salt = Hashed.TheSalt();
            // return Hashed.SaltedHash(Password, salt);
            return (Result);
        }
    }
    [WebMethod]
    public string GetMembers(string branchName)
    {
        string message = "failed getting membership list ";
        try
        {
            CappedMembers[] returnValue = { };
            {
                DistrictDBEntities db = new DistrictDBEntities();
                // look for branch name 

                switch (branchName)
                {
                    case "P.I.W.C Northampton":
                        returnValue = db.Members.Where(i => i.BranchID == 1016).Select(i => new CappedMembers
                        {
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Telephone = i.Telephone,
                            Email = i.EmailAddress
                        }).ToArray();
                        break;
                    case "Kettering PIWC":
                        returnValue = db.Members.Where(i => i.BranchID == 1016).Select(i => new CappedMembers
                        {
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Telephone = i.Telephone,
                            Email = i.EmailAddress
                        }).ToArray();
                        break;
                    case "Northampton Akan Assembly":
                        returnValue = db.Members.Where(i => i.BranchID == 1016).Select(i => new CappedMembers
                        {
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Telephone = i.Telephone,
                            Email = i.EmailAddress
                        }).ToArray();
                        break;
                    case "Kettering Assembly":
                        returnValue = db.Members.Where(i => i.BranchID == 1016).Select(i => new CappedMembers
                        {
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Telephone = i.Telephone,
                            Email = i.EmailAddress
                        }).ToArray();
                        break;
                    case "Wellingborough Assembly":
                        returnValue = db.Members.Where(i => i.BranchID == 1016).Select(i => new CappedMembers
                        {
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Telephone = i.Telephone,
                            Email = i.EmailAddress
                        }).ToArray();
                        break;
                    default:
                        break;
                }

                JavaScriptSerializer sr = new JavaScriptSerializer();
                if (returnValue.Length > 0)
                    message = sr.Serialize(returnValue);

            }
        }
        catch (Exception)
        {

            //throw;
        }

        return message;
    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
         
            
            //try
            //{
            //    string email = textboxEmail.Text;
            //    string password = textboxPassword.Text;
            //    if (string.IsNullOrEmpty(email) || string.IsNullOrWhiteSpace(email)) return;
            //    if (string.IsNullOrEmpty(password) || string.IsNullOrWhiteSpace(password)) return;
            //    string hashedpassword = Hashed.HashPassword(password);
            //    Member user = new DistrictDBEntities().Members
            //         .Where(i => i.EmailAddress == email)
            //         .Where(i => i.Password == hashedpassword)
            //         .Select(i => i).FirstOrDefault();
            //    if (user == null) throw new Exception("Invalid credentials passed");
            //    else if (user != null)
            //    {
            //        //call javascript method to pass credentials
            //        //save credentials in session state to allow smoth pages navigation
            //        var query = new JavaScriptSerializer().Serialize(new LoggedInUser()
            //        {
            //            BranchID = user.BranchID,
            //            MemberID = user.MemberID,
            //            FirstName = user.FirstName,
            //            LastName = user.LastName,
            //            LoginType=user.LoginType,
            //        });
            //        Session["User"] = query;
            //    //call a javascript function to save user credentials
            //    //ClientScript.RegisterStartupScript(this.GetType(), "alertMessage", "(function(){localStorage.setItem('user', 'bobbie');})()", true);
            //    Response.Redirect("Minister/ManagementList.aspx"); 
            //    }
            //}
            //catch (Exception ex)
            //{
            //   new Utilities().MsgBox(ex.Message,this);

            //}
         
    }
}
public class CappedMembers
{
    public string LastName { get; set; }

    public string FirstName { get; set; }

    public string Telephone { get; set; }

    public string Email { get; set; }
}
