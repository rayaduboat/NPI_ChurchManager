using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Minister_Configuration : System.Web.UI.Page
{
    static JavaScriptSerializer sz = new JavaScriptSerializer();
    static string message = string.Empty;
    static DistrictDBEntities db = new DistrictDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            //get the logged in user
            if (Session["User"] == null) Response.Redirect("../default.aspx");
            JavaScriptSerializer sz = new JavaScriptSerializer();
            var user = sz.Deserialize<LoggedInUser>(Session["User"].ToString());
        }
        catch (Exception)
        {


        }
    }
    [WebMethod]
    public static string CreateClientConfiguration(ConfigurationSettings config)
    {
        message = "failed setting up configuration";
        try
        {
            //validate all the entries

            //if (string.IsNullOrEmpty(config.Name) || string.IsNullOrWhiteSpace(config.Name)) return message;
            //if (string.IsNullOrEmpty(config.Logo) || string.IsNullOrWhiteSpace(config.Logo)) return message;
            //if (string.IsNullOrEmpty(config.Slogan) || string.IsNullOrWhiteSpace(config.Slogan)) return message;
            //if (string.IsNullOrEmpty(config.Twitter) || string.IsNullOrWhiteSpace(config.Twitter)) return message;
            //if (string.IsNullOrEmpty(config.Facebook) || string.IsNullOrWhiteSpace(config.Facebook)) return message;
            //if (string.IsNullOrEmpty(config.Yahoo) || string.IsNullOrWhiteSpace(config.Yahoo)) return message;
            //if (string.IsNullOrEmpty(config.Instagram) || string.IsNullOrWhiteSpace(config.Instagram)) return message;
            //if (string.IsNullOrEmpty(config.Hangout) || string.IsNullOrWhiteSpace(config.Hangout)) return message;
            //if (string.IsNullOrEmpty(config.PanelCaption) || string.IsNullOrWhiteSpace(config.PanelCaption)) return message;
            //if (string.IsNullOrEmpty(config.PanelTitle) || string.IsNullOrWhiteSpace(config.PanelTitle)) return message;
            //if (string.IsNullOrEmpty(config.Theme) || string.IsNullOrWhiteSpace(config.Theme)) return message;

            //Client cl = new Client()
            //{
            //    Name            =config.Name	    ,
            //    Logo            =config.Logo	    ,
            //    Slogan          =config.Slogan	    ,
            //    Twitter         =config.Twitter	    ,
            //    Facebook        =config.Facebook	,
            //    Yahoo           =config.Yahoo	    ,
            //    Instagram       =config.Instagram	,
            //    Hangout         =config.Hangout	    ,
            //    PanelCaption    =config.PanelCaption,
            //    PanelTitle = config.PanelTitle,
            //    Theme           =config.Theme       ,
            //};
            db.Configurations.Add(new Configuration() { Name = "Name", Value = config.Name });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Logo", Value = config.Logo });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Slogan", Value = config.Slogan });
            db.SaveChanges();

            db.Configurations.Add(new Configuration() { Name = "Twitter", Value = config.Twitter });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Facebook", Value = config.Facebook });
            db.SaveChanges();

            db.Configurations.Add(new Configuration() { Name = "Yahoo", Value = config.Yahoo });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Instagram", Value = config.Instagram });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Hangout", Value = config.Hangout });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "PanelCaption", Value = config.PanelCaption });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "PanelTitle", Value = config.PanelTitle });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Theme", Value = config.Theme });
            db.SaveChanges();
            db.Configurations.Add(new Configuration() { Name = "Youtube", Value = config.Youtube });
            db.SaveChanges();
            message = "success";
        }
        catch (Exception ex)
        {

            // throw;
        }
        return message;
    }

    protected void buttonSaveConfiguration_Click(object sender, EventArgs e)
    {
        try
        {
            if (this.IsPostBack)
            {
                //validate credentials
                var items = new
                {
                    Name = textboxName.Text,
                    //Logo = FileUpload1.PostedFile.FileName,
                    Slogan = textboxSlogan.Value,
                    Twitter = textboxTwitter.Value,
                    Facebook = textboxFacebook.Value,
                    Yahoo = textboxYahoo.Value,
                    Instagram = textboxInstagram.Value,
                    Hangout = textboxHangout.Value,
                    PanelCaption = textboxPanelCaption.Value,
                    PanelTitle = textboxPanelTitle.Value,
                    Theme = textboxPanelTheme.Value,
                    Youtube = textboxYoutube.Value,

                };
                if (string.IsNullOrEmpty(items.Name) || string.IsNullOrWhiteSpace(items.Name)) return;
                //if (string.IsNullOrEmpty(items.Logo        ) || string.IsNullOrWhiteSpace(items.Logo        )) return;
                if (string.IsNullOrEmpty(items.Slogan) || string.IsNullOrWhiteSpace(items.Slogan)) return;
                if (string.IsNullOrEmpty(items.Twitter) || string.IsNullOrWhiteSpace(items.Twitter)) return;
                if (string.IsNullOrEmpty(items.Facebook) || string.IsNullOrWhiteSpace(items.Facebook)) return;
                if (string.IsNullOrEmpty(items.Yahoo) || string.IsNullOrWhiteSpace(items.Yahoo)) return;
                if (string.IsNullOrEmpty(items.Instagram) || string.IsNullOrWhiteSpace(items.Instagram)) return;
                if (string.IsNullOrEmpty(items.Hangout) || string.IsNullOrWhiteSpace(items.Hangout)) return;
                if (string.IsNullOrEmpty(items.PanelCaption) || string.IsNullOrWhiteSpace(items.PanelCaption)) return;
                if (string.IsNullOrEmpty(items.PanelTitle) || string.IsNullOrWhiteSpace(items.PanelTitle)) return;
                if (string.IsNullOrEmpty(items.Theme) || string.IsNullOrWhiteSpace(items.Theme)) return;
                if (string.IsNullOrEmpty(items.Youtube) || string.IsNullOrWhiteSpace(items.Youtube)) return;



                ConfigurationSettings config = new ConfigurationSettings();
               // string file = new FileInfo(items.Logo).Name;
               // string path = Server.MapPath("~/Minister/assets/images/") + file;
                //string host = Request.Url.Host;
                config.Name = items.Name;
                config.Logo        = "assets/images/logo.png";
                config.Slogan = items.Slogan;
                config.Twitter = items.Twitter;
                config.Facebook = items.Facebook;
                config.Yahoo = items.Yahoo;
                config.Instagram = items.Instagram;
                config.Hangout = items.Hangout;
                config.PanelCaption = items.PanelCaption;
                config.PanelTitle = items.PanelTitle;
                config.Theme = items.Theme;
                config.Youtube = items.Youtube;
                string retval = CreateClientConfiguration(config);
                if (retval == "success")
                {
                    // FileUpload1.SaveAs(path);
                    Response.Redirect("../Default.aspx");
                }
                else
                {
                    throw new Exception (retval);
                }


            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "alert('"+ex.Message+"');", true);
            //throw;
        }
      

    }
}

public class ConfigurationSettings
{
    
    public string Name          {get;set;} 
    public string Logo          {get;set;}
    public string Slogan        {get;set;}
    public string Twitter       {get;set;}
    public string Facebook      {get;set;}
    public string Yahoo         {get;set;}
    public string Instagram     {get;set;}
    public string Hangout       {get;set;}
    public string PanelCaption  {get;set;}
    public string PanelTitle    {get;set;}
    public string Theme         { get; set; }
    public string Youtube       { get; set; }
    
}