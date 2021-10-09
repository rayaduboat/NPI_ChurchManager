using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PasswordReset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void buttonSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            // validate credentials
            string memberID = textboxMemberID.Text;
            string email = textboxEmail.Text;
            string password = textboxPassword.Text;
            string confirmpassword = textboxConfirmpassword.Text;
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrEmpty(email)) return;
            if (string.IsNullOrWhiteSpace(password) || string.IsNullOrEmpty(password)) return;
            if (string.IsNullOrWhiteSpace(confirmpassword) || string.IsNullOrEmpty(confirmpassword)) return;

            if (password != confirmpassword) throw new Exception("Password entered and confirmed password dont match");
            bool success = UpdateLoginAccount(int.Parse(memberID), password);
            if (success) Response.Redirect("Default.aspx");

        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+ ex.Message + "');", true);

        }
    }
    public static bool UpdateLoginAccount(int MemberID, string password)
    {
        bool message = false;
        try
        {
 
            DistrictDBEntities mycontext = new DistrictDBEntities();
            Member entity = mycontext.Members.Find(MemberID);
            
            entity.Password = Accounts.Hashed.HashPassword(password);
            entity.PasswordDate = Accounts.TodaysDate();
            
            mycontext.Entry(entity).CurrentValues.SetValues(entity);
            mycontext.SaveChanges();

            message = true;
        }
        catch (Exception)
        {

            // throw;
        }
        return message;
    }

}