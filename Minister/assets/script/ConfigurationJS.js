var $config = $config || {};
$config.NewClient = function () {
    this.obj = {
        Name	      : $("#textboxName")        .val(),
        Logo	      : $("#textboxLogo")        .val(),
        Slogan	      : $("#textboxSlogan")      .val(),
        Twitter	      : $("#textboxTwitter")     .val(),
        Facebook	  : $("#textboxFacebook")    .val(),
        Yahoo	      : $("#textboxYahoo")       .val(),
        Instagram	  : $("#textboxInstagram")   .val(),
        Hangout	      : $("#textboxHangout")     .val(),
        PanelCaption  : $("#textboxPanelCaption").val(),
        PanelTitle	  : $("#textboxPanelTitle")  .val(),
        Theme         : $("#textboxPanelTheme").val(),
        Youtube       : $("#textboxYoutube").val(),
        PasswordExpiry:60
    }
    this.Configuration = function () {
        try {

       
        if (this.obj.Name        .trim().length==0) {$("#textboxName")        .focus();          throw new $rab.Exception( "oops error please enter Name        ");return;}
        if (this.obj.Logo        .trim().length==0) {$("#textboxLogo")        .focus();          throw new $rab.Exception( "oops error please enter Logo        ");return;}
        if (this.obj.Slogan      .trim().length==0)   {$("#textboxSlogan")      .focus();        throw new $rab.Exception( "oops error please enter Slogan      ");return;}
        if (this.obj.Twitter     .trim().length==0)    {$("#textboxTwitter")     .focus();       throw new $rab.Exception( "oops error please enter Twitter     ");return;}
        if (this.obj.Facebook    .trim().length==0)     {$("#textboxFacebook")    .focus();      throw new $rab.Exception( "oops error please enter Facebook    ");return;}
        if (this.obj.Yahoo       .trim().length==0)  {$("#textboxYahoo")       .focus();         throw new $rab.Exception( "oops error please enter Yahoo       ");return;}
        if (this.obj.Instagram   .trim().length==0)      {$("#textboxInstagram")   .focus();     throw new $rab.Exception( "oops error please enter Instagram   ");return;}
        if (this.obj.Hangout     .trim().length==0)    {$("#textboxHangout")     .focus();       throw new $rab.Exception( "oops error please enter Hangout     ");return;}
        if (this.obj.PanelCaption.trim().length==0)         {$("#textboxPanelCaption").focus();  throw new $rab.Exception( "oops error please enter PanelCaption");return;}
        if (this.obj.PanelTitle  .trim().length==0)       {$("#textboxPanelTitle")  .focus();    throw new $rab.Exception( "oops error please enter PanelTitle  ");return;}
        if (this.obj.Theme       .trim().length == 0)         {$("#textboxPanelTheme")  .focus();throw new $rab.Exception( "oops error please enter Theme       ");return;}
        if (this.obj.Youtube.trim().length == 0)                 { $("#textboxYoutube").focus(); throw new $rab.Exception("oops error please enter Youtube       "); return; }
        //validate entries
        new $rab.Server.Method().BeginInvoke("Configuration.aspx/CreateClientConfiguration", { config: this.obj }, function (jsondata) {
            try {
                // if success redirect user to management panel
                if (jsondata == 'success') {
                    alert("Configuration setup successfully please login");
                   
                    location.assign("../Default.aspx");
                    localStorage.removeItem("User");
                } else {
                    throw new "failed setting up configuration";
                }
            } catch (e) {

            }
        })
        } catch (e) {
            alert(e.message);
        }
    }
        
}