//renders navigation allowed
$(function () {
    try {
        //check if login user has pages assigned
        //render links assigned to user
        //if user navigate perform validation
        //before navigating
        if ($rab.Login.User.LoginType == 'SuperUser')
            new $rab.pages().renderAll();
        else {
            new $rab.pages().render_assigned();
        }
    } catch (e) {

    }
})
var pages = {
    urls: [
        
        {
            address: "Appointment.aspx",
            heading: "Appointment",
            text: "manage church appointment"
        }
        ,
        {
            address: "Attendance.aspx",
            heading: "Attendance",
            text: "manage activity attendance"
        }
        ,
        {
            address: "Accounts.aspx",
            heading: "Accounts",
            text: "manage login/branch accounts"
        }
        ,
        {
            address: "Baptism.aspx",
            heading: "Baptism",
            text   : "manage member baptisms"
        }
         
        ,
        {
            address: "Events.aspx",
            heading: "Events",
            text: "events organised"
        }
        ,
        {
            address: "Followup.aspx",
            heading: "Followup",
            text: "follow up on members"
        }
        ,
        {
           address: "Reports.aspx",
            heading: "Reports",
           text: "document and manage report"
        }
        ,
        {
            address: "MembershipList.aspx",
            heading: "Membership List",
            text: "manage church membership"
        }
        ,
        {
            address: "WeeklyServiceReport.aspx",
            heading: "Weekly service report",
            text:"take service notes"
        }
         
    ]
}
$rab.pages = function () {
    this.navcontainer = $('#navlist');
    this.create_anchor_tag = function (link) {

        var ahtml =  "<div  class='row' title='"+link.text+"'>";
            ahtml += "<div class='col-sm-3'><img class='img img-thumbnail' style='width:40px;height:40px;' src='assets/pagesImages/management/"+link.heading.toLocaleLowerCase()+".png' alt='#'/></div>";
            ahtml += "<div class='col-sm-9'> "+link.heading+" </div>";
            ahtml += "</div>";

        var a = document.createElement('a');
        a.href = link.address;
        a.className = 'list-group-item m-1 ';
        a.style.borderRadius = "3px 4px";
        a.style.backgroundColor = '#38989b';
        a.style.color = 'white'
        a.style.fontSize = '18pt';
        a.innerHTML = ahtml;
        return a;
    }
    this.renderAll = function() {
        //render all pages
        $(this.navcontainer).empty();
         
        for (var i = 0; i < pages.urls.length; i++) {
            var a = this.create_anchor_tag(pages.urls[i])
            this.navcontainer.append(a)
        }
    }
    this.render_assigned = function () {
        $(this.navcontainer).empty();

        //look through pages assigned to member
        var user_pages = $rab.Login.User.Permissionset;
        if (user_pages.length == 0)
        {
            this.nopages_assigned();
            return;
        }
        else {
            this.renderPages(user_pages);
        }
    }
    this.nopages_assigned = function () {
        var message = {
            address: "#",
            heading: "No assigned pages",
            text: "you dont have any pages assigned"
        }
        var a = this.create_anchor_tag(message);
        this.navcontainer.append(a);
    }
    this.renderPages = function (user_pages) {

        for (var i = 0; i < user_pages.length; i++) {
            //find page in urls and render link
           var match= pages.urls.filter(function (url) {
               return url.heading.toLocaleLowerCase() == user_pages[i].toLocaleLowerCase();
           })
            match.forEach(function (value,index) {
                var page_rendering = new $rab.pages();
                var link = page_rendering.create_anchor_tag(value);
                page_rendering.navcontainer.append(link);
            })
        }
    }
}