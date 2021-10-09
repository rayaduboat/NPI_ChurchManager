using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgottenPassword : System.Web.UI.Page
{
    public static Uri Url { get;  set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        Url = this.Request.Url;
    }
    [WebMethod]
    public static object sendReminder(string email)
    {
        //check if user exist
        //if user has email address then send him a new password
        //to login
        PasswordService passwordService = new PasswordService();
        passwordService.Url = Url;
        var response= passwordService.SendEmailReminder(email);
        return new {Data= response, error="" };
    }
}