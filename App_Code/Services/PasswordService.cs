using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.ServiceModel.Activities;
using System.Web;


/// <summary>
/// Summary description for PasswordService
/// </summary>
public class PasswordService
{
    private DistrictDBEntities ctx;
    
    private string PASSWORD_RESET_BODY;
    private string PASSWORD_RESET_TITLE="Rabant Church Manager Password Reset";
    private string password;

    public Uri Url { get; set; }

    public PasswordService()
    {
        password = "Password" +Guid.NewGuid().ToString().Substring(0,4);

        //
        // TODO: Add constructor logic here
        //
    }

    public string SendEmailReminder(string email)
    {
        Member match = Find(email);
        if (match == null) return "Email address unrecognised";
        var success= UpdatePassword(match);
        if (success) Send(email);
        return string.Format("Password sent to your {0} email address",email);
    }

    private bool UpdatePassword(Member match)
    {
        ctx = new DistrictDBEntities();
        var found=ctx.Members.Find(match.MemberID);
        var passwordHashed = Accounts.Hashed.HashPassword(password);
        found.Password = passwordHashed;
        ctx.Entry<Member>(found).CurrentValues.SetValues(found);//.State = System.Data.Entity.EntityState.Modified;
        ctx.SaveChanges();
        return true;
    }

    private bool Send(string email)
    {
        var issuccess = false;
        try
        {
            var accountEmail = ConfigurationManager.AppSettings["accountemail"].ToString();
            MailMessage mMsg = new MailMessage(accountEmail, email);

            mMsg.Subject = PASSWORD_RESET_TITLE;
           
            string message= "You recently made a request to reset your old password, please find below your new password.\n";
            message+= string.Format("Your new password is \n{0}", password);
            message += "\nLogin into your account with your email address and password provided\n";
            message += string.Format("{0}", ConfigurationManager.AppSettings["webaddress"].ToString());
            mMsg.Body = message;
            mMsg.IsBodyHtml = false;
            SmtpClient smtpClient = new SmtpClient();

            smtpClient.Send(mMsg);
            issuccess = true;
        }
        catch (Exception)
        {

            return issuccess;
        }
        return issuccess;
    }

    private Member Find(string email)
    {
        ctx = new DistrictDBEntities();
        return ctx.Members.FirstOrDefault(member => member.EmailAddress.ToLower() == email.ToLower());
    }
}