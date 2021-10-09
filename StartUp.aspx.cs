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

    }
    //
    // TODO: Add constructor logic here
    //

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
                                      {
                                          Config = db.Configurations.Select(i => i),
                                          ClientsInfo = db.Clients.Select(i => i),// carry across customer information
                                          BranchID = match.BranchID,
                                          LoginSuccessful = "successfully logged in",
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
                                          EmailAddress = match.EmailAddress,
                                          BranchName = db.Branches.Where(i => i.ID == match.BranchID).Select(i => i.Name).FirstOrDefault(),
                                          Permissionset = db.LoginPermissionSets.Where(i => i.MemberID == match.MemberID).Select(i => i.PagePermission)

                                      }).FirstOrDefault();
            if (foundMember == null) throw new Exception(message);
            //////var admins = db.Sp_ValidateUserCredentials(emailAddress, Hashed.HashPassword(password), churchName, new System.Data.Objects.ObjectParameter("message", ""));
            DataContractJsonSerializer deserializer = new DataContractJsonSerializer(typeof(PiwcMember));
            JavaScriptSerializer js = new JavaScriptSerializer();
            message = js.Serialize(foundMember);
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


    protected void ButtonPassword_Click(object sender, EventArgs e)
    {
        try
        {
            string email = TextBoxEmail.Text;
            string password = TextBoxPassword.Text;
            if (string.IsNullOrEmpty(email) || string.IsNullOrWhiteSpace(email)) return;
            if (string.IsNullOrEmpty(password) || string.IsNullOrWhiteSpace(password)) return;
            string hashedpassword = Hashed.HashPassword(password);
            Member user = new DistrictDBEntities().Members
                 .Where(i => i.EmailAddress == email)
                 .Where(i => i.Password == hashedpassword)
                 .Select(i => i).FirstOrDefault();
            if (user == null) throw new Exception("Invalid credentials passed");
            else if (user != null)
            {
                //call javascript method to pass credentials
                //save credentials in session state to allow smoth pages navigation
                var query=new JavaScriptSerializer().Serialize(new LoggedInUser()
                {
                  BranchID=  user.BranchID,
                  MemberID=  user.MemberID,
                  FirstName=  user.FirstName,
                  LastName = user.LastName
                });
                Session["User"] = query;
                //call a javascript function to save user credentials
                ClientScript.RegisterStartupScript(this.GetType(), "alertMessage", "(function(){localStorage.setItem('user', 'bobbie');})()", true);
                Response.Redirect("Minister/ManagementList.aspx");
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "alertMessage", "alert('" + ex.Message + "')", true);

        }

    }
}

public class LoggedInUser
{
    
      public dynamic  BranchID {get;set;}
      public dynamic  MemberID {get;set;}
      public dynamic  FirstName{get;set;}
      public dynamic  LastName { get; set; }
    
}