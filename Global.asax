<%@ Application Language="C#" %>

<script runat="server">
    void Application_MapRequestHandler(object sender, EventArgs e)
    {
        Application.Add(Guid.NewGuid().ToString(),((System.Web.HttpApplication)sender).Request.FilePath);
        if (Application.Keys.Count>0)
        {
            var val = Application.Contents.Contents.Keys.Count;
        }
    }
    void Application_EndRequest(object sender, EventArgs e)
    {
        try
        {

            var type = (global_asax)sender;
            type.Response.AddHeader("Access-Control-Allow-Origin", "*");
            
        }
        catch (Exception)
        {


        }
    }
    void Application_Start(object sender, EventArgs e)
    {
        var type =  sender;
        //type.Request.Cookies.Add(new HttpCookie("login", DateTime.Now.ToShortDateString()));
        // Code that runs on application startup
        // Application["endDate"] =  new DateTime(2018,05,24);

    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

        //TimeSpan ts=  DateTime.Now.Subtract((DateTime)Application["start"]);
    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.
        //TimeSpan ts=  DateTime.Now.Subtract((DateTime)Application["start"]);
    }

</script>
